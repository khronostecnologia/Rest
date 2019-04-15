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
  FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet;

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
