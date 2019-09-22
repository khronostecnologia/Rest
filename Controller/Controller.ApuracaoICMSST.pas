unit Controller.ApuracaoICMSST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, biblKhronos,DateUtils;

type
  TControllerApuracaoICMSST = class
  private
    FView : TForm;
    FModel: TDataModule;
    FMensagem: String;
    procedure SetMensagem(const Value: String);
  public
    function ValidadoDadosBasicos:Boolean;
    procedure GerarSintegra;
    procedure GerarArquivoSEF;
    constructor create(pView: TForm; pModel : TDataModule);
    property Mensagem : String read FMensagem write SetMensagem;
  end;

implementation

{ TControllerApuracaoICMSST }

Uses uApuracaoICMSST, uDMApuracaoICMSST,uDMBase;

constructor TControllerApuracaoICMSST.create(pView: TForm; pModel : TDataModule);
begin
  inherited create;
  FView  := pView;
  FModel := pModel;
end;

procedure TControllerApuracaoICMSST.GerarArquivoSEF;
begin

end;

procedure TControllerApuracaoICMSST.GerarSintegra;
var
  vCodigo : String;
  vEmp    : String;
  vMes    : String;
  vAno    : String;

  procedure GeraRegistro10;
  Const
    cCodigoConv        = '3 - Convênio 57/95 Alt. 76/03';
    cNaturezaInf       = '1 - Interestaduais - Somente operações sujeitas ao regime de Substituição Tributária';
    cFinalidadeArquivo = '1 - Normal';
  begin
    with TFrmApuracao(FView).ACBrSintegra do
    begin
      Registro10.CNPJ                := vCodigo;
      Registro10.Inscricao           := 'ISENTO';
      Registro10.RazaoSocial         := vEmp;
      Registro10.Cidade              := 'UBERLANDIA';
      Registro10.Estado              := 'MG';
      Registro10.Telefone            := '3511111111';
      Registro10.DataInicial         := StartOfaMonth(vAno.ToInteger,vMes.ToInteger);
      Registro10.DataFinal           := EndOfaMonth(vAno.ToInteger,vMes.ToInteger);
      Registro10.CodigoConvenio      := cCodigoConv;
      Registro10.NaturezaInformacoes := cNaturezaInf;
      Registro10.FinalidadeArquivo   := cFinalidadeArquivo;
    end;
  end;

begin
  vCodigo := TFrmApuracao(FView).EdtCodPart.Text;
  vEmp    := TFrmApuracao(FView).EdtParticipante.Text;
  vMes    := TFrmApuracao(FView).cmbMes.Text;
  vAno    := TFrmApuracao(FView).CmbAno.Text;

  with TFrmApuracao(FView).ACBrSintegra do
  begin
    FileName := dmPrincipal.DirRaizApp + '\Sintegra\Sint_' + vEmp + vMes + vAno;
    GeraRegistro10;
  end;
end;

procedure TControllerApuracaoICMSST.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

function TControllerApuracaoICMSST.ValidadoDadosBasicos: Boolean;
begin
  result := false;

  if TFrmApuracao(FView).ChkXML.Checked then
  begin
    if TFrmApuracao(FView).cxGridDBTVNF.DataController.DataSource.DataSet.IsEmpty then
    begin
      FMensagem := 'Dados dos XML(s) não encontrado(s).';
      exit;
    end;
  end;

  if TFrmApuracao(FView).ChkSPED.Checked then
  begin
    if TFrmApuracao(FView).cxGridDBTVW0200.DataController.DataSource.DataSet.IsEmpty then
    begin
      FMensagem := 'Dados do SPED não encontrado.';
      exit;
    end;
  end;

  result := true;
end;

end.
