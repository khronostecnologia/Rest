unit uDMImportacaoSPED;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMImportacaoSPED = class(TDataModule)
    Qry0000: TFDQuery;
    Qry0200: TFDQuery;
    QryC400: TFDQuery;
    QryC425: TFDQuery;
    Ds0000: TDataSource;
    Ds0200: TDataSource;
    DsC100e: TDataSource;
    DsC170e: TDataSource;
    DsC400: TDataSource;
    DsC425: TDataSource;
    Qry0000DT_INI: TDateTimeField;
    Qry0000DT_FIM: TDateTimeField;
    Qry0000COD_MUN: TIntegerField;
    Qry0000COD_FIN: TStringField;
    Qry0000NOME: TStringField;
    Qry0000CNPJ: TStringField;
    Qry0000CPF: TStringField;
    Qry0000UF: TStringField;
    Qry0000IE: TStringField;
    Qry0000IND_PERFIL: TStringField;
    Qry0000IND_ATIV: TStringField;
    Qry0200COD_ITEM: TStringField;
    Qry0200DESCR_ITEM: TStringField;
    Qry0200CODBARRA: TStringField;
    Qry0200UNID: TStringField;
    Qry0200TIPO_ITEM: TStringField;
    Qry0200COD_NCM: TStringField;
    Qry0200ALIQ_ICMS: TFloatField;
    Qry0200CEST: TStringField;
    QryC100e: TFDQuery;
    QryC170e: TFDQuery;
    Qry0000ID: TAutoIncField;
    QryC100eID_SPED: TIntegerField;
    QryC100eIND_OPER: TStringField;
    QryC100eCOD_PART: TStringField;
    QryC100eCOD_MOD: TStringField;
    QryC100eSER: TStringField;
    QryC100eNUM_DOC: TStringField;
    QryC100eCHV_NFE: TStringField;
    QryC100eDT_DOC: TDateTimeField;
    QryC100eDT_E_ES: TDateTimeField;
    QryC100eVL_DOC: TFloatField;
    QryC100eVL_MERC: TFloatField;
    QryC100eVL_DESC: TFloatField;
    QryC100eVL_FRT: TFloatField;
    QryC100eVL_SEG: TFloatField;
    QryC100eVL_OUT_DA: TFloatField;
    QryC100eVL_BC_ICMS: TFloatField;
    QryC100eVL_ICMS: TFloatField;
    QryC100eVL_BC_ICMS_ST: TFloatField;
    QryC100eVL_ICMS_ST: TFloatField;
    QryC100eVL_BC_IPI: TFloatField;
    QryC100eVL_IPI: TFloatField;
    QryC100eVL_BC_PIS: TFloatField;
    QryC100eVL_PIS: TFloatField;
    QryC100eVL_BC_COFINS: TFloatField;
    QryC100eVL_COFINS: TFloatField;
    QryC100ePARTICIPANTE: TStringField;
    QryC170eID_SPED: TIntegerField;
    QryC170eIDNF: TIntegerField;
    QryC170eNUM_ITEM: TStringField;
    QryC170eCOD_ITEM: TStringField;
    QryC170eQTDE: TFloatField;
    QryC170eUNID: TStringField;
    QryC170eVL_ITEM: TFloatField;
    QryC170eVL_DESC: TFloatField;
    QryC170eCST_ICMS: TStringField;
    QryC170eCFOP: TStringField;
    QryC170eVL_BC_ICMS: TFloatField;
    QryC170eALIQ_ICMS: TFloatField;
    QryC170eVL_ICMS: TFloatField;
    QryC170eVL_BC_ICMS_ST: TFloatField;
    QryC170eALIQ_ST: TFloatField;
    QryC170eVL_ICMS_ST: TFloatField;
    Qry0200ID: TIntegerField;
    QryC170eID: TIntegerField;
    QryC170eDESCR_ITEM: TStringField;
    QryC400ID: TIntegerField;
    QryC400ID_SPED: TIntegerField;
    QryC400DATA: TDateTimeField;
    QryC400ECF_FAB: TStringField;
    QryC425ID: TIntegerField;
    QryC425ID_SPED: TIntegerField;
    QryC425ID_REDZ: TIntegerField;
    QryC425COD_TOT_PAR: TStringField;
    QryC425COD_ITEM: TStringField;
    QryC425DESCR_ITEM: TStringField;
    QryC425QTD: TFloatField;
    QryC425VL_ITEM: TFloatField;
    QryResultadoA: TFDQuery;
    QryResultadoS: TFDQuery;
    QryResultadoSCOD_ITEM: TStringField;
    QryResultadoSCODBARRA: TStringField;
    QryResultadoSDESCR_ITEM: TStringField;
    QryResultadoSDATA_ENTRADA: TDateTimeField;
    QryResultadoSQTDE_ENTRADA: TFloatField;
    QryResultadoSBC_ICMS_ST_ENT: TFloatField;
    QryResultadoSVL_ICMS_ST_ENT: TFloatField;
    QryResultadoSVL_ICMS_ST_UNI_ENT: TFloatField;
    QryResultadoSDATA_SAIDA: TDateTimeField;
    QryResultadoSQTDE_SAIDA: TFloatField;
    QryResultadoSBC_ICMS_ST_SAI: TFloatField;
    QryResultadoSTOTAL_ICMS_SAIDA: TFloatField;
    QryResultadoSTOTAL_ICMS_ENTRADA: TFloatField;
    QryResultadoSDIFERENCA: TFloatField;
    QryResultadoSSALDO_RESTITUIR: TFloatField;
    QryResultadoSSALDO_ARECOLHER: TFloatField;
    DsResultadoA: TDataSource;
    DsResultadoS: TDataSource;
    QryResultadoSTOTAL_RESTITUIR: TAggregateField;
    QryResultadoSTOTAL_ARECOLHER: TAggregateField;
    DsC100s: TDataSource;
    DsC170s: TDataSource;
    QryC100s: TFDQuery;
    QryC170s: TFDQuery;
    QryC100sID_SPED: TIntegerField;
    QryC100sIND_OPER: TStringField;
    QryC100sCOD_PART: TStringField;
    QryC100sCOD_MOD: TStringField;
    QryC100sSER: TStringField;
    QryC100sNUM_DOC: TStringField;
    QryC100sCHV_NFE: TStringField;
    QryC100sDT_DOC: TDateTimeField;
    QryC100sDT_E_ES: TDateTimeField;
    QryC100sVL_DOC: TFloatField;
    QryC100sVL_MERC: TFloatField;
    QryC100sVL_DESC: TFloatField;
    QryC100sVL_FRT: TFloatField;
    QryC100sVL_SEG: TFloatField;
    QryC100sVL_OUT_DA: TFloatField;
    QryC100sVL_BC_ICMS: TFloatField;
    QryC100sVL_ICMS: TFloatField;
    QryC100sVL_BC_ICMS_ST: TFloatField;
    QryC100sVL_ICMS_ST: TFloatField;
    QryC100sVL_BC_IPI: TFloatField;
    QryC100sVL_IPI: TFloatField;
    QryC100sVL_BC_PIS: TFloatField;
    QryC100sVL_PIS: TFloatField;
    QryC100sVL_BC_COFINS: TFloatField;
    QryC100sVL_COFINS: TFloatField;
    QryC100sPARTICIPANTE: TStringField;
    QryC100sCOD_SIT: TStringField;
    QryC170sID_SPED: TIntegerField;
    QryC170sIDNF: TIntegerField;
    QryC170sNUM_ITEM: TStringField;
    QryC170sCOD_ITEM: TStringField;
    QryC170sQTDE: TFloatField;
    QryC170sUNID: TStringField;
    QryC170sVL_ITEM: TFloatField;
    QryC170sVL_DESC: TFloatField;
    QryC170sCST_ICMS: TStringField;
    QryC170sCFOP: TStringField;
    QryC170sVL_BC_ICMS: TFloatField;
    QryC170sALIQ_ICMS: TFloatField;
    QryC170sVL_ICMS: TFloatField;
    QryC170sVL_BC_ICMS_ST: TFloatField;
    QryC170sALIQ_ST: TFloatField;
    QryC170sVL_ICMS_ST: TFloatField;
    QryC170sID: TIntegerField;
    QryC170sDESCR_ITEM: TStringField;
    QryC100eID: TIntegerField;
    QryC100sID: TIntegerField;
    QryC100eCOD_SIT: TStringField;
    DsC100: TDataSource;
    DsC170: TDataSource;
    QryC100: TFDQuery;
    QryC170: TFDQuery;
    QryC100ID_SPED: TIntegerField;
    QryC100IND_OPER: TStringField;
    QryC100COD_PART: TStringField;
    QryC100COD_MOD: TStringField;
    QryC100SER: TStringField;
    QryC100NUM_DOC: TStringField;
    QryC100CHV_NFE: TStringField;
    QryC100DT_DOC: TDateTimeField;
    QryC100DT_E_ES: TDateTimeField;
    QryC100VL_DOC: TFloatField;
    QryC100VL_MERC: TFloatField;
    QryC100VL_DESC: TFloatField;
    QryC100VL_FRT: TFloatField;
    QryC100VL_SEG: TFloatField;
    QryC100VL_OUT_DA: TFloatField;
    QryC100VL_BC_ICMS: TFloatField;
    QryC100VL_ICMS: TFloatField;
    QryC100VL_BC_ICMS_ST: TFloatField;
    QryC100VL_ICMS_ST: TFloatField;
    QryC100VL_BC_IPI: TFloatField;
    QryC100VL_IPI: TFloatField;
    QryC100VL_BC_PIS: TFloatField;
    QryC100VL_PIS: TFloatField;
    QryC100VL_BC_COFINS: TFloatField;
    QryC100VL_COFINS: TFloatField;
    QryC100PARTICIPANTE: TStringField;
    QryC100ID: TIntegerField;
    QryC100COD_SIT: TStringField;
    QryC170ID_SPED: TIntegerField;
    QryC170IDNF: TIntegerField;
    QryC170NUM_ITEM: TStringField;
    QryC170COD_ITEM: TStringField;
    QryC170QTDE: TFloatField;
    QryC170UNID: TStringField;
    QryC170VL_ITEM: TFloatField;
    QryC170VL_DESC: TFloatField;
    QryC170CST_ICMS: TStringField;
    QryC170CFOP: TStringField;
    QryC170VL_BC_ICMS: TFloatField;
    QryC170ALIQ_ICMS: TFloatField;
    QryC170VL_ICMS: TFloatField;
    QryC170VL_BC_ICMS_ST: TFloatField;
    QryC170ALIQ_ST: TFloatField;
    QryC170VL_ICMS_ST: TFloatField;
    QryC170ID: TIntegerField;
    QryC170DESCR_ITEM: TStringField;
    QryResultadoSESTOQUE_FINAL: TFloatField;
    Qry0200ID_SPED: TIntegerField;
  private
    { Private declarations }
    function GetSQLResultadoAnalitico:String;
    function GetSQLResultadoSintetico:String;
  public
    { Public declarations }
    function GetProduto(AID : String):String;
    function GetResultadoAnalitico:String;
    function GetResultadoSintetico:String;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses udmBase,biblKhronos;

{ TDMImportacaoSPED }

function TDMImportacaoSPED.GetProduto(AID: String): String;
begin
  Qry0200.DisableControls;
  Qry0200.Locate('COD_ITEM',AID,[]);
  result  := Qry0200DESCR_ITEM.AsString;
  Qry0200.EnableControls;
end;

function TDMImportacaoSPED.GetResultadoAnalitico: String;
begin

end;

function TDMImportacaoSPED.GetResultadoSintetico: String;
begin
  QryResultadoS.Close;
  QryResultadoS.ParamByName('ID').AsInteger := Qry0000ID.AsInteger;
  QryResultadoS.Open;
  CopyQuery(QryResultadoS.SQL.Text);
end;

function TDMImportacaoSPED.GetSQLResultadoAnalitico: String;
begin

end;

function TDMImportacaoSPED.GetSQLResultadoSintetico: String;
begin

end;

end.
