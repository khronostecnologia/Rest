unit uDMImportacaoXML;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass,
  ACBrNFeDANFEFR,W7ProgressBars;

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
    QryItensNFIDNF: TIntegerField;
    QryItensNFNUM_ITEM: TStringField;
    QryItensNFCOD_ITEM: TStringField;
    QryItensNFQTDE: TFloatField;
    QryItensNFUNID: TStringField;
    QryItensNFVL_ITEM: TFloatField;
    QryItensNFVL_DESC: TFloatField;
    QryItensNFCFOP: TStringField;
    QryItensNFVL_BC_ICMS: TFloatField;
    QryItensNFALIQ_ICMS: TFloatField;
    QryItensNFVL_ICMS: TFloatField;
    QryItensNFVL_BC_ICMS_ST: TFloatField;
    QryItensNFALIQ_ST: TFloatField;
    QryItensNFVL_ICMS_ST: TFloatField;
    QryItensNFID: TIntegerField;
    QryItensNFDESCR_ITEM: TStringField;
    QryItensNFCOD_EAN: TStringField;
    QryItensNFNCM: TStringField;
    QryItensNFCEST: TStringField;
    QryItensNFVL_SEGURO: TFloatField;
    QryItensNFVL_IPI: TFloatField;
    QryItensNFVL_PIS: TFloatField;
    QryItensNFVL_COFINS: TFloatField;
    QryItensNFVL_OUTRAS_DESP: TFloatField;
    QryItensNFVL_ICMSST_RET: TFloatField;
    QryItensNFVL_ICMSST_DEST: TFloatField;
    QryItensNFVL_ICMSST_DESON: TFloatField;
    QryItensNFVL_FRETE: TFloatField;
    QryItensNFVL_TOTAL_ITEM: TFloatField;
    QryItensNFCST: TStringField;
    QryItensNFCSOSN: TStringField;
    DsQryNF: TDataSource;
    DsQryItensNF: TDataSource;
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
    function ImportarXML(pDir : String ; pListaXML : TStringList):Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uDMBase,BiblKhronos,uImportacaoXML,uMensagem,
     pcnNFe,pcnConversao,uBarraProgresso;

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
    result := 'SELECT "ID" FROM "NF" WHERE "CHV_NFE" = ' + QuotedStr(pChave);
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

function TDMImportacaoXML.ImportarXML(pDir : String ; pListaXML : TStringList)
:Boolean;
var
  i          : Integer;
  j          : Integer;
  vIDNF      : Integer;
  vIDNFProd  : Integer;

  procedure CarregaXMLsParaAcbr;
  var
    i     : Integer;
  begin
    with NFe.NotasFiscais do
    begin
      Clear;
      FrmImportacaoXML.ProgressBar.Min := 0;
      FrmImportacaoXML.ProgressBar.Max := pListaXML.Count;

      for I := 0 to Pred(pListaXML.Count) do
      begin
        if EsteXMLJaFoiImportado(pListaXML[i]) then
        begin
          FrmImportacaoXML.ProgressBar.Position := FrmImportacaoXML.ProgressBar.Position + 1;
          continue;
        end;
        LoadFromFile(pDir + '\' + pListaXML[i]);
        FrmImportacaoXML.ProgressBar.Position := FrmImportacaoXML.ProgressBar.Position + 1;
      end;
    end;
  end;
  procedure AbreDataSetNFeNFItens;
  begin
    GetNF(-1);
    GetItensNF(-1);
  end;
  function ExisteXMLImportar : Boolean;
  begin
    result := (pListaXML.Count > 0);
  end;

begin
  result := false;
  try
    NFe := TACBrNFe.Create(nil);

    CarregaXMLsParaAcbr;

    if not ExisteXMLImportar then
    exit;

    AbreDataSetNFeNFItens;

    FrmImportacaoXML.ProgressBar.Max       := NFe.NotasFiscais.Count;
    FrmImportacaoXML.ProgressBar.Position  := 0;

    with NFe.NotasFiscais do
    begin
      for i :=0 to Pred(Count) do
      begin
        with Items[i].NFe do
        begin
          QryNF.Insert;

          if vIDNF = 0 then
            vIDNF := GetID('"NF"',dmPrincipal.DB) + 1
          else
            vIDNF := vIDNF + 1;

          QryNFID.AsInteger          := vIDNF;
          QryNFDT_DOC.AsDateTime     := Ide.dEmi;
          if Ide.dSaiEnt > 0 then
            QryNFDT_E_ES.AsDateTime    := Ide.dSaiEnt;
          QryNFCOD_MOD.AsString      := Ide.modelo.ToString;
          QryNFSER.AsString          := Ide.serie.ToString;
          QryNFNUM_DOC.AsString      := Ide.nNF.ToString;
          QryNFIND_OPER.AsString     := iif(Ide.tpNF = tnEntrada,'E','S');
          QryNFCHV_NFE.AsString      := Copy(infNFe.ID,4,length(infNFe.ID));
          QryNFVL_DOC.AsFloat        := Total.ICMSTot.vNF;
          QryNFVL_MERC.AsFloat       := Total.ICMSTot.vProd;
          QryNFVL_DESC.AsFloat       := Total.ICMSTot.vDesc;
          QryNFVL_FRT.AsFloat        := Total.ICMSTot.vFrete;
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

           for j := 0 to Pred(Det.Count) do
           begin
             with Det.Items[j] do
             begin
               if vIDNFProd = 0 then
                 vIDNFProd := GetID('"NF_ITENS"',dmPrincipal.DB) + 1
               else
                 vIDNFProd := vIDNFProd + 1;

               QryItensNF.Insert;
               QryItensNFID.AsInteger            := vIDNFProd;
               QryItensNFIDNF.AsInteger          := QryNFID.AsInteger;
               QryItensNFNUM_ITEM.AsInteger      := Prod.nItem;
               QryItensNFCOD_ITEM.AsString       := Prod.cProd;
               QryItensNFCOD_EAN.AsString        := Prod.cEAN;
               QryItensNFDESCR_ITEM.AsString     := Prod.xProd;
               QryItensNFQTDE.AsFloat            := Prod.qCom;
               QryItensNFUNID.AsString           := Prod.uCom;
               QryItensNFCST.AsString            := OrigToStr(imposto.ICMS.orig)  + CSTICMSToStr(imposto.ICMS.CST);
               QryItensNFCFOP.AsString           := Prod.CFOP;
               QryItensNFCSOSN.AsString          := OrigToStr(imposto.ICMS.orig)  + CSOSNIcmsToStr(imposto.ICMS.CSOSN);
               QryItensNFNCM.AsString            := Prod.NCM;
               QryItensNFCEST.AsString           := Prod.CEST;
               QryItensNFVL_ITEM.AsFloat         := Prod.vUnCom;
               QryItensNFVL_TOTAL_ITEM.AsFloat   := Prod.vProd;
               QryItensNFVL_IPI.AsFloat          := Imposto.IPI.vIPI;
               QryItensNFVL_PIS.AsFloat          := Imposto.PIS.vPIS;
               QryItensNFVL_COFINS.AsFloat       := Imposto.COFINS.vCOFINS;
               QryItensNFVL_FRETE.AsFloat        := Prod.vFrete;
               QryItensNFVL_OUTRAS_DESP.AsFloat  := Prod.vOutro;
               QryItensNFVL_SEGURO.AsFloat       := Prod.vSeg;
               QryItensNFVL_ICMSST_RET.AsFloat   := Imposto.ICMS.vICMSSTRet;
               QryItensNFVL_ICMSST_DEST.AsFloat  := Imposto.ICMS.vICMSSTDest;
               QryItensNFVL_ICMSST_DESON.AsFloat := Imposto.ICMS.vICMSDeson;
               QryItensNFVL_DESC.AsFloat         := Prod.vDesc;
               QryItensNFVL_BC_ICMS.AsFloat      := Imposto.ICMS.vBC;
               QryItensNFALIQ_ICMS.AsFloat       := 0;
               QryItensNFVL_ICMS.AsFloat         := Imposto.ICMS.vICMS;
               QryItensNFVL_BC_ICMS_ST.AsFloat   := Imposto.ICMS.vBCST;
               QryItensNFALIQ_ST.AsFloat         := 0;
               QryItensNFVL_ICMS_ST.AsFloat      := Imposto.ICMS.vICMSST;
               QryItensNF.Post;
             end;
           end;
          FrmImportacaoXML.ProgressBar.Position := FrmImportacaoXML.ProgressBar.Position + 1;
        end;
      end;
    end;
    result := true;
  finally
    FreeAndNil(NFe);
  end;
end;

end.
