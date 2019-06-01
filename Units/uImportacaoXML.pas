unit uImportacaoXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  W7Classes, W7ProgressBars, Vcl.Mask, JvExMask, JvToolEdit, AdvGlowButton,
  AdvGroupBox,BiblKhronos, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBarBuiltInMenu, Vcl.DBCtrls, cxPC,
  uDMImportacaoXML;

type
  TFrmImportacaoXML = class(TFrmMaster)
    GpbSelArquivos: TAdvGroupBox;
    Label1: TLabel;
    GpbProcessaImportacao: TAdvGroupBox;
    ProgressBar: TW7ProgressBar;
    lblInfoImportacao: TLabel;
    Label2: TLabel;
    BtnGravar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    BtnLocalizaImportacao: TAdvGlowButton;
    BtnNovaImportacacao: TAdvGlowButton;
    BtnImprimirResultado: TAdvGlowButton;
    BtnExcluir: TAdvGlowButton;
    EdtDiretorio: TJvDirectoryEdit;
    BtnIniciaImportacao: TAdvGlowButton;
    GpbContribuinte: TAdvGroupBox;
    cxGridContribuinte: TcxGrid;
    cxGridContribuinteDBTableView1: TcxGridDBTableView;
    cxGridContribuinteDBTableView1Column1Codigo: TcxGridDBColumn;
    cxGridContribuinteDBTableView1DT_INI: TcxGridDBColumn;
    cxGridContribuinteDBTableView1DT_FIM: TcxGridDBColumn;
    cxGridContribuinteDBTableView1NOME: TcxGridDBColumn;
    cxGridContribuinteDBTableView1CNPJ: TcxGridDBColumn;
    cxGridContribuinteDBTableView1CPF: TcxGridDBColumn;
    cxGridContribuinteDBTableView1UF: TcxGridDBColumn;
    cxGridContribuinteDBTableView1IE: TcxGridDBColumn;
    cxGridContribuinteLevel1: TcxGridLevel;
    cxPgcImportacao: TcxPageControl;
    TbsNF: TcxTabSheet;
    TbsAnalise: TcxTabSheet;
    GpbTotalizador: TAdvGroupBox;
    lblComplementar: TLabel;
    lblRestituir: TLabel;
    EdtTotalARestituir: TDBText;
    EdtTotalARecolher: TDBText;
    GpbResultEntrada: TAdvGroupBox;
    cxGridTotalizadorSintetico: TcxGrid;
    cxGridTotalizadorSinteticoDBTableView1: TcxGridDBTableView;
    cxGridTotalizadorSinteticoDBTableView1COD_ITEM: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1DESCR_ITEM: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1DATA_ENTRADA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1QTDE_ENTRADA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1BC_ICMS_ST_ENT: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1VL_ICMS_ST_ENT: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1VL_ICMS_ST_UNI_ENT: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1DATA_SAIDA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1QTDE_SAIDA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1BC_ICMS_ST_SAI: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1TOTAL_ICMS_SAIDA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1TOTAL_ICMS_ENTRADA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1DIFERENCA: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1ESTOQUE_FINAL: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1SALDO_RESTITUIR: TcxGridDBColumn;
    cxGridTotalizadorSinteticoDBTableView1SALDO_ARECOLHER: TcxGridDBColumn;
    cxGridTotalizadorSinteticoLevel1: TcxGridLevel;
    cxGridNF: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGridDBTableView4NUM_ITEM: TcxGridDBColumn;
    cxGridDBTableView4COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView4Descr_item: TcxGridDBColumn;
    cxGridDBTableView4QTDE: TcxGridDBColumn;
    cxGridDBTableView4UNID: TcxGridDBColumn;
    cxGridDBTableView4VL_ITEM: TcxGridDBColumn;
    cxGridDBTableView4VL_DESC: TcxGridDBColumn;
    cxGridDBTableView4CST_ICMS: TcxGridDBColumn;
    cxGridDBTableView4CFOP: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTableView4ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTableView4VL_ICMS: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView4ALIQ_ST: TcxGridDBColumn;
    cxGridDBTableView4VL_ICMS_ST: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    GpbRegistroItensNF: TAdvGroupBox;
    cxGridItensNF: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBTableView5Descr_item: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn38: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure BtnNovaImportacacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIniciaImportacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    DMImportacaoXML : TDMImportacaoXML;
    procedure LimpaTela;
    procedure ControleModoInclusao;
  public
    { Public declarations }
  end;

var
  FrmImportacaoXML: TFrmImportacaoXML;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,uArquivo;

procedure TFrmImportacaoXML.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
  ControleModoInclusao;
end;

procedure TFrmImportacaoXML.BtnIniciaImportacaoClick(Sender: TObject);
var
  vListaXML : TStringList;
begin
  inherited;
  if not (EdtDiretorio.Text <> '') then
  begin
    FrmMensagem.Informacao('Informe o diret�rio dos arquivos xml(s) que ' +
                           'deseja importar e tente novamente!');
    SetaFoco(EdtDiretorio);
    exit;
  end;

  try
    try
      if not TXML.Listar(EdtDiretorio.Text) then
      begin
        FrmMensagem.Informacao('Arquivo xml(s) n�o encontrado no diret�rio informado.');
        exit;
      end;

      if not TXML.GetListaXML(vListaXML) then
      begin
        FrmMensagem.Informacao('Erro ao obter lista de xml encontrados!');
        exit;
      end;

      if not DMImportacaoXML.ImportarXML(EdtDiretorio.Text,vListaXML) then
      exit;

      cxPgcImportacao.ActivePageIndex := 0;
      BtnGravar.Enabled             := true;
      BtnCancelar.Enabled           := true;
      BtnLocalizaImportacao.Enabled := false;
      BtnNovaImportacacao.Enabled   := false;
      BtnIniciaImportacao.Enabled   := false;
    except
      on e: exception do
      begin
        ShowMessage('Erro : ' + e.Message + ' ao tentar importat xml');
        LimpaTela;
      end;
    end;
  finally
    FreeAndNil(vListaXML);
  end;
end;

procedure TFrmImportacaoXML.BtnNovaImportacacaoClick(Sender: TObject);
begin
  inherited;
  EdtDiretorio.Enabled        := true;
  EdtDiretorio.DoClick;
  BtnIniciaImportacao.Enabled := (EdtDiretorio.Text <> '');
  BtnNovaImportacacao.Enabled := not (BtnIniciaImportacao.Enabled);
  BtnCancelar.Enabled         := not (BtnNovaImportacacao.Enabled);
  if BtnIniciaImportacao.Enabled  then
  SetaFoco(BtnIniciaImportacao);
end;

procedure TFrmImportacaoXML.ControleModoInclusao;
begin
  BtnCancelar.Enabled           := False;
  BtnExcluir.Enabled            := BtnCancelar.Enabled;
  BtnGravar.Enabled             := BtnExcluir.Enabled;
  BtnIniciaImportacao.Enabled   := btnGravar.Enabled;
  BtnImprimirResultado.Enabled  := BtnGravar.Enabled;
  BtnLocalizaImportacao.Enabled := not (BtnImprimirResultado.Enabled);
  BtnNovaImportacacao.Enabled   := BtnLocalizaImportacao.Enabled;
end;

procedure TFrmImportacaoXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(DMImportacaoXML);
  FreeAndNil(FrmImportacaoXML);
end;

procedure TFrmImportacaoXML.FormCreate(Sender: TObject);
begin
  inherited;
  DMImportacaoXML := TDMImportacaoXML.Create(Self);
end;

procedure TFrmImportacaoXML.FormShow(Sender: TObject);
begin
  inherited;
  EdtDiretorio.InitialDir        := dmPrincipal.DirApp;
  ControleModoInclusao;
  LimpaTela;
  SetaFoco(BtnNovaImportacacao);
end;

procedure TFrmImportacaoXML.LimpaTela;
begin
  EdtDiretorio.Text              := '';
  GpbProcessaImportacao.Visible  := false;
  GpbContribuinte.Visible        := false;
  cxPgcImportacao.Visible        := false;
  EdtDiretorio.Enabled           := false;
end;

end.