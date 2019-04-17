unit uImportacaoSPEDICMSIPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  Vcl.Mask, JvExMask, JvToolEdit, AdvGroupBox, AdvGlowButton, AdvEdit, AdvEdBtn,
  AdvFileNameEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, AdvOfficeButtons,
  cxPC, W7Classes, W7ProgressBars, AdvProgressBar, Vcl.ComCtrls, AdvProgr,
  AdvCircularProgress, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ACBrEFDImportar, ACBrBase, ACBrSpedFiscal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmImportarSPED = class(TFrmMaster)
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    BtnIniciaImportacao: TAdvGlowButton;
    BtnGravar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    EdtArquivo: TJvFilenameEdit;
    cxPgcImportacao: TcxPageControl;
    Tbs0200: TcxTabSheet;
    TbsC100E: TcxTabSheet;
    TbsC100S: TcxTabSheet;
    GpbRegistro0000: TAdvGroupBox;
    cxGrid0200: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridC100E: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridC100S: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    TbsC400: TcxTabSheet;
    GpbProcessaImportacao: TAdvGroupBox;
    ProgressBar: TW7ProgressBar;
    lblInfoImportacao: TLabel;
    cxGrid0000: TcxGrid;
    cxGrid0000DBTableView1: TcxGridDBTableView;
    cxGrid0000Level1: TcxGridLevel;
    ACBrSPEDFiscal: TACBrSPEDFiscal;
    ACBrSpedFiscalImportar: TACBrSpedFiscalImportar;
    cxGrid0000DBTableView1COD_FIN: TcxGridDBColumn;
    cxGrid0000DBTableView1DT_INI: TcxGridDBColumn;
    cxGrid0000DBTableView1DT_FIM: TcxGridDBColumn;
    cxGrid0000DBTableView1NOME: TcxGridDBColumn;
    cxGrid0000DBTableView1CNPJ: TcxGridDBColumn;
    cxGrid0000DBTableView1CPF: TcxGridDBColumn;
    cxGrid0000DBTableView1UF: TcxGridDBColumn;
    cxGrid0000DBTableView1IE: TcxGridDBColumn;
    cxGrid0000DBTableView1IND_PERFIL: TcxGridDBColumn;
    cxGrid0000DBTableView1IND_ATIV: TcxGridDBColumn;
    cxGridDBTableView1COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView1DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView1CODBARRA: TcxGridDBColumn;
    cxGridDBTableView1UNID: TcxGridDBColumn;
    cxGridDBTableView1TIPO_ITEM: TcxGridDBColumn;
    cxGridDBTableView1COD_NCM: TcxGridDBColumn;
    cxGridDBTableView1ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTableView1CEST: TcxGridDBColumn;
    procedure BtnIniciaImportacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtArquivoAfterDialog(Sender: TObject; var AName: string;
      var AAction: Boolean);
  private
    { Private declarations }
    procedure ImportarSPED;
    procedure ImportaReg0000;
    procedure ImportaReg0200;
    procedure CriaTabelaEmpresaLogada(ASQL : String);
    function  ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
    function  GetSQLCreateRegistro0000(ACPFCNPJ : String): String;
    function  GetSQLCreateRegistro0200(ACPFCNPJ : String): String;
  public
    { Public declarations }
  end;

var
  FrmImportarSPED: TFrmImportarSPED;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,BiblKhronos,uDMImportacaoSPED,
     ACBrEFDBlocos;

procedure TFrmImportarSPED.BtnIniciaImportacaoClick(Sender: TObject);
begin
  inherited;
  if not (EdtArquivo.Text <> '') then
  begin
    FrmMensagem.Informacao('Informe o arquivo que deseja importar ' +
                           ' e tente novamente!');
    SetaFoco(EdtArquivo);
  end;
  ImportarSPED;
end;

procedure TFrmImportarSPED.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmImportarSPED.CriaTabelaEmpresaLogada(ASQL: String);
begin
  dmPrincipal.DB.ExecSQL(ASQL);
end;


procedure TFrmImportarSPED.EdtArquivoAfterDialog(Sender: TObject;
  var AName: string; var AAction: Boolean);
begin
  inherited;
  BtnIniciaImportacao.Enabled := (AName <> '');
end;

function TFrmImportarSPED.ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
var
  Qry      : TFDQuery;
  vSQL     : String;
begin
  try
    vSQL   := ' SELECT "ID" FROM "CADASTROS"."REGISTRO0000_' +
                QuotedStr(dmPrincipal.QryEmpresaCPFCNPJ.AsString) +
              ' WHERE "DT_INI" = ' + QuotedStr(ADT_INI) +
              ' AND "DT_FIM" = ' + QuotedStr(ADT_FIM) +
              ' AND "CNPJ" = ' + QuotedStr(ACNPJCPF) +
              ' OR "CPF" = ' + QuotedStr(ACNPJCPF);
    Qry    := ConsultaSQL(vSQL,dmPrincipal.DB);
    result := (Qry.IsEmpty);
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TFrmImportarSPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(DMImportacaoSPED);
  FreeAndNil(FrmImportarSPED);
end;

procedure TFrmImportarSPED.FormCreate(Sender: TObject);
begin
  inherited;
  DMImportacaoSPED := TDMImportacaoSPED.Create(nil);
end;

procedure TFrmImportarSPED.FormShow(Sender: TObject);
begin
  inherited;
  EdtArquivo.InitialDir          := dmPrincipal.DirApp;
  BtnIniciaImportacao.Enabled    := False;
  BtnGravar.Enabled              := False;
  BtnCancelar.Enabled            := false;
  GpbProcessaImportacao.Visible  := false;
  GpbRegistro0000.Visible        := false;
  cxPgcImportacao.Visible        := false;
  SetaFoco(EdtArquivo);
end;

function TFrmImportarSPED.GetSQLCreateRegistro0000(ACPFCNPJ : String): String;
begin
  result := 'CREATE TABLE "CADASTROS"."REGISTRO0000_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" serial NOT NULL,                               '+
            '      "COD_FIN" character varying(30),                    '+
            '      "DT_INI" TIMESTAMP,                                 '+
            '      "DT_FIM" TIMESTAMP,                                 '+
            '      "NOME" character varying(100),                      '+
            '      "CNPJ" character varying(20),                       '+
            '      "CPF" character varying(20),                        '+
            '      "UF" character varying(2),                          '+
            '      "IE" character varying(20),                         '+
            '      "COD_MUN" integer,                                  '+
            '      "IND_PERFIL" character varying(30),                 '+
            '      "IND_ATIV" character varying(30),                   '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "CADASTROS"."REGISTRO0000_' + ACPFCNPJ + '" '+
            '      OWNER to postgres;                                  ';
end;

function TFrmImportarSPED.GetSQLCreateRegistro0200(ACPFCNPJ: String): String;
begin
  result :=  result := 'CREATE TABLE "CADASTROS"."REGISTRO0200_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" serial NOT NULL,                               '+
            '      "COD_ITEM" character varying(30),                   '+
            '      "DESCR_ITEM" character varying(100),                '+
            '      "CODBARRA" character varying(14),                   '+
            '      "UNID" character varying(5),                        '+
            '      "TIPO_ITEM" character varying(30),                  '+
            '      "COD_NCM" character varying(15),                    '+
            '      "ALIQ_ICMS" DECIMAL(15,2),                          '+
            '      "CEST" character varying(15),                       '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "CADASTROS"."REGISTRO0200_' + ACPFCNPJ + '" '+
            '      OWNER to postgres;                                  ';
end;

procedure TFrmImportarSPED.ImportaReg0000;
var
  vDT_INI     : TDateTime;
  vDT_FIM     : TDateTime;
  vCPFCNPJ    : String;
  vNomeTabela : String;

  function GetCodFin : String;
  begin
    Case TACBrCodFin(ACBrSPEDFiscal.Bloco_0.Registro0000.COD_FIN) of
      raOriginal    : result := 'Original';
      raSubstituto  : result := 'Substituto';
    End;
  end;

  function GetCodPerfil : String;
  begin
    case TACBrIndPerfil(ACBrSPEDFiscal.Bloco_0.Registro0000.IND_PERFIL) of
      pfPerfilA : result := 'A';
      pfPerfilB : result := 'B';
      pfPerfilC : result := 'C';
      pfNenhum  : result := 'Nenhum';
    end;
  end;

  function GetCodAtiv : String;
  begin
    case TACBrIndAtiv(ACBrSPEDFiscal.Bloco_0.Registro0000.IND_ATIV) of
     atIndustrial : result := 'Industrial';
     atOutros     : result := 'Outros';
    end;
  end;


begin
  lblInfoImportacao.Caption     := 'Carregando registro 0000...';
  ProgressBar.Max               := 100;
  ProgressBar.Position          := 0;

  vDT_INI     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI;
  vDT_FIM     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_FIN;
  vCPFCNPJ    := iif(ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ <> '',
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ,
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CPF);
  vNomeTabela := 'REGISTRO0000_' + vCPFCNPJ;
  ProgressBar.Position          := ProgressBar.Position + 20;

  if dmPrincipal.QryEmpresa.Active then
  begin
    lblInfoImportacao.Caption     := 'Verificando registro de arquivos importados...';
    if ExisteArqSPED(DateToStr(vDT_INI),DateToStr(vDT_FIM),vCPFCNPJ) then
    begin
      FrmMensagem.Informacao('Arquivo com registro de importado...tente novamente!');
      Abort;
    end;
  end
  else
  begin
    lblInfoImportacao.Caption  := 'Verificando tabela de identificação existe...';
    if not TabelaExiste(vNomeTabela,dmPrincipal.DB) then
    begin
      try
        lblInfoImportacao.Caption  := 'Criando tabela de identificação...';
        CriaTabelaEmpresaLogada(GetSQLCreateRegistro0000(vCPFCNPJ));
      except
        raise;
      end;
    end;
  end;

  ProgressBar.Position          := ProgressBar.Position + 30;

  With DMImportacaoSPED.Qry0000 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM "CADASTROS"."' + vNomeTabela + '" '+
                'WHERE "ID" = -1';
    Open;
    Insert;
    FieldByName('COD_FIN').AsString     := GetCodFin;
    FieldByName('NOME').AsString        := ACBrSPEDFiscal.Bloco_0.Registro0000.NOME;
    FieldByName('DT_INI').AsDateTime    := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI;
    FieldByName('DT_FIM').AsDateTime    := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_FIN;
    FieldByName('CNPJ').AsString        := ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ;
    FieldByName('CPF').AsString         := ACBrSPEDFiscal.Bloco_0.Registro0000.CPF;
    FieldByName('UF').AsString          := ACBrSPEDFiscal.Bloco_0.Registro0000.UF;
    FieldByName('IE').AsString          := ACBrSPEDFiscal.Bloco_0.Registro0000.IE;
    FieldByName('COD_MUN').AsInteger    := ACBrSPEDFiscal.Bloco_0.Registro0000.COD_MUN;
    FieldByName('IND_PERFIL').AsString  := GetCodPerfil;
    FieldByName('IND_ATIV').AsString    := GetCodAtiv;
    Post;
  end;
  ProgressBar.Position          := ProgressBar.Position + 45;
  ProgressBar.Position          := 99;
end;

procedure TFrmImportarSPED.ImportaReg0200;
var
  i           : Integer;
  j           : Integer;
  vNomeTabela : String;
  vCNPJ       : String;

  function GetTipoItem(ATipoItem :TACBrTipoItem) : String;
  begin
    case ATipoItem of
      tiMercadoriaRevenda    : result := 'MercadoriaRevenda';
      tiMateriaPrima         : result := 'MateriaPrima';
      tiEmbalagem            : result := 'Embalagem';
      tiProdutoProcesso      : result := 'ProdutoProcesso';
      tiProdutoAcabado       : result := 'ProdutoAcabado';
      tiSubproduto           : result := 'Subproduto';
      tiProdutoIntermediario : result := 'ProdutoIntermediario';
      tiMaterialConsumo      : result := 'MaterialConsumo';
      tiAtivoImobilizado     : result := 'AtivoImobilizado';
      tiServicos             : result := 'Servicos';
      tiOutrosInsumos        : result := 'OutrosInsumos';
      tiOutras               : result := 'Outras';
    end;
  end;
begin
  lblInfoImportacao.Caption     := 'Carregando registro 0200...';
  ProgressBar.Max               := Pred(ACBrSPEDFiscal.Bloco_0.Registro0200Count);
  ProgressBar.Position          := 0;
  vCNPJ                         := iif(dmPrincipal.QryEmpresa.Active,
                                   dmPrincipal.QryEmpresaCPFCNPJ.AsString,
                                   DMImportacaoSPED.Qry0000CNPJ.AsString);
  vNomeTabela                   := 'Registro0200_' + vCNPJ;
  if Pred(ACBrSPEDFiscal.Bloco_0.Registro0200Count) > 0 then
  begin
    if not TabelaExiste(vNomeTabela,dmPrincipal.DB) then
    CriaTabelaEmpresaLogada(GetSQLCreateRegistro0200(vCNPJ));

    with DMImportacaoSPED do
    begin
      Qry0200.Close;
      Qry0200.SQL.Clear;
      Qry0200.SQL.Text  := 'SELECT * FROM "CADASTROS"."' + vNomeTabela + '" '+
                           'WHERE "ID" = -1';
      Qry0200.Open;

      for I := 0 to Pred(ACBrSPEDFiscal.Bloco_0.Registro0001.Registro0200.Count) do
      begin
         Qry0200COD_ITEM.AsString    := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_ITEM;
         Qry0200DESCR_ITEM.AsString  := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].DESCR_ITEM;
         Qry0200CODBARRA.AsString    := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_BARRA;
         Qry0200UNID.AsString        := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].UNID_INV;
         Qry0200TIPO_ITEM.AsString   := GetTipoItem(ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].TIPO_ITEM);
         Qry0200COD_NCM.AsString     := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_NCM;
         Qry0200ALIQ_ICMS            := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].ALIQ_ICMS;
         Qry0200CEST.AsString        := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].CEST;
         ProgressBar.Position        :=  ProgressBar.Position + 1;
      end;
    end;
  end;
end;

procedure TFrmImportarSPED.ImportarSPED;
begin
 try
   try
     ACBrSpedFiscalImportar.Arquivo := EdtArquivo.Text;
     ACBrSpedFiscalImportar.Importar;
     GpbProcessaImportacao.Visible := true;

     ImportaReg0000;
     ImportaReg0200;

     Application.ProcessMessages;
     FrmMensagem.Informacao('Importação realizada com sucesso!');
     GpbRegistro0000.Visible       := true;
     cxPgcImportacao.Visible       := true;
    except
      on e: exception do
      begin
        FrmMensagem.Informacao('Erro : ' + e.Message + ' ao importar arquivo SPED.');
        GpbRegistro0000.Visible       := false;
        cxPgcImportacao.Visible       := false;
      end;
   end;
 finally
   GpbProcessaImportacao.Visible := false;
 end;

end;

end.
