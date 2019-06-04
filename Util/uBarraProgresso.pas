unit uBarraProgresso;

interface

Uses System.Classes,SysUtils,Vcl.StdCtrls,W7ProgressBars,Vcl.Forms;

type
  TBarraProgresso = class
  Public
    class procedure MostraMensagem(Var pLabel : TLabel ; pTexto : String);
    class procedure Inicia(Var pProgresBar : TW7ProgressBar ; pValorMaximo :Integer);
    class procedure IncPosicao(Var pProgresBar : TW7ProgressBar ; pPosicao : Integer = 1);
    class procedure Visivel(Var pProgresBar : TW7ProgressBar ; Var pLabel : TLabel;
    pVisivel : Boolean);
  end;

implementation

{ TBarraProgresso }

class procedure TBarraProgresso.IncPosicao(var pProgresBar: TW7ProgressBar;
  pPosicao: Integer = 1);
begin
  pProgresBar.Position := pProgresBar.Position + pPosicao;
  Application.ProcessMessages;
  Sleep(500);
end;

class procedure TBarraProgresso.Inicia(var pProgresBar: TW7ProgressBar;
  pValorMaximo: Integer);
begin
  pProgresBar.Min := 0;
  pProgresBar.Max := pValorMaximo;
  Application.ProcessMessages;
end;

class procedure TBarraProgresso.MostraMensagem(Var pLabel : TLabel ;
pTexto : String);
begin
  pLabel.Caption := pTexto;
end;

class procedure TBarraProgresso.Visivel(Var pProgresBar : TW7ProgressBar ;
Var pLabel : TLabel; pVisivel : Boolean);
begin
  pProgresBar.Visible := false;
  pLabel.Visible      := pProgresBar.Visible;
end;

end.
