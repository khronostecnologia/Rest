unit uCadNCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  AdvGlowButton, Data.DB, Vcl.DBCtrls, Vcl.Mask, AdvGroupBox, BiblKhronos;

type
  TFrmCadNCM = class(TFrmMaster)
    BtnAdicionar: TAdvGlowButton;
    BtnEditar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSalvar: TAdvGlowButton;
    BtnExcluir: TAdvGlowButton;
    DsCadNCM: TDataSource;
    GpbPesquisa: TAdvGroupBox;
    lblCodigo: TLabel;
    BtnBusca: TAdvGlowButton;
    EdtCodigo: TEdit;
    GpbDadosPrincipais: TAdvGroupBox;
    lblNome: TLabel;
    EdtNCM: TDBEdit;
    Label1: TLabel;
    EdtMVA: TDBEdit;
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnExitPadrao(Sender : TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlaBotoesPrincipal(AState : TState);
    procedure SetCodigoEdit;
    procedure ControlaEditMaster(AEnabled : Boolean);
  public
    { Public declarations }
  end;

var
  FrmCadNCM: TFrmCadNCM;

implementation

{$R *.dfm}

uses uDMCadNCM, uDMBase, uPesquisa, uMensagem;

procedure TFrmCadNCM.BtnAdicionarClick(Sender: TObject);
begin
  inherited;
  if not DMCadNCM.Adicionar then
  exit;

  SetCodigoEdit;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(True);
  SetaFoco(EdtNCM);
end;

procedure TFrmCadNCM.BtnBuscaClick(Sender: TObject);
begin
  inherited;
  Try
    FrmPesquisa  := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "NCM"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
      EdtCodigo.text := FrmPesquisa.QryPesquisa.fieldbyName('CODIGO').AsString;
      DMCadNCM.AbreDataSet(StrToInt(EdtCodigo.Text));
      ControlaBotoesPrincipal(stBrowser);
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;
end;

procedure TFrmCadNCM.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  DMCadNCM.Cancelar;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(False);
  SetaFoco(EdtCodigo);
end;

procedure TFrmCadNCM.BtnEditarClick(Sender: TObject);
begin
  inherited;
  DMCadNCM.Editar;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stEdit);
  ControlaEditMaster(True);
  SetaFoco(EdtNCM);
end;

procedure TFrmCadNCM.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  Try
    if not DMCadNCM.Excluir then
    exit;

    DMCadNCM.GravarBanco;
  except
    On e: exception do
    begin
      dmPrincipal.BancoExec.Rollback;
      FrmMensagem.Informacao(e.Message);
    end;
  end;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(False);
end;

procedure TFrmCadNCM.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  Try
   dmPrincipal.BancoExec.StartTransaction;
   DMCadNCM.Salvar;
   DMCadNCM.GravarBanco;
   dmPrincipal.BancoExec.Commit;
   FrmMensagem.Informacao('Registro salvo com sucesso!');
   ControlaBotoesPrincipal(stBrowser);
   ControlaEditMaster(False);
  Except
    On e: exception do
    begin
      dmPrincipal.BancoExec.Rollback;
      FrmMensagem.Informacao(e.message);
    end;
  end;
end;

procedure TFrmCadNCM.ControlaBotoesPrincipal(AState: TState);
begin
  BtnAdicionar.Enabled   := (DMCadNCM.QryNCM.State in [dsBrowse]);
  BtnEditar.Enabled      := ((DMCadNCM.QryNCM.State in [dsBrowse])
                             and not (DMCadNCM.QryNCM.IsEmpty) );
  BtnExcluir.Enabled     := (DMCadNCM.QryNCM.State in [dsInsert,dsEdit]);
  BtnSalvar.Enabled      := (DMCadNCM.QryNCM.State in [dsInsert,dsEdit]);
  BtnCancelar.Enabled    :=  BtnSalvar.Enabled;
  BtnBusca.Enabled       := (DMCadNCM.QryNCM.State in [dsBrowse]);
end;

procedure TFrmCadNCM.ControlaEditMaster(AEnabled: Boolean);
var
  i : Integer;
begin
  for I := 0 to Pred(Self.ComponentCount) do
  begin
    if Self.Components[I] is TDBEdit then
    TDBEdit(Self.Components[I]).Enabled := AEnabled;
  end;
end;

procedure TFrmCadNCM.EdtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_Return then
  begin
    if EdtCodigo.Text <> '' then
    begin
      DMCadNCM.AbreDataSet(StrToInt(EdtCodigo.Text));
      ControlaBotoesPrincipal(stBrowser);
    end
    else
      BtnAdicionar.Click;
  end;

  if Key = VK_F3 then
  BtnBusca.Click;
end;

procedure TFrmCadNCM.FormCreate(Sender: TObject);
begin
  inherited;
  DMCadNCM  := TDMCadNCM.Create(Self);
end;

procedure TFrmCadNCM.FormShow(Sender: TObject);
begin
  inherited;
  DMCadNCM.AbreDataSet;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(False);
  SetaFoco(EdtCodigo);
end;

procedure TFrmCadNCM.OnExitPadrao(Sender: TObject);
begin
  if Sender.InheritsFrom(TCustomEdit) then
  TCustomEdit(Sender).Text := UpperCase(TCustomEdit(Sender).Text);
end;

procedure TFrmCadNCM.SetCodigoEdit;
begin
  EdtCodigo.Text    := iif(DMCadNCM.QryNCMID.AsInteger > 0,
                       DMCadNCM.QryNCMID.AsInteger,
                       '');

  EdtCodigo.Enabled := not (DMCadNCM.QryNCM.State
                       in [dsInsert,dsEdit]);
end;

end.
