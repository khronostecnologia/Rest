program Rest;

uses
  Vcl.Forms,
  uLogin in 'Units\uLogin.pas' {FrmLogin},
  uEmpresa in 'Units\uEmpresa.pas' {FrmEmpresas},
  uDMmain in 'Dao\uDMmain.pas' {DMmain: TDataModule},
  uMenu in 'Units\uMenu.pas' {FrmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.
