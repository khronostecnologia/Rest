unit uDMBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,Vcl.Forms, FireDAC.Comp.UI, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef,vcl.forms;

type
  TDMBase = class(TDataModule)
    DB: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryEmpresa: TFDQuery;
    QryEmpresaIDCIDADE: TIntegerField;
    QryEmpresaUF: TStringField;
    QryEmpresaID: TIntegerField;
    QryEmpresaRAZAO_SOCIAL: TStringField;
    QryEmpresaNOME_EMPRESARIAL: TStringField;
    QryEmpresaCPFCNPJ: TStringField;
    QryEmpresaRGIE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FDirApp: String;
    FDirRaizApp: String;
    FDirImportacaoXML: String;
    FDirLogGeral: String;
    procedure SetDirApp(const Value: String);
    procedure SetDirRaizApp(const Value: String);
    procedure SetDirImportacaoXML(const Value: String);
    procedure SetDirLogGeral(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    procedure ConectaBanco;
    function GravaEmpresa(AQry : TDataSet):Boolean;
    function GetEmpresa(ACodigo : String):Boolean;
    function GetNomeArqLog : String;
    property DirApp : String read FDirApp write SetDirApp;
    property DirRaizApp : String read FDirRaizApp write SetDirRaizApp;
    property DirImportacaoXML : String read FDirImportacaoXML write SetDirImportacaoXML;
    property DirLogGeral : String read FDirLogGeral write SetDirLogGeral;
    class var BancoExec : TFDConnection;
  end;

var
  dmPrincipal: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses uMensagem,BiblKhronos, Vcl.Dialogs;

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
     on e: exception do
     ShowMessage('Erro : ' + e.Message + ' ao tentar conectar no banco de dados.');
   end;
  finally
    BancoExec := DB;
  end;
end;

procedure TDMBase.DataModuleCreate(Sender: TObject);
begin
  FDirApp           := ExtractFilePath(application.exeName);
  FDirRaizApp       := FDirApp.Replace('Aplicacoes\','').Trim;
  FDirLogGeral      := FDirRaizApp + 'Log\Geral';
  FDirImportacaoXML := FDirRaizApp + 'Log\ImportacaoXML';

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

      with MapRules.Add do
      begin
        SourceDataType := dtBCD;
        TargetDataType := dtDouble;
      end;

      with MapRules.Add do
      begin
        SourceDataType := dtFmtBCD;
        TargetDataType := dtDouble;
      end;
  end;
end;

function TDMBase.GetEmpresa(ACodigo: String): Boolean;
begin
  QryEmpresa.Close;
  QryEmpresa.ParamByName('ID').AsInteger := ACodigo.ToInteger;
  QryEmpresa.Open;
  Result  := not (QryEmpresa.IsEmpty);
end;

function TDMBase.GetNomeArqLog: String;
begin
  result := FormatDateTime('ddmmyyhhmmss',Now);
end;

function TDMBase.GravaEmpresa(AQry: TDataSet):Boolean;
begin
  result := false;
  if  AQry.IsEmpty then
  begin
    FrmMensagem.Informacao('Registro 0000 n�o encontrado!');
    exit;
  end;

  if not QryEmpresa.Active then
  begin
    QryEmpresa.ParamByName('ID').AsInteger := -1;
    QryEmpresa.Open;
  end;

  QryEmpresa.Insert;
  QryEmpresaID.AsInteger               := GetID('"CADASTROS"."EMPRESAS"',DB) + 1;
  QryEmpresaRAZAO_SOCIAL.AsString      := AQry.FieldByName('NOME').AsString;
  QryEmpresaNOME_EMPRESARIAL.AsString  := AQry.FieldByName('NOME').AsString;
  QryEmpresaRGIE.AsString              := AQry.FieldByName('IE').AsString;
  QryEmpresaUF.AsString                := AQry.FieldByName('UF').AsString;
  QryEmpresaCPFCNPJ.AsString           := AQry.FieldByName('CNPJ').AsString;
  QryEmpresaIDCIDADE.AsInteger         := AQry.FieldByName('COD_MUN').AsInteger;
  QryEmpresa.Post;
  result :=  (QryEmpresa.ApplyUpdates(0) = 0);
end;

procedure TDMBase.SetDirApp(const Value: String);
begin
  FDirApp := Value;
end;

procedure TDMBase.SetDirImportacaoXML(const Value: String);
begin
  FDirImportacaoXML := Value;
end;

procedure TDMBase.SetDirLogGeral(const Value: String);
begin
  FDirLogGeral := Value;
end;

procedure TDMBase.SetDirRaizApp(const Value: String);
begin
  FDirRaizApp := Value;
end;

end.
