unit uDMBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,Vcl.Forms, FireDAC.Comp.UI, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TDMBase = class(TDataModule)
    DB: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryEmpresa: TFDQuery;
    QryEmpresaID: TIntegerField;
    QryEmpresaRAZAO_SOCIAL: TWideStringField;
    QryEmpresaNOME_EMPRESARIAL: TWideStringField;
    QryEmpresaRGIE: TWideStringField;
    QryEmpresaENDERECO: TWideStringField;
    QryEmpresaBAIRRO: TWideStringField;
    QryEmpresaCEP: TWideStringField;
    QryEmpresaCPFCNPJ: TWideStringField;
    QryEmpresaNUMERO: TIntegerField;
    QryEmpresaIDCIDADE: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDirApp: String;
    procedure SetDirApp(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    procedure ConectaBanco;
    function GetEmpresa(ACodigo : String):Boolean;
    property DirApp : String read FDirApp write SetDirApp;
    class var BancoExec : TFDConnection;
  end;

var
  dmPrincipal: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMBase.ConectaBanco;
begin
  try
   try
    with DB do
    begin
      close;
      Params.Clear;
      Params.LoadFromFile(FDirApp + 'Config.ini');
      Open;
    end;
   except
     raise;
   end;
  finally
    BancoExec := DB;
  end;
end;

procedure TDMBase.DataModuleCreate(Sender: TObject);
begin
  FDirApp := ExtractFilePath(application.exeName);

  with DB.FormatOptions do
  begin
    OwnMapRules := True;
      with MapRules.Add do
      begin
        SourceDataType  := dtWideString;
        TargetDataType  := dtAnsiString;
      end;

      with MapRules.Add do
      begin
        SourceDataType := dtDateTimeStamp;
        TargetDataType := dtDateTime;
      end;
  end;
end;

function TDMBase.GetEmpresa(ACodigo: String): Boolean;
begin
  QryEmpresa.Close;
  QryEmpresa.ParamByName('ID').AsString := ACodigo;
  QryEmpresa.Open;
  Result  := not (QryEmpresa.IsEmpty);
end;

procedure TDMBase.SetDirApp(const Value: String);
begin
  FDirApp := Value;
end;

end.
