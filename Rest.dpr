program Rest;

uses
  Vcl.Forms,
  SysUtils,
  uLogin in 'Units\uLogin.pas' {FrmLogin},
  uMenu in 'Units\uMenu.pas' {FrmMenu},
  uMensagem in 'Util\uMensagem.pas' {FrmMensagem},
  uSplash in 'Units\uSplash.pas' {FrmSplash},
  uDMBase in 'Dao\uDMBase.pas' {DMBase: TDataModule},
  uPesquisa in 'Util\uPesquisa.pas' {FrmPesquisa},
  BiblKhronos in 'Util\BiblKhronos.pas',
  uMaster in 'Heranca\uMaster.pas' {FrmMaster},
  uImportacaoSPED in 'Units\uImportacaoSPED.pas' {FrmImportacao},
  uImportacaoXML in 'Units\uImportacaoXML.pas' {FrmImportacaoXML},
  uDMImportacaoXML in 'Dao\uDMImportacaoXML.pas' {DMImportacaoXML: TDataModule},
  uArquivo in 'Util\uArquivo.pas',
  uDMImportacaoSPED in 'Dao\uDMImportacaoSPED.pas' {DMImportacaoSPED: TDataModule},
  uBarraProgresso in 'Util\uBarraProgresso.pas',
  uGenerico in 'Util\uGenerico.pas',
  uLog in 'Util\uLog.pas',
  uApuracaoICMSST in 'Units\uApuracaoICMSST.pas' {FrmApuracao},
  uDMApuracaoICMSST in 'Dao\uDMApuracaoICMSST.pas' {DmApuracaoICMSST: TDataModule},
  Controller.ApuracaoICMSST in 'Controller\Controller.ApuracaoICMSST.pas',
  uCadContribuinte in 'Units\uCadContribuinte.pas' {FrmCadContribuinte},
  uDMCadContribuinte in 'Dao\uDMCadContribuinte.pas' {DMCadContribuinte: TDataModule},
  uCadNCM in 'Units\uCadNCM.pas' {FrmCadNCM},
  uDMCadNCM in 'Dao\uDMCadNCM.pas' {DMCadNCM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  dmPrincipal    := TDMBase.create(nil);
  try
    dmPrincipal.ConectaBanco;
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
  FrmMensagem := TFrmMensagem.Create(nil);
  Application.Run;

end.

finalization
FreeAndNil(DMBase);
freeandnil(FrmMensagem);

