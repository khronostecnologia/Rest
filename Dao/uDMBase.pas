unit uDMBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,Vcl.Forms;

type
  TDMBase = class(TDataModule)
    DB: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDirApp: String;
    procedure SetDirApp(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    procedure ConectaBanco;
    property DirApp : String read FDirApp write SetDirApp;
  end;

var
  DMBase: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMBase.ConectaBanco;
begin
  try
    with DB do
    begin
      close;
      Params.Clear;
      Params.LoadFromFile(FDirApp + 'Config.ini');
    end;
  finally

  end;
end;

procedure TDMBase.DataModuleCreate(Sender: TObject);
begin
  FDirApp := ExtractFilePath(application.exeName);
end;

procedure TDMBase.SetDirApp(const Value: String);
begin
  FDirApp := Value;
end;

end.
