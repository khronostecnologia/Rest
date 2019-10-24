unit Controller.ApuracaoICMSST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, biblKhronos,DateUtils,
  FireDAC.Comp.Client,Data.DB;

type
  TControllerApuracaoICMSST = class
  private
    FView      : TForm;
    FModel     : TDataModule;
    FMensagem  : String;
    FQry       : TFDQuery;
    procedure SetMensagem(const Value: String);
    function  GetMensagem : String;
    procedure GeraRegistro10(pMes,pAno : String; pFinalidadeSintegra: TFinalidadeSintegra);
    procedure GerarRegistro88STES(pCNPJ,pDatInv,pDatIni,pDatFin : String);
    procedure GerarRegistro88STITNF(pCNPJ,pDatIni,pDatFin : String);
    procedure GeraRegistro11;
  public
    function ValidadoDadosBasicos:Boolean;
    function  GerarSintegra(pFinalidadeSintegra: TFinalidadeSintegra) : Boolean;
    procedure ProcessarSintegra(pFinalidadeSintegra : TFinalidadeSintegra);
    procedure DefineNomeArqSint(pCNPJ,pMes,pAno : String);
    procedure GerarArquivoSEF;
    constructor create(pView: TForm; pModel : TDataModule);
    property Mensagem : String read GetMensagem write SetMensagem;
  end;

implementation

{ TControllerApuracaoICMSST }

Uses uApuracaoICMSST, uDMApuracaoICMSST,uDMBase,uMensagem,ACBrSintegra;

constructor TControllerApuracaoICMSST.create(pView: TForm; pModel : TDataModule);
begin
  inherited create;
  FView   := pView;
  FModel  := pModel;
end;

procedure TControllerApuracaoICMSST.DefineNomeArqSint(pCNPJ,pMes,pAno : String);
Const
  PreFixoArq = '\Sint_';
var
  vDir : String;
begin
  vDir := dmPrincipal.DirRaizApp + 'Sintegra';

  if not DirectoryExists(vDir) then
  ForceDirectories(vDir);

  TFrmApuracao(FView).ACBrSintegra.FileName := vDir + PreFixoArq + pCNPJ + '_' + pMes + pAno + '.txt';
end;

procedure TControllerApuracaoICMSST.GerarArquivoSEF;
Const
  cPasta   = '\SEF\SEF_';
  cDelimit = '|';
var
  vLstSEF      : TStringList;
  vDirSaveArq  : String;
  vLinha       : String;
  vCNPJ        : String;
  vMes         : String;
  vAno         : String;

  procedure AddLinhaMontada(pTexto : String);
  begin
    vLstSEF.Add(pTexto);
  end;

  procedure MontaLinha(pTexto : String);
  begin
    vLinha := vLinha + pTexto + cDelimit;
  end;

  procedure CriaArqSEF;
  begin
    vLstSEF.SaveToFile(vDirSaveArq);
  end;

begin
  try
    vLstSEF     := TStringList.Create;
    vCNPJ       := TFrmApuracao(FView).EdtCodPart.Text;
    vMes        := TFrmApuracao(FView).cmbMes.Text;
    vAno        := TFrmApuracao(FView).CmbAno.Text;
    vDirSaveArq := dmPrincipal.DirRaizApp + cPasta + vCNPJ + vMes + vAno;
    try
      MontaLinha('ARQUIVO SEF');
      AddLinhaMontada(vLinha);
      CriaArqSEF;
    except
      raise;
    end;
  finally
    FreeAndNil(vLstSEF);
  end;
end;

procedure TControllerApuracaoICMSST.GerarRegistro88STES(pCNPJ,pDatInv,pDatIni,pDatFin : String);
var
  vReg88STES     : TRegistro88STES;
  vQryInventario : TFDMemTable;
  vSQL           : String;
begin
  {Estoques de Produtos ao Regime de Substituição Tributária}
  try
    vSQL            := TDmApuracaoICMSST(FModel).GetSQL88STES(pDatIni,pDatFin,pCNPJ);
    vQryInventario  := TDmApuracaoICMSST(FModel).GetQryTemp;
    dmPrincipal.BancoExec.ExecSQL(vSQL,TDataSet(vQryInventario));

    if vQryInventario.IsEmpty then
    exit;

    vQryInventario.DisableControls;
    vQryInventario.First;
    while not vQryInventario.Eof do
    begin
      vReg88STES := TRegistro88STES.Create;
      with vReg88STES do
      begin
        CNPJ            := pCNPJ;
        DataInventario  := StrToDate(pDatInv);
        CodigoProduto   := vQryInventario.FieldByName('COD_ITEM').AsString;
        Quantidade      := vQryInventario.FieldByName('QTDE').AsFloat;
        VlrICMSST       := vQryInventario.FieldByName('VLRICMSST').AsFloat;
        VlrICMSOP       := vQryInventario.FieldByName('VLRICMSOP').AsFloat;
      end;
      TFrmApuracao(FView).ACBrSintegra.Registros88STES.Add(vReg88STES);
      vQryInventario.Next;
    end;
    vQryInventario.EnableControls;
  except
    raise;
  end;
end;

procedure TControllerApuracaoICMSST.GerarRegistro88STITNF(pCNPJ,pDatIni,pDatFin : String);
var
  vReg88STITNF : TRegistro88STITNF;
  vQryNF       : TFDMemTable;
  vSQL         : String;
begin
  {Itens das Notas Fiscais Relativas à Entrada de Produtos Sujeitos a Substituição Tributária}
  try
    vSQL       := TDmApuracaoICMSST(FModel).GetSQL88STITNF(pDatIni,pDatFin,pCNPJ);
    vQryNF     := TDmApuracaoICMSST(FModel).GetQryTemp;
    dmPrincipal.BancoExec.ExecSQL(vSQL,TDataSet(vQryNF));

    if vQryNF.IsEmpty then
    exit;

    vQryNF.DisableControls;
    vQryNF.First;
    while not vQryNF.Eof do
    begin
      vReg88STITNF := TRegistro88STITNF.Create;
      with vReg88STITNF do
      begin
        CNPJ            := vQryNF.FieldByName('COD_PART').AsString;
        Modelo          := vQryNF.FieldByName('COD_MOD').AsString;
        Serie           := vQryNF.FieldByName('SER').AsString;
        Numero          := vQryNF.FieldByName('NUM_DOC').AsString;
        CFOP            := vQryNF.FieldByName('CFOP').AsString;
        CST             := vQryNF.FieldByName('CST').AsString;
        NumeroItem      := vQryNF.FieldByName('NUM_ITEM').AsInteger;
        DataEntrada     := vQryNF.FieldByName('DT_E_ES').AsDateTime;
        CodigoProduto   := vQryNF.FieldByName('COD_ITEM').AsString;
        Quantidade      := vQryNF.FieldByName('QTDE').AsFloat;
        VlrProduto      := vQryNF.FieldByName('VL_ITEM').AsFloat;
        ValorDesconto   := vQryNF.FieldByName('VL_DESC').AsFloat;
        BaseICMSOP      := vQryNF.FieldByName('VL_BC_ICMS').AsFloat;
        BaseICMSST      := vQryNF.FieldByName('VL_BC_ICMS_ST').AsFloat;
        AliquotaICMSOP  := vQryNF.FieldByName('ALIQ_ICMS').AsFloat;
        AliquotaICMSST  := vQryNF.FieldByName('ALIQ_ST').AsFloat;
        VlrIPI          := vQryNF.FieldByName('VL_IPI').AsFloat;
        ChaveNFE        := vQryNF.FieldByName('CHV_NFE').AsString;
      end;
      TFrmApuracao(FView).ACBrSintegra.Registros88STITNF.Add(vReg88STITNF);
      vQryNF.Next;
    end;
    vQryNF.EnableControls;
  except
    raise;
  end;
end;

function TControllerApuracaoICMSST.GerarSintegra(pFinalidadeSintegra:
TFinalidadeSintegra) : Boolean;
var
  vCNPJ      : String;
  vMes       : String;
  vAno       : String;
  vDatInv    : String;
  vDatIniInv : String;
  vDatIni    : String;
  vDatFin    : String;

  procedure GerarArquivoSintegra;
  begin
    TFrmApuracao(FView).ACBrSintegra.GeraArquivo;
  end;

begin
  result       := false;
  try
    FQry       := TFDQuery.Create(nil);
    vCNPJ      := TFrmApuracao(FView).EdtCodPart.Text;
    vMes       := TFrmApuracao(FView).cmbMes.Text;
    vAno       := TFrmApuracao(FView).CmbAno.Text;
    vDatIniInv := DateToStr(StartOfTheMonth(StartOfAMonth(vAno.ToInteger,vMes.ToInteger)-1));
    vDatIni    := DateToStr(StartOfAMonth(vAno.ToInteger,vMes.ToInteger));
    vDatInv    := DateToStr((StrToDate(vDatIni))-1);
    vDatFin    := DateToStr(EndOfTheMonth(StrToDate(vDatIni)));


    try
      if not TDmApuracaoICMSST(FModel).GetContribuinte(vCNPJ) then
      begin
        Mensagem := 'Contribuinte não possui cadastro!';
        exit;
      end;

      DefineNomeArqSint(vCNPJ,vMes,vAno);
      GeraRegistro10(vMes,vAno,pFinalidadeSintegra);
      GeraRegistro11;
      GerarRegistro88STES(vCNPJ,vDatInv,vDatIniInv,vDatInv);
      GerarRegistro88STITNF(vCNPJ,vDatIni,vDatFin);
      GerarArquivoSintegra;
      Mensagem := 'Sintegra :' + TFrmApuracao(FView).ACBrSintegra.FileName +
                  ' gerado com sucesso.';
      result := true;
    except
      On e: exception do
      Mensagem := 'Erro : ' + e.Message + ' ao tentar gerar sintegra.';
    end;
  finally
    FreeAndNil(FQry);
  end;
end;

function TControllerApuracaoICMSST.GetMensagem: String;
begin
  result    := FMensagem;
  FMensagem := '';
end;

procedure TControllerApuracaoICMSST.ProcessarSintegra(
  pFinalidadeSintegra: TFinalidadeSintegra);
begin

  if not ValidadoDadosBasicos then
  begin
    FrmMensagem.Informacao(Mensagem);
    exit;
  end;

  if not GerarSintegra(pFinalidadeSintegra) then
  begin
    FrmMensagem.Informacao(Mensagem);
    exit;
  end;

  FrmMensagem.Informacao(Mensagem);
end;

procedure TControllerApuracaoICMSST.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

function TControllerApuracaoICMSST.ValidadoDadosBasicos: Boolean;
begin
  result := false;

  if TFrmApuracao(FView).ChkXML.Checked then
  begin
    if TFrmApuracao(FView).cxGridDBTVNF.DataController.DataSource.DataSet.IsEmpty then
    begin
      FMensagem := 'Dados dos XML(s) não encontrado(s).';
      exit;
    end;
  end;

  if TFrmApuracao(FView).ChkSPED.Checked then
  begin
    if TFrmApuracao(FView).cxGridDBTVW0200.DataController.DataSource.DataSet.IsEmpty then
    begin
      FMensagem := 'Dados do SPED não encontrado.';
      exit;
    end;
  end;

  result := true;
end;

procedure TControllerApuracaoICMSST.GeraRegistro10(pMes,pAno : String;
pFinalidadeSintegra: TFinalidadeSintegra);
var
  vQryContrib : TFDQuery;

  function ConvFinalidadeSintStr:String;
  begin
    result := iif(pFinalidadeSintegra = fsNormal,'1','2');
  end;

begin
  vQryContrib           := TDmApuracaoICMSST(FModel).GetQry;

  with TFrmApuracao(FView).ACBrSintegra.Registro10 do
  begin
    CNPJ                := vQryContrib.FieldByName('CNPJ').AsString;
    Inscricao           := vQryContrib.FieldByName('IE').AsString;
    RazaoSocial         := vQryContrib.FieldByName('RAZAOSOCIAL').AsString;
    Cidade              := vQryContrib.FieldByName('MUNICIPIO').AsString;
    Estado              := vQryContrib.FieldByName('UF').AsString;
    Telefone            := vQryContrib.FieldByName('TELEFONE').AsString;
    DataInicial         := StartOfaMonth(pAno.ToInteger,pMes.ToInteger);
    DataFinal           := EndOfaMonth(pAno.ToInteger,pMes.ToInteger);
    CodigoConvenio      := '1';
    NaturezaInformacoes := '1';
    FinalidadeArquivo   := ConvFinalidadeSintStr;
  end;
end;

procedure TControllerApuracaoICMSST.GeraRegistro11;
var
  vQryEndContrib : TFDQuery;
begin
  vQryEndContrib := TDmApuracaoICMSST(FModel).GetQry;

  with TFrmApuracao(FView).ACBrSintegra.Registro11 do
  begin
    Endereco     := vQryEndContrib.FieldByName('LOGRADOURO').AsString;
    Numero       := vQryEndContrib.FieldByName('NUMERO').AsString;
    Bairro       := vQryEndContrib.FieldByName('BAIRRO').AsString;
    Cep          := vQryEndContrib.FieldByName('CEP').AsString;
    Responsavel  := '';
    Telefone     := vQryEndContrib.FieldByName('TELEFONE').AsString;
  end;
end;

end.
