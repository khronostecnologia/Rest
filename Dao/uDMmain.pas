unit uDMmain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Comp.UI, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMmain = class(TDataModule)
    DB: TFDConnection;
    Transacao: TFDTransaction;
    WCursor: TFDGUIxWaitCursor;
    DriverPostGres: TFDPhysPgDriverLink;
    QryEmpresa: TFDQuery;
    QryUsuario: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMmain: TDMmain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
