unit uImportacaoSPEDICMSIPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  Vcl.Mask, JvExMask, JvToolEdit, AdvGroupBox, AdvGlowButton;

type
  TFrmImportarSPED = class(TFrmMaster)
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    EdtArq: TJvDirectoryEdit;
    BtnIniciaImportacao: TAdvGlowButton;
    BtnNovo: TAdvGlowButton;
    BtnGravar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    procedure BtnIniciaImportacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImportarSPED;
  public
    { Public declarations }
  end;

var
  FrmImportarSPED: TFrmImportarSPED;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,BiblKhronos,uDMImportacaoSPED;

procedure TFrmImportarSPED.BtnIniciaImportacaoClick(Sender: TObject);
begin
  inherited;
  if not EdtArq.Text <> '' then
  begin
    FrmMensagem.Informacao('Informe o arquivo que deseja importar ' +
                           ' e tente novamente!');
    SetaFoco(EdtArq);
  end;
  ImportarSPED;
end;

procedure TFrmImportarSPED.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmImportarSPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(DMImportacaoSPED);
end;

procedure TFrmImportarSPED.FormCreate(Sender: TObject);
begin
  inherited;
  DMImportacaoSPED := TDMImportacaoSPED.Create(nil);
end;

procedure TFrmImportarSPED.ImportarSPED;
begin

end;

end.
