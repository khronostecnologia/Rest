program Rest;

uses
  Vcl.Forms,
  SysUtils,
  uLogin in 'Units\uLogin.pas' {FrmLogin},
  uEmpresa in 'Units\uEmpresa.pas' {FrmEmpresas},
  uMenu in 'Units\uMenu.pas' {FrmMenu},
  uMensagem in 'Util\uMensagem.pas' {FrmMensagem},
  uSplash in 'Units\uSplash.pas' {FrmSplash},
  uDMBase in 'Dao\uDMBase.pas' {DMBase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  DMBase    := TDMBase.create(nil);
  try
    //DMmain.ConectaBanco;
  except
    On e: exception do
    begin
      FrmMensagem.Informacao('Erro : ' + e.message + ' ao tentar conectar ' +
                             'no banco de dados.');
      Application.terminate;
    end;
  end;
  FrmSplash := TFrmSplash.Create(nil);
  FrmSplash.ShowModal;
  FreeAndNil(FrmSplash);
  Application.Run;

end.

finalization
FreeAndNil(DMBase);

