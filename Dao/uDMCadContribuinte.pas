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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Editar;
    procedure Adicionar;
    procedure Cancelar;
    procedure Salvar;
    procedure Excluir;
    procedure GravarBanco;
    function AbreDataSet(pCodigo : Integer = -1):Boolean;
  end;

var
  DMCadContribuinte: TDMCadContribuinte;

implementation

uses uDMBase,uMensagem;

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
procedure TDMCadContribuinte.Adicionar;
begin
  if FrmMensagem.Confirmacao('Deseja realmente incluir um registro?') then
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

procedure TDMCadContribuinte.Excluir;
begin
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

procedure TDMCadContribuinte.Salvar;
begin
  QryContribuinte.Post;
end;

end.
