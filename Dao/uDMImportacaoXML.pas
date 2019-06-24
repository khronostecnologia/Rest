unit uDMImportacaoXML;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrDFe, ACBrNFe,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass,
  ACBrNFeDANFEFR,W7ProgressBars,Vcl.Forms;

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
    QryItensNFVL_BC_ST_RET: TFloatField;
    QryItensNFVL_FCP_ST: TFloatField;
    QryItensNFVL_BC_FCP_ST: TFloatField;
    QryItensNFVL_BC_FCP_ST_RET: TFloatField;
    QryItensNFVL_FCP_ST_RET: TFloatField;
    QryItensNFVL_BC_ST_DEST: TFloatField;
    QryNFCOD_EMP: TStringField;
    QryNFEMPRESA: TStringField;
    QryNFMES: TIntegerField;
    QryNFANO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    NFe : TACBrNFe;
    FNomeArqLog: String;
    FExisteXMLImportar: Boolean;
    function EsteXMLJaFoiImportado(pChave : String):Boolean;
    function  GetNF(pID : Integer):Boolean;
    function  GetItensNF(pID : Integer):Boolean;
    procedure SetNomeArqLog(const Value: String);
    procedure SetExisteXMLImportar(const Value: Boolean);
  public
    { Public declarations }
    function  ImportarXML(pDir : String ; pListaXML : TStringList):Boolean;
    function  GravarImportacao : Boolean;
    function  GetTodasNF(pCodPart, pMes, pAno: String): Boolean;
    procedure DeleteNF;
    procedure DeletaTodasNF(pCodPart , pMes, pAno : String);
    procedure Cancelar;
    procedure FiltraItensNF;
    property  NomeArqLog : String read FNomeArqLog write SetNomeArqLog;
    property  ExisteXMLImportar :Boolean read FExisteXMLImportar write SetExisteXMLImportar;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uDMBase,BiblKhronos,uImportacaoXML,uMensagem,
     pcnNFe,pcnConversao,uBarraProgresso,uLog, System.Generics.Collections;

procedure TDMImportacaoXML.Cancelar;
begin
  if QryItensNF.Active then
  QryItensNF.CancelUpdates;

  if QryNF.Active then
  begin
    if FNomeArqLog <> '' then
    TLog.Gravar(dmPrincipal.DirImportacaoXML,NomeArqLog,'Cancelamento importação.');

    QryNF.CancelUpdates;
  end;
end;

procedure TDMImportacaoXML.DataModuleCreate(Sender: TObject);
begin
  NFe := TACBrNFe.Create(nil);
end;

procedure TDMImportacaoXML.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(NFe);
end;

procedure TDMImportacaoXML.DeletaTodasNF(pCodPart, pMes , pAno : String);
  function GetSQLDeleteNFItens : String;
  begin
    result := 'DELETE FROM "NF_ITENS" NP WHERE EXISTS (SELECT N."ID" '+
              'FROM "NF" N WHERE N."COD_EMP" = ' + QuotedStr(pCodPart) + ' ' +
              'AND "MES" = ' + pMes + ' AND "ANO" = ' + pAno +
              ' AND N."ID" = NP."IDNF")';
  end;
  function GetSQLDeleteNF : String;
  begin
    result := 'DELETE FROM "NF" WHERE "COD_EMP" = ' + QuotedStr(pCodPart) +
              ' AND "MES" = ' + pMes + ' AND "ANO" = ' + pAno;
  end;
begin
  with dmPrincipal.DB do
  begin
    try
      StartTransaction;
      ExecSQL(GetSQLDeleteNFItens);
      ExecSQL(GetSQLDeleteNF);

      FNomeArqLog := dmPrincipal.GetNomeArqLog;

      TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,'Lote de XML EMP: ' +
                  QryNFEMPRESA.AsString +
                  ' mes : ' + QryNFMES.AsString + '| ano : ' + QryNFANO.AsString +
                  ' deletado');
      Commit;
    except
      on e: exception do
      raise Exception.Create('Erro : ' + e.message + ' ao tentar excluir lote '+
                             ' XML da empresa');
    end;
  end;
end;

procedure TDMImportacaoXML.DeleteNF;
var
  vDoc   : String;
  vChave : String;
begin
  if not QryNF.Active then
  exit;

  vDoc   := QryNFNUM_DOC.AsString;
  vChave := QryNFCHV_NFE.AsString;

  QryItensNF.First;
  while not QryItensNF.Eof do
  begin
    QryItensNF.Delete;
    QryItensNF.First;
  end;

  if QryItensNF.ApplyUpdates(0) > 0 then
  raise Exception.Create('Erro ao tentar deletar itens da nota fiscal');

  QryNF.Delete;

  if QryNF.ApplyUpdates(0) > 0 then
  raise Exception.Create('Erro ao tentar deletar capa da nota fiscal');

  if FNomeArqLog = '' then
  FNomeArqLog := dmPrincipal.GetNomeArqLog;

    TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,' | XML nro :' + vDoc +
              ' chave : ' + vChave  + ' deletado.');
end;

function TDMImportacaoXML.EsteXMLJaFoiImportado(pChave: String): Boolean;
  function GetSQL : String;
  var
    vChaveXML : String;
  begin
    vChaveXML := pChave;
    vChaveXML := vChaveXML.Replace('.xml','').Trim;
    result    := 'SELECT "ID" FROM "NF" WHERE "CHV_NFE" = ' + QuotedStr(vChaveXML);
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

function TDMImportacaoXML.GetTodasNF(pCodPart, pMes, pAno: String): Boolean;
begin
  result := false;
  try
    with QryNF do
    begin
      Close;
      SQL.Text := 'SELECT * FROM "NF" WHERE "COD_EMP" = ' + QuotedStr(pCodPart) +
                  ' AND "MES" = ' + pMes + ' AND "ANO" = ' + pAno +
                  ' ORDER BY "DT_DOC"';
      Open;

      if not IsEmpty then
      begin
        result := true;
        with QryItensNF do
        begin
          close;
          SQL.Text := 'SELECT * FROM "NF_ITENS" NP WHERE EXISTS (SELECT N."ID" '+
                      'FROM "NF" N WHERE N."COD_EMP" = ' + QuotedStr(pCodPart) + ' ' +
                      'AND "MES" = ' + pMes + 'AND "ANO" = ' +  pAno +
                      ' AND N."ID" = NP."IDNF")';
          Open;
        end;
      end;
    end;
  except
    on e: exception do
    raise Exception.Create('Erro : ' + e.message + ' ao tentar recuperar NF(s) da empresa');
  end;
end;

function TDMImportacaoXML.GravarImportacao: Boolean;
begin
  result := false;
  try
    QryNF.ApplyUpdates(0);
  except
    on e: exception do
    begin
      TLog.Gravar(dmPrincipal.DirImportacaoXML,NomeArqLog,'Erro : ' + e.message + ' ao tentar gravar NF');
      raise Exception.Create('Erro : ' + e.message + ' ao tentar gravar NF');
    end;
  end;

  try
    QryItensNF.ApplyUpdates(0);
  except
    on e: exception do
    begin
      TLog.Gravar(dmPrincipal.DirImportacaoXML,NomeArqLog,'Erro : ' + e.message + ' ao tentar gravar itens da NF');
      raise Exception.Create('Erro : ' + e.message + ' ao tentar gravar itens da NF');
    end;
  end;

  TLog.Gravar(dmPrincipal.DirImportacaoXML,NomeArqLog,'Importação salva com sucesso!');
  FNomeArqLog         := '';
  FExisteXMLImportar  := false;
  result              := true;
end;

function TDMImportacaoXML.ImportarXML(pDir : String ; pListaXML : TStringList)
:Boolean;
var
  i            : Integer;
  j            : Integer;
  vIDNF        : Integer;
  vIDNFProd    : Integer;
  vLstPessoas  : TDictionary <String,String>;
  vRet         : String;

  procedure CarregaXMLsParaAcbr;
  var
    i     : Integer;
  begin
    with FrmImportacaoXML do
    begin
      with NFe.NotasFiscais do
      begin
        Clear;
        lblInfoImportacaoXML.Caption := 'Procurando XML(s) no diretório ...';
        TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,lblInfoImportacaoXML.Caption);
        ProgressBar.Min := 0;
        ProgressBar.Max := pListaXML.Count;
        Application.ProcessMessages;
        Sleep(900);

        for I := 0 to Pred(pListaXML.Count) do
        begin
          lblInfoImportacaoXML.Caption := 'Carregando XML ... (' + IntToStr(i + 1) + ') de (' +
                                           pListaXML.Count.ToString + ')';
          TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,lblInfoImportacaoXML.Caption);
          Application.ProcessMessages;
          if EsteXMLJaFoiImportado(pListaXML[i]) then
          begin
            TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,'Xml chave : ' +
                        pListaXML[i].Replace('.xml','').Trim +
                        ' importado anteriormente.');
            ProgressBar.Position := ProgressBar.Position + 1;
            Application.ProcessMessages;
            continue;
          end;
          LoadFromFile(pDir + '\' + pListaXML[i]);
          ProgressBar.Position := ProgressBar.Position + 1;
          Application.ProcessMessages;
        end;
      end;
    end;
  end;
  procedure AbreDataSetNFeNFItens;
  begin
    GetNF(-1);
    GetItensNF(-1);
  end;

begin
  result := false;
  try
    NFe          := TACBrNFe.Create(nil);
    vLstPessoas  := TDictionary<String,String>.Create;

    CarregaXMLsParaAcbr;

    FExisteXMLImportar := (NFe.NotasFiscais.Count > 0);

    if not FExisteXMLImportar then
    exit;

    AbreDataSetNFeNFItens;

    FrmImportacaoXML.ProgressBar.Max       := NFe.NotasFiscais.Count;
    FrmImportacaoXML.ProgressBar.Position  := 0;
    Application.ProcessMessages;

    FrmImportacaoXML.lblInfoImportacaoXML.Caption := 'Iniciando importação do XML(s)...';
    Sleep(900);
    Application.ProcessMessages;
    TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,FrmImportacaoXML.
                                       lblInfoImportacaoXML.Caption);

    with NFe.NotasFiscais do
    begin
      for i :=0 to Pred(Count) do
      begin
        FrmImportacaoXML.lblInfoImportacaoXML.
        Caption := 'Importando XML ...(' + IntToStr(i + 1) + ') de (' + Count.ToString + ')';
        TLog.Gravar(dmPrincipal.DirImportacaoXML,FNomeArqLog,FrmImportacaoXML.
                                       lblInfoImportacaoXML.Caption);
        Application.ProcessMessages;

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
            QryNFDT_E_ES.AsDateTime  := Ide.dSaiEnt;
          QryNFCOD_MOD.AsString      := Ide.modelo.ToString;
          QryNFSER.AsString          := Ide.serie.ToString;
          QryNFNUM_DOC.AsString      := Ide.nNF.ToString;
          QryNFIND_OPER.AsString     := iif(Ide.tpNF = tnEntrada,'S','E');
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

          {Emitente = fornecedor}
          if not vLstPessoas.ContainsKey(Emit.CNPJCPF) then
          begin
            vLstPessoas.Add(Emit.CNPJCPF,Emit.xNome);
            QryNFCOD_PART.AsString     := Emit.CNPJCPF;
            QryNFPARTICIPANTE.AsString := Emit.xNome;
          end
          else
          begin
            vLstPessoas.TryGetValue(Emit.CNPJCPF,vRet);
            QryNFCOD_PART.AsString     := Emit.CNPJCPF;
            QryNFPARTICIPANTE.AsString := vRet;
          end;

          {Destinatario = cliente contador = empresa}
          if not vLstPessoas.ContainsKey(Dest.CNPJCPF) then
          begin
            QryNFCOD_EMP.AsString := Dest.CNPJCPF;
            QryNFEMPRESA.AsString := Dest.xNome;
            vLstPessoas.Add(QryNFCOD_EMP.AsString,QryNFEMPRESA.AsString);
          end
          else
          begin
            vLstPessoas.TryGetValue(Dest.CNPJCPF,vRet);
            QryNFCOD_EMP.AsString  := Dest.CNPJCPF;
            QryNFEMPRESA.AsString  := vRet;
          end;

          QryNFMES.AsInteger := FormatDateTime('mm',QryNFDT_DOC.AsDateTime).ToInteger;
          QryNFANO.AsInteger := FormatDateTime('yyyy',QryNFDT_DOC.AsDateTime).ToInteger;
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
               QryItensNFVL_BC_ST_RET.AsFloat    := Imposto.ICMS.vBCSTRet;
               QryItensNFVL_FCP_ST.AsFloat       := Imposto.ICMS.vFCPST;
               QryItensNFVL_BC_FCP_ST.AsFloat    := Imposto.ICMS.vBCFCPST;
               QryItensNFVL_FCP_ST_RET.AsFloat   := Imposto.ICMS.vFCPSTRet;
               QryItensNFVL_BC_FCP_ST_RET.AsFloat:= Imposto.ICMS.vBCFCPSTRet;
               QryItensNFVL_BC_ST_DEST.AsFloat   := Imposto.ICMS.vBCSTDest;
               QryItensNF.Post;
             end;
           end;
          FrmImportacaoXML.ProgressBar.Position := FrmImportacaoXML.ProgressBar.Position + 1;
          Application.ProcessMessages;
        end;
      end;
    end;
    result := true;
  finally
    FreeAndNil(NFe);
    FreeAndNil(vLstPessoas);
  end;
end;

procedure TDMImportacaoXML.SetExisteXMLImportar(const Value: Boolean);
begin
  FExisteXMLImportar := Value;
end;

procedure TDMImportacaoXML.SetNomeArqLog(const Value: String);
begin
  FNomeArqLog := Value;
end;

procedure TDMImportacaoXML.FiltraItensNF;
begin
   if (QryItensNF.Active) and (QryNF.State = (dsBrowse)) then
  begin
    QryItensNF.Filtered := false;
    QryItensNF.Filter   := ' IDNF = ' + QryNF.FieldByName('ID').AsString;
    QryItensNF.Filtered := true;
  end;
end;

end.
