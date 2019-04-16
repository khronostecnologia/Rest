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
    QryC100s: TFDQuery;
    QryC170s: TFDQuery;
    QryC170e: TFDQuery;
    QryC400: TFDQuery;
    QryC470: TFDQuery;
    Qry0000ID: TIntegerField;
    Qry0000RAZAO_SOCIAL: TWideStringField;
    Qry0000NOME_EMPRESARIAL: TWideStringField;
    Qry0000CPFCNPJ: TWideStringField;
    Qry0000RGIE: TWideStringField;
    Qry0000ENDERECO: TWideStringField;
    Qry0000NUMERO: TIntegerField;
    Qry0000BAIRRO: TWideStringField;
    Qry0000CEP: TWideStringField;
    Qry0000IDCIDADE: TIntegerField;
    Ds0000: TDataSource;
    Ds0200: TDataSource;
    DsC100e: TDataSource;
    DsC170e: TDataSource;
    DsC100s: TDataSource;
    DsC170s: TDataSource;
    DsC400: TDataSource;
    DsC470: TDataSource;
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
