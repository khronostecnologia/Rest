unit uDMImportacaoXML;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMImportacaoXML = class(TDataModule)
    QryNF: TFDQuery;
    QryItensNF: TFDQuery;
    QryNFIND_OPER: TStringField;
    QryNFCOD_PART: TStringField;
    QryNFCOD_MOD: TStringField;
    QryNFSER: TStringField;
    QryNFNUM_DOC: TStringField;
    QryNFCHV_NFE: TStringField;
    QryNFDT_DOC: TDateTimeField;
    QryNFDT_E_ES: TDateTimeField;
    QryNFVL_DOC: TFloatField;
    QryNFVL_MERC: TFloatField;
    QryNFVL_DESC: TFloatField;
    QryNFVL_FRT: TFloatField;
    QryNFVL_SEG: TFloatField;
    QryNFVL_OUT_DA: TFloatField;
    QryNFVL_BC_ICMS: TFloatField;
    QryNFVL_ICMS: TFloatField;
    QryNFVL_BC_ICMS_ST: TFloatField;
    QryNFVL_ICMS_ST: TFloatField;
    QryNFVL_BC_IPI: TFloatField;
    QryNFVL_IPI: TFloatField;
    QryNFVL_BC_PIS: TFloatField;
    QryNFVL_PIS: TFloatField;
    QryNFVL_BC_COFINS: TFloatField;
    QryNFVL_COFINS: TFloatField;
    QryNFPARTICIPANTE: TStringField;
    QryNFID: TIntegerField;
    QryNFCOD_SIT: TStringField;
    QryItensNFIDNF: TIntegerField;
    QryItensNFNUM_ITEM: TStringField;
    QryItensNFCOD_ITEM: TStringField;
    QryItensNFQTDE: TFloatField;
    QryItensNFUNID: TStringField;
    QryItensNFVL_ITEM: TFloatField;
    QryItensNFVL_DESC: TFloatField;
    QryItensNFCST_ICMS: TStringField;
    QryItensNFCFOP: TStringField;
    QryItensNFVL_BC_ICMS: TFloatField;
    QryItensNFALIQ_ICMS: TFloatField;
    QryItensNFVL_ICMS: TFloatField;
    QryItensNFVL_BC_ICMS_ST: TFloatField;
    QryItensNFALIQ_ST: TFloatField;
    QryItensNFVL_ICMS_ST: TFloatField;
    QryItensNFID: TIntegerField;
    QryItensNFDESCR_ITEM: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    NFe : TACBrNFe;
    function EsteXMLJaFoiImportado(pChave : String):Boolean;
    function GetNF(pID : Integer):Boolean;
    function GetItensNF(pID : Integer):Boolean;
  public
    { Public declarations }
    function CarregaXML(pListaXML : TStringList):Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uDMBase,BiblKhronos,uImportacaoXML,uMensagem,
     pcnNFe,pcnConversao;

procedure TDMImportacaoXML.DataModuleCreate(Sender: TObject);
begin
  NFe := TACBrNFe.Create(nil);
end;

procedure TDMImportacaoXML.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(NFe);
end;

function TDMImportacaoXML.EsteXMLJaFoiImportado(pChave: String): Boolean;
  function GetSQL : String;
  begin
    result := 'SELECT "ID" FROM "NF" WHERE "CHAVE" = ' + QuotedStr(pChave);
  end;
var
  Qry      : TFDQuery;
begin
  try
    Qry    := ConsultaSQL(GetSQL,dmPrincipal.DB);
    result := not (Qry.IsEmpty);
  finally
    FreeAndNil(Qry);
  end;
end;

function TDMImportacaoXML.GetItensNF(pID: Integer): Boolean;
begin
  result := false;
  try
    with QryItensNF do
    begin
      close;
      SQL.Text := 'SELECT * FROM "NF_ITENS" WHERE "ID" = ' + pID.ToString;
      Open;
      result := not (IsEmpty);
    end;
  except
    on e: exception do
    begin
      FrmMensagem.Informacao('Erro : ' + e.Message + ' ao tentar abrir consulta ITENSNF.');
      abort;
    end;
  end;
end;

function TDMImportacaoXML.GetNF(pID: Integer): Boolean;
begin
  result := false;
  try
    with QryNF do
    begin
      close;
      SQL.Text := 'SELECT * FROM "NF" WHERE "ID" = ' + pID.ToString;
      Open;
      result := not (IsEmpty);
    end;
  except
    on e: exception do
    begin
      FrmMensagem.Informacao('Erro : ' + e.Message + ' ao tentar abrir consulta NF.');
      abort;
    end;
  end;
end;

function TDMImportacaoXML.CarregaXML(pListaXML : TStringList):Boolean;
var
  i : Integer;

  procedure EnviaTextoBarraProgresso(pTexto : String);
  begin
    TFrmImportacaoXML(Owner).lblInfoImportacao.Caption := pTexto;
  end;

  procedure ReiniciaBarraProgresso(pValorMaximo :Integer);
  begin
    TFrmImportacaoXML(Owner).ProgressBar.Min := 0;
    TFrmImportacaoXML(Owner).ProgressBar.Max := pValorMaximo;
  end;

  procedure IncBarraProgresso;
  begin
    TFrmImportacaoXML(Owner).ProgressBar.Position :=
                             TFrmImportacaoXML(Owner).ProgressBar.Position + 1;
  end;

  procedure CarregaXMLsParaAcbr;
  var
    i : Integer;
  begin
    with NFe.NotasFiscais do
    begin
      Clear;
      for I := 0 to Pred(pListaXML.Count) do
      begin
        ReiniciaBarraProgresso(pListaXML.Count);
        EnviaTextoBarraProgresso('Carregando xml para a lista...');

        if EsteXMLJaFoiImportado(pListaXML[i]) then
        begin
          //Gera log
          IncBarraProgresso;
          continue;
        end;
        LoadFromFile(pListaXML[i]);
        IncBarraProgresso;
      end;
    end;
  end;

  function ExisteXMLImportar : Boolean;
  begin
    result := (pListaXML.Count > 0);
  end;

begin
  result := false;

  CarregaXMLsParaAcbr;

  if not ExisteXMLImportar then
  exit;

  if not GetNF(-1) then
  exit;

  if not GetItensNF(-1) then
  exit;

  with NFe.NotasFiscais do
  begin
    for i :=0 to Pred(Count) do
    begin
      with Items[i].NFe do
      begin
        QryNF.Insert;
        QryNFDT_DOC.AsDateTime     := Ide.dEmi;
        QryNFDT_E_ES.AsDateTime    := Ide.dSaiEnt;
        QryNFCOD_MOD.AsString      := Ide.modelo.ToString;
        QryNFSER.AsString          := Ide.serie.ToString;
        QryNFNUM_DOC.AsString      := Ide.nNF.ToString;
        QryNFIND_OPER.AsString     := iif(Ide.tpNF = tnEntrada,'E','S');
        QryNFCHV_NFE.AsString      := infNFe.ID;
        QryNFVL_DOC.AsFloat        := Total.ICMSTot.vNF;
        QryNFVL_MERC.AsFloat       := Total.ICMSTot.vProd;
        QryNFVL_DESC.AsFloat       := Total.ICMSTot.vDesc;
        QryNFVL_FRT.AsFloat        := Total.ICMSTot.vFrete;;
        QryNFVL_SEG.AsFloat        := Total.ICMSTot.vSeg;
        QryNFVL_OUT_DA.AsFloat     := Total.ICMSTot.vOutro;
        QryNFVL_BC_ICMS.AsFloat    := Total.ICMSTot.vBC;
        QryNFVL_ICMS.AsFloat       := Total.ICMSTot.vICMS;
        QryNFVL_BC_ICMS_ST.AsFloat := Total.ICMSTot.vBCST;
        QryNFVL_ICMS_ST.AsFloat    := Total.ICMSTot.vST;
        QryNFVL_BC_IPI.AsFloat     := 0;
        QryNFVL_IPI.AsFloat        := Total.ICMSTot.vIPI;
        QryNFVL_BC_PIS.AsFloat     := 0;
        QryNFVL_PIS.AsFloat        := Total.ICMSTot.vPIS;
        QryNFVL_BC_COFINS.AsFloat  := 0;
        QryNFVL_COFINS.AsFloat     := Total.ICMSTot.vCOFINS;
        QryNFCOD_PART.AsString     := Emit.CNPJCPF;
        QryNFPARTICIPANTE.AsString := Emit.xNome;
        QryNF.Post;
      end;
    end;
  end;
  result := true;
end;

end.
