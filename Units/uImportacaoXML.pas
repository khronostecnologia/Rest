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
  uDMImportacaoXML, cxTextEdit;

type
  TFrmImportacaoXML = class(TFrmMaster)
    GpbSelArquivos: TAdvGroupBox;
    Label1: TLabel;
    GpbProcessaImportacao: TAdvGroupBox;
    ProgressBar: TW7ProgressBar;
    lblInfoImportacaoXML: TLabel;
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
    cxGridLevel4: TcxGridLevel;
    GpbRegistroItensNF: TAdvGroupBox;
    cxGridItensNF: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView4IND_OPER: TcxGridDBColumn;
    cxGridDBTableView4COD_PART: TcxGridDBColumn;
    cxGridDBTableView4COD_MOD: TcxGridDBColumn;
    cxGridDBTableView4SER: TcxGridDBColumn;
    cxGridDBTableView4NUM_DOC: TcxGridDBColumn;
    cxGridDBTableView4CHV_NFE: TcxGridDBColumn;
    cxGridDBTableView4DT_DOC: TcxGridDBColumn;
    cxGridDBTableView4DT_E_ES: TcxGridDBColumn;
    cxGridDBTableView4VL_DOC: TcxGridDBColumn;
    cxGridDBTableView4VL_MERC: TcxGridDBColumn;
    cxGridDBTableView4VL_DESC: TcxGridDBColumn;
    cxGridDBTableView4VL_FRT: TcxGridDBColumn;
    cxGridDBTableView4VL_SEG: TcxGridDBColumn;
    cxGridDBTableView4VL_OUT_DA: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTableView4VL_ICMS: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView4VL_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_IPI: TcxGridDBColumn;
    cxGridDBTableView4VL_IPI: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_PIS: TcxGridDBColumn;
    cxGridDBTableView4VL_PIS: TcxGridDBColumn;
    cxGridDBTableView4VL_BC_COFINS: TcxGridDBColumn;
    cxGridDBTableView4VL_COFINS: TcxGridDBColumn;
    cxGridDBTableView4PARTICIPANTE: TcxGridDBColumn;
    cxGridDBTableView4ID: TcxGridDBColumn;
    cxGridDBTableView5IDNF: TcxGridDBColumn;
    cxGridDBTableView5NUM_ITEM: TcxGridDBColumn;
    cxGridDBTableView5COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView5QTDE: TcxGridDBColumn;
    cxGridDBTableView5UNID: TcxGridDBColumn;
    cxGridDBTableView5VL_ITEM: TcxGridDBColumn;
    cxGridDBTableView5VL_DESC: TcxGridDBColumn;
    cxGridDBTableView5CFOP: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTableView5ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMS: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView5ALIQ_ST: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView5DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView5COD_EAN: TcxGridDBColumn;
    cxGridDBTableView5VL_SEGURO: TcxGridDBColumn;
    cxGridDBTableView5VL_IPI: TcxGridDBColumn;
    cxGridDBTableView5VL_PIS: TcxGridDBColumn;
    cxGridDBTableView5VL_COFINS: TcxGridDBColumn;
    cxGridDBTableView5VL_OUTRAS_DESP: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_RET: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_DEST: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_DESON: TcxGridDBColumn;
    cxGridDBTableView5VL_FRETE: TcxGridDBColumn;
    cxGridDBTableView5VL_TOTAL_ITEM: TcxGridDBColumn;
    cxGridDBTableView5CST: TcxGridDBColumn;
    cxGridDBTableView5CSOSN: TcxGridDBColumn;
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

Uses uDMBase,uMensagem,uArquivo,uBarraProgresso;

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
    FrmMensagem.Informacao('Informe o diretório dos arquivos xml(s) que ' +
                           'deseja importar e tente novamente!');
    SetaFoco(EdtDiretorio);
    exit;
  end;

  try
    try

      GpbProcessaImportacao.Visible := true;
      Application.ProcessMessages;
      Sleep(500);

      if not TXML.Listar(EdtDiretorio.Text) then
      begin
        FrmMensagem.Informacao('Arquivo xml(s) não encontrado no diretório informado.');
        exit;
      end;

      if not TXML.GetListaXML(vListaXML) then
      begin
        FrmMensagem.Informacao('Erro ao obter lista de xml encontrados!');
        exit;
      end;

      if not DMImportacaoXML.ImportarXML(EdtDiretorio.Text,vListaXML) then
      exit;

      Application.ProcessMessages;
      Sleep(1200);

      cxPgcImportacao.ActivePageIndex := 0;
      BtnGravar.Enabled               := true;
      BtnCancelar.Enabled             := true;
      BtnLocalizaImportacao.Enabled   := false;
      BtnNovaImportacacao.Enabled     := false;
      BtnIniciaImportacao.Enabled     := false;

      GpbProcessaImportacao.Visible   := false;
      GpbContribuinte.Visible         := true;
      cxPgcImportacao.Visible         := GpbContribuinte.Visible;
    except
      on e: exception do
      begin
        ShowMessage('Erro : ' + e.Message + ' ao tentar importat xml');
        ControleModoInclusao;
        LimpaTela;
      end;
    end;
  finally
    vListaXML.Free;
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
