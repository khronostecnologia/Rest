unit uCadContribuinte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvGlowButton,
  AdvGroupBox, AdvSmoothPanel, Vcl.DBCtrls, Vcl.Mask, Data.DB,biblKhronos;

type
  TFrmCadContribuinte = class(TFrmMaster)
    GpbPesquisa: TAdvGroupBox;
    lblCodigo: TLabel;
    BtnBusca: TAdvGlowButton;
    EdtCodigo: TEdit;
    BtnAdicionar: TAdvGlowButton;
    BtnEditar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSalvar: TAdvGlowButton;
    BtnExcluir: TAdvGlowButton;
    GpbDadosPrincipais: TAdvGroupBox;
    lblNome: TLabel;
    EdtDescNome: TDBEdit;
    lblCNPJ: TLabel;
    EdtCNPJ: TDBEdit;
    Label3: TLabel;
    EdtIE: TDBEdit;
    lblIE: TLabel;
    GpbEnderecos: TAdvGroupBox;
    lblLogradouro: TLabel;
    EdtLogradouro: TDBEdit;
    lblNumero: TLabel;
    EdtNumero: TDBEdit;
    lblComplemento: TLabel;
    EdtComplemento: TDBEdit;
    lblBairro: TLabel;
    EdtBairro: TDBEdit;
    lblCep: TLabel;
    EdtCEP: TDBEdit;
    lblTelefone: TLabel;
    EdtTelefone: TDBEdit;
    lblMunicipio: TLabel;
    EdtMunicipio: TDBComboBox;
    lblUF: TLabel;
    EdtUF: TDBComboBox;
    DsPrincipal: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlaBotoesPrincipal(AState : TState);
    procedure ControlaEditMaster(AEnabled : Boolean);
    procedure SetCodigoEdit;
  public
    { Public declarations }
  end;

var
  FrmCadContribuinte: TFrmCadContribuinte;

implementation

Uses uDMCadContribuinte,uPesquisa,uMensagem,uDMBase;

{$R *.dfm}

procedure TFrmCadContribuinte.BtnAdicionarClick(Sender: TObject);
begin
  inherited;
  DMCadContribuinte.Adicionar;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(True);
  SetaFoco(EdtDescNome);
end;

procedure TFrmCadContribuinte.BtnBuscaClick(Sender: TObject);
begin
  inherited;
  Try
    FrmPesquisa  := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "GET_CONTRIBUINTE" ORDER BY "NOME"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
      EdtCodigo.text := FrmPesquisa.QryPesquisa.fieldbyName('CODIGO').AsString;
      DMCadContribuinte.AbreDataSet(StrToInt(EdtCodigo.Text));
      ControlaBotoesPrincipal(stBrowser);
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;
end;

procedure TFrmCadContribuinte.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  DMCadContribuinte.Cancelar;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(False);
end;

procedure TFrmCadContribuinte.BtnEditarClick(Sender: TObject);
begin
  inherited;
  DMCadContribuinte.Editar;
  SetCodigoEdit;
  ControlaBotoesPrincipal(stEdit);
  ControlaEditMaster(True);
  SetaFoco(EdtDescNome);
end;

procedure TFrmCadContribuinte.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  Try
    DMCadContribuinte.Excluir;
    DMCadContribuinte.GravarBanco;
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

procedure TFrmCadContribuinte.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  Try
   dmPrincipal.BancoExec.StartTransaction;
   DMCadContribuinte.Salvar;
   DMCadContribuinte.GravarBanco;
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

procedure TFrmCadContribuinte.ControlaBotoesPrincipal(AState: TState);
begin
  BtnAdicionar.Enabled   :=  (DMCadContribuinte.QryContribuinte.State in [dsBrowse]);
  BtnEditar.Enabled      :=  ((DMCadContribuinte.QryContribuinte.State in [dsBrowse])
                              and not (DMCadContribuinte.QryContribuinte.IsEmpty) );
  BtnExcluir.Enabled     :=  (DMCadContribuinte.QryContribuinte.State in [dsInsert,dsEdit]);
  BtnSalvar.Enabled      :=  (DMCadContribuinte.QryContribuinte.State in [dsInsert,dsEdit]);
  BtnCancelar.Enabled    :=  BtnSalvar.Enabled;
end;

procedure TFrmCadContribuinte.ControlaEditMaster(AEnabled: Boolean);
var
  i : Integer;
begin
  for I := 0 to Pred(Self.ComponentCount) do
  begin
    if Self.Components[I] is TDBEdit then
    TDBEdit(Self.Components[I]).Enabled := AEnabled;
  end;
end;

procedure TFrmCadContribuinte.EdtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_Return then
  begin
    DMCadContribuinte.AbreDataSet(StrToInt(EdtCodigo.Text));
    ControlaBotoesPrincipal(stBrowser);
  end;

  if Key = VK_F3 then
  BtnBusca.Click;
end;

procedure TFrmCadContribuinte.FormCreate(Sender: TObject);
begin
  inherited;
  DMCadContribuinte  := TDMCadContribuinte.Create(Self);
end;

procedure TFrmCadContribuinte.FormShow(Sender: TObject);
begin
  inherited;
  DMCadContribuinte.AbreDataSet;
  ControlaBotoesPrincipal(stBrowser);
  ControlaEditMaster(False);
  SetaFoco(EdtCodigo);
end;

procedure TFrmCadContribuinte.SetCodigoEdit;
begin
  EdtCodigo.Text    := iif(DMCadContribuinte.QryContribuinte.State in
                       [dsInsert,dsEdit,dsBrowse],DMCadContribuinte.
                       QryContribuinteID.AsInteger,0);

  EdtCodigo.Enabled := not (DMCadContribuinte.QryContribuinte.State
                       in [dsInsert,dsEdit]);
end;

end.
