unit uDMCadContribuinte;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMCadContribuinte = class(TDataModule)
    QryContribuinte: TFDQuery;
    QryContribuinteID: TIntegerField;
    QryContribuinteCNPJ: TStringField;
    QryContribuinteIE: TStringField;
    QryContribuinteNOME: TStringField;
    QryContribuinteMUNICIPIO: TStringField;
    QryContribuinteUF: TStringField;
    QryContribuinteLOGRADOURO: TStringField;
    QryContribuinteNUMERO: TIntegerField;
    QryContribuinteCOMPLEMENTO: TStringField;
    QryContribuinteBAIRRO: TStringField;
    QryContribuinteCEP: TStringField;
    QryContribuinteTELEFONE: TStringField;
    procedure QryContribuinteNewRecord(DataSet: TDataSet);
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
  DMCadContribuinte: TDMCadContribuinte;

implementation

uses uDMBase,uMensagem,BiblKhronos;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCadContribuinte }

function TDMCadContribuinte.AbreDataSet(pCodigo : Integer = -1): Boolean;
begin
  with QryContribuinte do
  begin
    Close;
    Params[0].AsInteger := pCodigo;
    Open;
  end;
end;
function TDMCadContribuinte.Adicionar;
begin
  result := FrmMensagem.Confirmacao('Deseja incluir um novo contribuinte?');

  if result then
  QryContribuinte.Append;
end;

procedure TDMCadContribuinte.Cancelar;
begin
  QryContribuinte.CancelUpdates;
end;

procedure TDMCadContribuinte.Editar;
begin
  QryContribuinte.Edit;
end;

function TDMCadContribuinte.Excluir:Boolean;
Const
  MsgExclusao = 'Deseja realmente excluir o contribuinte?';
begin
  result := FrmMensagem.Confirmacao(MsgExclusao);

  if not result then
  exit;

  QryContribuinte.Delete;
end;

procedure TDMCadContribuinte.GravarBanco;
begin
 if QryContribuinte.UpdateStatus <> usUnmodified then
 begin
  if QryContribuinte.ApplyUpdates(0) > 0 then
  Raise Exception.Create('Erro ao aplicar atualização na qryPrincipal!');
 end;
end;

procedure TDMCadContribuinte.QryContribuinteNewRecord(DataSet: TDataSet);
Const
  SEQUENCE = 'ID_CONTRIBUINTE';
begin
  QryContribuinteID.AsInteger := GetSequence(SEQUENCE,dmPrincipal.BancoExec)
end;

procedure TDMCadContribuinte.Salvar;
begin
  QryContribuinte.Post;
end;

end.
