unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, dxGDIPlusClasses,
  Vcl.ExtCtrls, AdvSmoothLabel, AdvSmoothPanel;

type
  TMensagem = (MsgConfirmacao,MsgInformacao);

  TFrmMensagem = class(TForm)
    PnlGeral: TAdvSmoothPanel;
    PnlCentral: TAdvSmoothPanel;
    lblTextoMensagem: TAdvSmoothLabel;
    ImgConfirma: TImage;
    ImgInfo: TImage;
    BtnSim: TAdvGlowButton;
    BtnNao: TAdvGlowButton;
    BtnOk: TAdvGlowButton;
    procedure BtnSimClick(Sender: TObject);
    procedure BtnNaoClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    FRetorno: Boolean;
    procedure HabilitaBotoesMensagem(AMensagem : TMensagem);
    procedure HabilitaImageMensagem;
  public
    { Public declarations }
    function  Confirmacao(ATexto : String): Boolean;
    procedure Informacao(ATexto : String);
  end;

var
  FrmMensagem: TFrmMensagem;

implementation

{$R *.dfm}

procedure TFrmMensagem.HabilitaBotoesMensagem(AMensagem : TMensagem);
begin
  BtnSim.Visible := (AMensagem = MsgConfirmacao);
  BtnNao.Visible := BtnSim.Visible;
  BtnOk.Visible  := not (BtnNao.Visible);
end;

procedure TFrmMensagem.BtnSimClick(Sender: TObject);
begin
  FRetorno := true;
  close;
end;

procedure TFrmMensagem.BtnNaoClick(Sender: TObject);
begin
  FRetorno := false;
  close;
end;

procedure TFrmMensagem.BtnOkClick(Sender: TObject);
begin
  FRetorno := true;
  close;
end;

procedure TFrmMensagem.HabilitaImageMensagem;
begin
  ImgConfirma.Visible := BtnSim.Visible;
  ImgInfo.Visible     := not (ImgConfirma.Visible);
end;

function TFrmMensagem.Confirmacao(ATexto: String): Boolean;
begin
  lblTextoMensagem.Caption.Text := ATexto;
  HabilitaBotoesMensagem(MsgConfirmacao);
  HabilitaImageMensagem;
  ShowModal;
  result := FRetorno;
end;

procedure TFrmMensagem.Informacao(ATexto: String);
begin
  lblTextoMensagem.Caption.Text := ATexto;
  HabilitaBotoesMensagem(MsgInformacao);
  HabilitaImageMensagem;
  ShowModal;
end;

end.