unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothPanel, Vcl.Menus, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, AdvGlowButton;

type
  TFrmMenu = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Empresas1: TMenuItem;
    Produtos1: TMenuItem;
    Relatrios1: TMenuItem;
    SPEDICMSIPI1: TMenuItem;
    Relatrios2: TMenuItem;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

end.
