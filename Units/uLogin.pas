unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.DBCtrls,
  Vcl.StdCtrls, AdvSmoothPanel, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFrmLogin = class(TForm)
    AdvPanelGeral: TAdvSmoothPanel;
    AdvPanelCentral: TAdvSmoothPanel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    lblDireitosAutorais: TLabel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    BtnEntrar: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    ImgLogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

end.
