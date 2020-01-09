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
  FireDAC.Phys.PG, Data.DB, FireDAC.Comp.DataSet, AdvGroupBox, Vcl.AppEvnts,
  uLog;

type
  TFrmMenu = class(TForm)
    Menu: TMainMenu;
    MnuImportacao: TMenuItem;
    MnuSubImportaSPED: TMenuItem;
    Sair1: TMenuItem;
    PnlGeral: TAdvSmoothPanel;
    PnlAtalhos: TAdvSmoothPanel;
    PnlFooter: TAdvSmoothPanel;
    ImgLogo: TImage;
    lblTitulo: TLabel;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    MnuImportaXML: TMenuItem;
    MnuApuracao: TMenuItem;
    MnuApuracaoXML: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Cadastros1: TMenuItem;
    Contribuinte1: TMenuItem;
    NCM1: TMenuItem;
    procedure MnuSubImportaSPEDClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure MnuImportaXMLClick(Sender: TObject);
    procedure MnuApuracaoXMLClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Contribuinte1Click(Sender: TObject);
    procedure NCM1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

Uses uDMBase,uPesquisa,uMensagem,uImportacaoSPED,uImportacaoXML,biblKhronos,
uApuracaoICMSST,uCadContribuinte, uCadNCM;

procedure TFrmMenu.MnuImportaXMLClick(Sender: TObject);
begin
  FrmImportacaoXML := TFrmImportacaoXML.Create(nil,ftImportacao);
  FrmImportacaoXML.Show;
end;

procedure TFrmMenu.MnuSubImportaSPEDClick(Sender: TObject);
begin
  FrmImportacaoSPED := TFrmImportacaoSPED.Create(nil);
  FrmImportacaoSPED.Show;
end;

procedure TFrmMenu.NCM1Click(Sender: TObject);
begin
  FrmCadNCM := TFrmCadNCM.Create(nil);
  FrmCadNCM.Show;
end;

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMenu.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  TLog.Gravar(dmPrincipal.DirRaizApp,'Log' + DateTimeToStr(Now),e.Message);
  Application.ShowException(E);
end;

procedure TFrmMenu.Contribuinte1Click(Sender: TObject);
begin
  FrmCadContribuinte := TFrmCadContribuinte.Create(nil);
  FrmCadContribuinte.Show;
end;

procedure TFrmMenu.MnuApuracaoXMLClick(Sender: TObject);
begin
  FrmApuracao := TFrmApuracao.Create(nil);
  FrmApuracao.Show;
end;

end.
