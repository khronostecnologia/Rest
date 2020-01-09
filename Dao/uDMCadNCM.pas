unit uDMCadNCM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMCadNCM = class(TDataModule)
    QryNCM: TFDQuery;
    QryNCMid: TIntegerField;
    QryNCMncm: TStringField;
    QryNCMmva: TFloatField;
    procedure QryNCMNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Editar;
    procedure Cancelar;
    procedure Salvar;
    procedure GravarBanco;
    function  Excluir:Boolean;
    function Adicionar : Boolean;
    function AbreDataSet(pCodigo : Integer = -1):Boolean;
  end;

var
  DMCadNCM: TDMCadNCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uMensagem, BiblKhronos, uDMBase;

{$R *.dfm}

{ TDataModule1 }

function TDMCadNCM.AbreDataSet(pCodigo: Integer): Boolean;
begin
  with QryNCM do
  begin
    Close;
    Params[0].AsInteger := pCodigo;
    Open;
  end;
end;

function TDMCadNCM.Adicionar: Boolean;
begin
  result := FrmMensagem.Confirmacao('Deseja incluir um novo NCM?');

  if result then
  QryNCM.Append;
end;

procedure TDMCadNCM.Cancelar;
begin
  QryNCM.CancelUpdates;
end;

procedure TDMCadNCM.Editar;
begin
  QryNCM.Edit;
end;

function TDMCadNCM.Excluir: Boolean;
Const
  MsgExclusao = 'Deseja realmente excluir o NCM?';
begin
  result := FrmMensagem.Confirmacao(MsgExclusao);

  if not result then
  exit;

  QryNCM.Delete;
end;

procedure TDMCadNCM.GravarBanco;
begin
  if QryNCM.UpdateStatus <> usUnmodified then
 begin
  if QryNCM.ApplyUpdates(0) > 0 then
  Raise Exception.Create('Erro ao aplicar atualização na qryPrincipal!');
 end;
end;

procedure TDMCadNCM.QryNCMNewRecord(DataSet: TDataSet);
Const
  SEQUENCE = 'id_ncm';
begin
  QryNCMID.AsInteger := GetSequence(SEQUENCE,dmPrincipal.BancoExec)
end;

procedure TDMCadNCM.Salvar;
begin
  QryNCM.Post;
end;

end.
