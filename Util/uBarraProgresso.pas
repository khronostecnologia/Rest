unit uBarraProgresso;

interface

Uses System.Classes,SysUtils,Vcl.StdCtrls,W7ProgressBars;

type
  TBarraProgresso = class
  Public
    class procedure MostraMensagem(Var pLabel : TLabel ; pTexto : String);
    class procedure Inicia(Var pProgresBar : TW7ProgressBar ; pValorMaximo :Integer);
    class procedure IncPosicao(Var pProgresBar : TW7ProgressBar ; pPosicao :Integer = 1);
    class procedure Visivel(Var pProgresBar : TW7ProgressBar ; Var pLabel : TLabel;
    pVisivel : Boolean);
  end;

implementation

{ TBarraProgresso }

class procedure TBarraProgresso.IncPosicao(var pProgresBar: TW7ProgressBar;
  pPosicao: Integer);
begin
  with pProgresBar do
  begin
    Position := Position + pPosicao;
  end;
end;

class procedure TBarraProgresso.Inicia(var pProgresBar: TW7ProgressBar;
  pValorMaximo: Integer);
begin
  with pProgresBar do
  begin
    Min := 0;
    Max := pValorMaximo;
  end;
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
