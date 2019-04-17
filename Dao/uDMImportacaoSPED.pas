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
    QryC100e: TFDQuery;
    QryC170e: TFDQuery;
    QryC400: TFDQuery;
    QryC470: TFDQuery;
    Ds0000: TDataSource;
    Ds0200: TDataSource;
    DsC100e: TDataSource;
    DsC170e: TDataSource;
    DsC100s: TDataSource;
    DsC170s: TDataSource;
    DsC400: TDataSource;
    DsC470: TDataSource;
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
    QryC100s: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    QryC170eID_SPED: TIntegerField;
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
    QryC170s: TFDQuery;
    IntegerField2: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField17: TFloatField;
    StringField9: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImportacaoSPED: TDMImportacaoSPED;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses udmBase;

end.
