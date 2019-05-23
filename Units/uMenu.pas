unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothPanel, Vcl.Menus, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, AdvGlowButton, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet, AdvGroupBox;

type
  TFrmMenu = class(TForm)
    Menu: TMainMenu;
    MnCadastros: TMenuItem;
    Empresas1: TMenuItem;
    Produtos1: TMenuItem;
    MnuImportacao: TMenuItem;
    MnuSubImportacaoSPED: TMenuItem;
    MnRelatorios: TMenuItem;
    Sair1: TMenuItem;
    PnlGeral: TAdvSmoothPanel;
    PnlAtalhos: TAdvSmoothPanel;
    BtnEmpresa: TAdvGlowButton;
    BtnProdutos: TAdvGlowButton;
    BtnImportacaoSPED: TAdvGlowButton;
    BtnRelatorio: TAdvGlowButton;
    PnlFooter: TAdvSmoothPanel;
    ImgLogo: TImage;
    lblTitulo: TLabel;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure MnuSubImportacaoSPEDClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure BtnImportacaoSPEDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitaMenus;
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

Uses uDMBase,uPesquisa,uMensagem,uImportacao;

procedure TFrmMenu.BtnImportacaoSPEDClick(Sender: TObject);
begin
  FrmImportacao := TFrmImportacao.Create(nil);
  FrmImportacao.Show;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  HabilitaMenus;
end;

procedure TFrmMenu.HabilitaMenus;
begin
  Menu.Items[0].Enabled := not (dmPrincipal.QryEmpresa.Active);
end;

procedure TFrmMenu.MnuSubImportacaoSPEDClick(Sender: TObject);
begin
  FrmImportacao := TFrmImportacao.Create(nil);
  FrmImportacao.Show;
end;

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
