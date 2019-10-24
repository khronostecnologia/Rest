unit uApuracaoICMSST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  Vcl.Mask, JvExMask, JvToolEdit, AdvGlowButton, AdvGroupBox, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxTextEdit, Vcl.DBCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid,UDMImportacaoSPED,UDMImportacaoXML,
  uDMApuracaoICMSST, AdvOfficeButtons, frxClass, frxDBSet, Vcl.Menus,
  Controller.ApuracaoICMSST, ACBrBase, ACBrSintegra, W7Classes, W7ProgressBars;

type
  TFrmApuracao = class(TFrmMaster)
    BtnCancelar: TAdvGlowButton;
    BtnImprimirResultado: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    CxPgcGeral: TcxPageControl;
    TbsXML: TcxTabSheet;
    TbsSped: TcxTabSheet;
    cxGridNF: TcxGrid;
    cxGridDBTVNF: TcxGridDBTableView;
    cxGridDBTVNFNUM_DOC: TcxGridDBColumn;
    cxGridDBTVNFIND_OPER: TcxGridDBColumn;
    cxGridDBTVNFCOD_PART: TcxGridDBColumn;
    cxGridDBTVNFPARTICIPANTE: TcxGridDBColumn;
    cxGridDBTVNFCOD_MOD: TcxGridDBColumn;
    cxGridDBTVNFSER: TcxGridDBColumn;
    cxGridDBTVNFCHV_NFE: TcxGridDBColumn;
    cxGridDBTVNFDT_DOC: TcxGridDBColumn;
    cxGridDBTVNFDT_E_ES: TcxGridDBColumn;
    cxGridDBTVNFVL_DOC: TcxGridDBColumn;
    cxGridDBTVNFVL_MERC: TcxGridDBColumn;
    cxGridDBTVNFVL_DESC: TcxGridDBColumn;
    cxGridDBTVNFVL_FRT: TcxGridDBColumn;
    cxGridDBTVNFVL_SEG: TcxGridDBColumn;
    cxGridDBTVNFVL_OUT_DA: TcxGridDBColumn;
    cxGridDBTVNFVL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTVNFVL_ICMS: TcxGridDBColumn;
    cxGridDBTVNFVL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTVNFVL_ICMS_ST: TcxGridDBColumn;
    cxGridDBTVNFVL_BC_IPI: TcxGridDBColumn;
    cxGridDBTVNFVL_IPI: TcxGridDBColumn;
    cxGridDBTVNFVL_BC_PIS: TcxGridDBColumn;
    cxGridDBTVNFVL_PIS: TcxGridDBColumn;
    cxGridDBTVNFVL_BC_COFINS: TcxGridDBColumn;
    cxGridDBTVNFVL_COFINS: TcxGridDBColumn;
    cxGridDBTVNFID: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    GpbRegistroItensNF: TAdvGroupBox;
    cxGridItensNF: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5IDNF: TcxGridDBColumn;
    cxGridDBTableView5NUM_ITEM: TcxGridDBColumn;
    cxGridDBTableView5COD_EAN: TcxGridDBColumn;
    cxGridDBTableView5COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView5DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView5CST: TcxGridDBColumn;
    cxGridDBTableView5CSOSN: TcxGridDBColumn;
    cxGridDBTableView5CFOP: TcxGridDBColumn;
    cxGridDBTableView5UNID: TcxGridDBColumn;
    cxGridDBTableView5QTDE: TcxGridDBColumn;
    cxGridDBTableView5VL_ITEM: TcxGridDBColumn;
    cxGridDBTableView5VL_TOTAL_ITEM: TcxGridDBColumn;
    cxGridDBTableView5VL_DESC: TcxGridDBColumn;
    cxGridDBTableView5VL_FRETE: TcxGridDBColumn;
    cxGridDBTableView5VL_SEGURO: TcxGridDBColumn;
    cxGridDBTableView5VL_OUTRAS_DESP: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTableView5ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMS: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView5ALIQ_ST: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView5VL_IPI: TcxGridDBColumn;
    cxGridDBTableView5VL_PIS: TcxGridDBColumn;
    cxGridDBTableView5VL_COFINS: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ST_RET: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_RET: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_ST_DEST: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_DEST: TcxGridDBColumn;
    cxGridDBTableView5VL_ICMSST_DESON: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_FCP_ST: TcxGridDBColumn;
    cxGridDBTableView5VL_FCP_ST: TcxGridDBColumn;
    cxGridDBTableView5VL_BC_FCP_ST_RET: TcxGridDBColumn;
    cxGridDBTableView5VL_FCP_ST_RET: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxPgcImportacao: TcxPageControl;
    Tbs0200: TcxTabSheet;
    cxGrid0200: TcxGrid;
    cxGridDBTVW0200: TcxGridDBTableView;
    cxGridDBTVW0200COD_ITEM: TcxGridDBColumn;
    cxGridDBTVW0200DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTVW0200CODBARRA: TcxGridDBColumn;
    cxGridDBTVW0200UNID: TcxGridDBColumn;
    cxGridDBTVW0200TIPO_ITEM: TcxGridDBColumn;
    cxGridDBTVW0200ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTVW0200COD_NCM: TcxGridDBColumn;
    cxGridDBTVW0200CEST: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TbsC100E: TcxTabSheet;
    cxGridC100e: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2IND_OPER: TcxGridDBColumn;
    cxGridDBTableView2COD_SIT: TcxGridDBColumn;
    cxGridDBTableView2COD_PART: TcxGridDBColumn;
    cxGridDBTableView2PARTICIPANTE: TcxGridDBColumn;
    cxGridDBTableView2COD_MOD: TcxGridDBColumn;
    cxGridDBTableView2SER: TcxGridDBColumn;
    cxGridDBTableView2NUM_DOC: TcxGridDBColumn;
    cxGridDBTableView2CHV_NFE: TcxGridDBColumn;
    cxGridDBTableView2DT_DOC: TcxGridDBColumn;
    cxGridDBTableView2DT_E_ES: TcxGridDBColumn;
    cxGridDBTableView2VL_DOC: TcxGridDBColumn;
    cxGridDBTableView2VL_MERC: TcxGridDBColumn;
    cxGridDBTableView2VL_DESC: TcxGridDBColumn;
    cxGridDBTableView2VL_FRT: TcxGridDBColumn;
    cxGridDBTableView2VL_SEG: TcxGridDBColumn;
    cxGridDBTableView2VL_OUT_DA: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_ICMS: TcxGridDBColumn;
    cxGridDBTableView2VL_ICMS: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView2VL_ICMS_ST: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_IPI: TcxGridDBColumn;
    cxGridDBTableView2VL_IPI: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_COFINS: TcxGridDBColumn;
    cxGridDBTableView2VL_COFINS: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_PIS: TcxGridDBColumn;
    cxGridDBTableView2VL_PIS: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    GpbRegistroC170e: TAdvGroupBox;
    cxGridC170e: TcxGrid;
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
    cxGridLevel3: TcxGridLevel;
    TbsC100S: TcxTabSheet;
    cxGridC100s: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBTableView3SituacaoDocumento: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableView3Chv_acesso: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    GpbRegistroC170s: TAdvGroupBox;
    cxGridC170s: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
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
    cxGridLevel7: TcxGridLevel;
    TbsC400: TcxTabSheet;
    cxGridc400: TcxGrid;
    cxGridc400DBTableView1: TcxGridDBTableView;
    cxGridc400DBTableView1DATA: TcxGridDBColumn;
    cxGridc400DBTableView1ECF_FAB: TcxGridDBColumn;
    cxGridc400Level1: TcxGridLevel;
    cxTabSheet1: TcxTabSheet;
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
    CxPgcC400Itens: TcxPageControl;
    TbsC425: TcxTabSheet;
    CxGridC425: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBTableView7COD_TOT_PAR: TcxGridDBColumn;
    cxGridDBTableView7COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView7DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView7QTD: TcxGridDBColumn;
    cxGridDBTableView7VL_ITEM: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    TbsC470: TcxTabSheet;
    CxGridC470: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    cxGridDBColumn40: TcxGridDBColumn;
    cxGridDBColumn41: TcxGridDBColumn;
    cxGridDBColumn42: TcxGridDBColumn;
    cxGridDBColumn43: TcxGridDBColumn;
    cxGridLevel9: TcxGridLevel;
    frxReport: TfrxReport;
    frxDBConsulta: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    BtnExcluir: TAdvGlowButton;
    PpmArquivos: TPopupMenu;
    MnSintegra: TMenuItem;
    MnSefApur: TMenuItem;
    ACBrSintegra: TACBrSintegra;
    GpbProcessamento: TAdvGroupBox;
    ProgressBar: TW7ProgressBar;
    AdvGpbArquivos: TAdvGroupBox;
    lblEmpresa: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    BtnIniciaApuracao: TAdvGlowButton;
    EdtCodPart: TEdit;
    EdtParticipante: TEdit;
    BtnBuscaCliente: TAdvGlowButton;
    cmbMes: TComboBox;
    CmbAno: TComboBox;
    AdvGroupBox1: TAdvGroupBox;
    ChkXML: TAdvOfficeCheckBox;
    ChkSPED: TAdvOfficeCheckBox;
    Normal1: TMenuItem;
    Retificao1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnBuscaClienteClick(Sender: TObject);
    procedure EdtCodPartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnIniciaApuracaoClick(Sender: TObject);
    procedure cxGridDBTVNFCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTVNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChkXMLClick(Sender: TObject);
    procedure ChkSPEDClick(Sender: TObject);
    procedure cxGridc400DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridc400DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImprimirResultadoClick(Sender: TObject);
    procedure MnSefApurClick(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Retificao1Click(Sender: TObject);
  private
    { Private declarations }
    DMSped      : TDMImportacaoSPED;
    DMXML       : TDMImportacaoXML;
    DM          : TDmApuracaoICMSST;
    FController : TControllerApuracaoICMSST;
    procedure LimpaTela;
    procedure MostraAba;
  public
    { Public declarations }
  end;

var
  FrmApuracao: TFrmApuracao;

implementation

{$R *.dfm}

Uses uPesquisa,BiblKhronos,uDMBase,UMensagem;

procedure TFrmApuracao.BtnBuscaClienteClick(Sender: TObject);
begin
  inherited;
   Try
     FrmPesquisa := TFrmPesquisa.Create(nil);
     FrmPesquisa.MontaSql('SELECT * FROM "GET_EMPRESAS" ORDER BY "EMPRESA"');
     FrmPesquisa.ShowModal;
     if FrmPesquisa.Selecionou then
     begin
      EdtCodPart.Text       := FrmPesquisa.QryPesquisa.fieldbyName('CODIGO').AsString;
      EdtParticipante.Text  := FrmPesquisa.QryPesquisa.fieldbyName('EMPRESA').AsString;
      SetaFoco(EdtCodPart);
     end;
   finally
    FreeAndNil(FrmPesquisa);
   end;
end;

procedure TFrmApuracao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
  MostraAba;
end;

procedure TFrmApuracao.BtnImprimirResultadoClick(Sender: TObject);
begin
  inherited;
  if DM.QryAnalise.IsEmpty then
  begin
    FrmMensagem.Informacao('Não á registros para impressão.');
    exit;
  end;

  Imprimir(frxReport);
end;

procedure TFrmApuracao.BtnIniciaApuracaoClick(Sender: TObject);
Const
  Msg = 'Não encontrado informações para o filtro selecionado!';

  function EncontrouRegistros : Boolean;
  begin
    result := false;
    if (ChkXML.Checked) and (ChkSPED.Checked) then
    begin
      if (DMXML.QryNF.IsEmpty) and (DMSped.Qry0000.IsEmpty) then
      begin
        FrmMensagem.Informacao(Msg);
        Exit;
      end;
    end
    else if ChkXML.Checked then
    begin
      if DMXML.QryNF.IsEmpty then
      begin
        FrmMensagem.Informacao(Msg);
        Exit;
      end;
    end
    else if ChkSPED.Checked then
    begin
      if DMSped.Qry0000.IsEmpty then
      begin
        FrmMensagem.Informacao(Msg);
        Exit;
      end;
    end;
    result := true;
  end;
  function Validado : Boolean;
  begin
    result := false;
    if cmbMes.ItemIndex = -1 then
    begin
      FrmMensagem.Informacao('Informe o mês da apuração e tente novamente!');
      exit;
    end;

    if CmbAno.ItemIndex = -1 then
    begin
      FrmMensagem.Informacao('Informe o ano da apuração e tente novamente!');
      exit;
    end;

    if EdtCodPart.Text = '' then
    begin
      FrmMensagem.Informacao('Informe a empresa e tente novamente!');
      exit;
    end;

    if (not ChkXML.Checked) and (not ChkSPED.Checked) then
    begin
      FrmMensagem.Informacao('Informe a origem da informação e tente novamente!');
      exit;
    end;

    result := true;
  end;
begin
  inherited;
  if not Validado then
  exit;

  try
    if ChkXML.Checked then
    begin
      if DMXML.GetTodasNF(EdtCodPart.text,cmbMes.Text,CmbAno.Text) then
      begin
        TbsXML.Caption       := 'NF(' + DMXML.QryNF.RecordCount.ToString + ')';
        DMXML.FiltraItensNF;
      end;
    end;

    if ChkSPED.Checked then
    DMSped.GetSPED(DMSped.GetIDRegistro0000(EdtCodPart.text,cmbMes.Text,CmbAno.Text));

    if EncontrouRegistros then
    begin
      BtnCancelar.Enabled := DM.GetAnalise(EdtCodPart.Text,cmbMes.Text,CmbAno.Text,
                             ChkXML.Checked,ChkSPED.Checked);
    end;
    MostraAba;
  except
    On e: exception do
    FrmMensagem.Informacao('Erro : ' + e.Message + ' ao tentar apurar ICMSST.');
  end;

end;

procedure TFrmApuracao.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmApuracao.ChkSPEDClick(Sender: TObject);
begin
  inherited;
  MostraAba;
end;

procedure TFrmApuracao.ChkXMLClick(Sender: TObject);
begin
  inherited;
  MostraAba;
end;

procedure TFrmApuracao.cxGridc400DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (DMSped.QryC400.Active) and
     (DMSped.QryC400.State = (dsBrowse)) then
  begin
    DMSped.QryC425.Filtered := false;
    DMSped.QryC425.Filter   := ' ID_REDZ = ' + DMSped.QryC400ID.AsString;
    DMSped.QryC425.Filtered := true;
  end;

  if (DMSped.QryC400.Active) and
     (DMSped.QryC400.State = (dsBrowse)) then
  begin
    DMSped.QryC470.Filtered := false;
    DMSped.QryC470.Filter   := ' ID_REDZ = ' + DMSped.QryC400ID.AsString;
    DMSped.QryC470.Filtered := true;
  end;
end;

procedure TFrmApuracao.cxGridc400DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMSped.QryC400.Active) and
       (DMSped.QryC400.State = (dsBrowse)) then
    begin
      DMSped.QryC400.DisableControls;

      if Key = VK_UP then
        DMSped.QryC400.Prior
      else
        DMSped.QryC400.Next;

      DMSped.QryC425.Filtered := false;
      DMSped.QryC425.Filter   := ' ID_REDZ = ' + DMSped.QryC400ID.AsString;
      DMSped.QryC425.Filtered := true;

      if key = VK_UP then
        DMSped.QryC400.Next
      else
        DMSped.QryC400.Prior;

      DMSped.QryC400.EnableControls;
    end;

    if (DMSped.QryC400.Active) and
       (DMSped.QryC400.State = (dsBrowse)) then
    begin
      DMSped.QryC400.DisableControls;

      if Key = VK_UP then
        DMSped.QryC400.Prior
      else
        DMSped.QryC400.Next;

      DMSped.QryC470.Filtered := false;
      DMSped.QryC470.Filter   := ' ID_REDZ = ' + DMSped.QryC400ID.AsString;
      DMSped.QryC470.Filtered := true;

      if key = VK_UP then
        DMSped.QryC400.Next
      else
        DMSped.QryC400.Prior;

      DMSped.QryC400.EnableControls;
    end;
  end;
end;

procedure TFrmApuracao.cxGridDBTableView2CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (DMSped.QryC170e.Active) and (DMSped.QryC100e.State = (dsBrowse))
  then
  begin
    DMSped.QryC170e.Filtered := false;
    DMSped.QryC170e.Filter   := ' IDNF = ' + DMSped.QryC100eID.AsString;
    DMSped.QryC170e.Filtered := true;
  end;
end;

procedure TFrmApuracao.cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMSped.QryC170e.Active) and (DMSped.QryC100e.State = (dsBrowse))
    then
    begin
      DMSped.QryC100e.DisableControls;

      if Key = VK_UP then
        DMSped.QryC100e.Prior
      else
        DMSped.QryC100e.Next;

      DMSped.QryC170e.Filtered := false;
      DMSped.QryC170e.Filter   := ' IDNF = ' + DMSped.QryC100eID.AsString;
      DMSped.QryC170e.Filtered := true;

      if key = VK_UP then
        DMSped.QryC100e.Next
      else
        DMSped.QryC100e.Prior;

      DMSped.QryC100e.EnableControls;
    end;
  end;
end;

procedure TFrmApuracao.cxGridDBTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (DMSped.QryC170s.Active) and (DMSped.QryC100s.State = (dsBrowse))
  then
  begin
    DMSped.QryC170s.Filtered := false;
    DMSped.QryC170s.Filter   := ' IDNF = ' + DMSped.QryC100s.FieldByName('ID').AsString;
    DMSped.QryC170s.Filtered := true;
  end;
end;

procedure TFrmApuracao.cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMSped.QryC170s.Active) and
       (DMSped.QryC100s.State = (dsBrowse)) then
    begin
      DMSped.QryC100s.DisableControls;

      if Key = VK_UP then
        DMSped.QryC100s.Prior
      else
        DMSped.QryC100s.Next;

      DMSped.QryC170s.Filtered := false;
      DMSped.QryC170s.Filter   := ' IDNF = ' + DMSped.QryC100s.FieldByName('ID').AsString;
      DMSped.QryC170s.Filtered := true;

      if key = VK_UP then
        DMSped.QryC100s.Next
      else
        DMSped.QryC100s.Prior;

      DMSped.QryC100s.EnableControls;
    end;
  end;
end;

procedure TFrmApuracao.cxGridDBTVNFCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  DMXML.FiltraItensNF;
end;

procedure TFrmApuracao.cxGridDBTVNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    with DMXML do
    begin
      if(QryItensNF.Active) and (QryItensNF.State = (dsBrowse)) then
      begin
        QryNF.DisableControls;

        if Key = VK_UP then
          QryNF.Prior
        else
          QryNF.Next;

        QryItensNF.Filtered  := false;
        QryItensNF.Filter   := ' IDNF = ' + QryNF.FieldByName('ID').AsString;
        QryItensNF.Filtered := true;

        if key = VK_UP then
          QryNF.Next
        else
          QryNF.Prior;

        QryNF.EnableControls;
      end;
    end;
  end;
end;

procedure TFrmApuracao.EdtCodPartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    BtnBuscaCliente.Click;
  end;

  if key = VK_Return then
  begin
    if (EdtCodPart.text = '') then
    exit;

    Try
      if not dmPrincipal.GetEmpresa(EdtCodPart.Text) then
      exit;
    except
      on e: exception do
      begin
        FrmMensagem.Informacao('Erro: ' + e.message + ' ao consultar empresa.');
        Abort;
      end;
    end;
    EdtCodPart.Text      := dmPrincipal.QryEmpresa.FieldByName('CODIGO').AsString;
    EdtParticipante.Text := dmPrincipal.QryEmpresa.FieldByName('EMPRESA').AsString;
  end;
end;

procedure TFrmApuracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FrmApuracao);
end;

procedure TFrmApuracao.FormCreate(Sender: TObject);
begin
  inherited;
  CxPgcGeral.ActivePageIndex       := 0;
  cxPgcImportacao.ActivePageIndex  := 0;
  DM                               := TDmApuracaoICMSST.Create(Self);
  DMSped                           := TDMImportacaoSPED.Create(Self);
  DMXML                            := TDMImportacaoXML.Create(Self);
  FController                      := TControllerApuracaoICMSST.create(Self,DM);
end;

procedure TFrmApuracao.FormShow(Sender: TObject);
begin
  inherited;
  MostraAba;
  SetaFoco(EdtCodPart);
end;

procedure TFrmApuracao.LimpaTela;
begin
  EdtCodPart.Text      := '';
  EdtParticipante.Text := '';
  cmbMes.ItemIndex     := -1;
  CmbAno.ItemIndex     := -1;
  ChkXML.Checked       := false;
  ChkSPED.Checked      := true;

  with DMSped do
  begin
    Qry0000.Close;
    Qry0200.Close;
    QryC400.Close;
    QryC425.Close;
  end;

  with DMXML do
  begin
    QryNF.Close;
    QryItensNF.Close;
  end;

  With DM do
  begin
    QryAnalise.Close;
  end;

  SetaFoco(EdtCodPart);
end;

procedure TFrmApuracao.MnSefApurClick(Sender: TObject);
begin
  inherited;
  if not FController.ValidadoDadosBasicos then
  begin
    FrmMensagem.Informacao(FController.Mensagem);
    exit;
  end;

  if not FController.GerarArquivoSEF then
  begin
    FrmMensagem.Informacao(FController.Mensagem);
    exit;
  end;

  FrmMensagem.Informacao(FController.Mensagem);
end;

procedure TFrmApuracao.MostraAba;
begin
  TbsXML.TabVisible  :=  ChkXML.Checked;
  TbsSped.TabVisible :=  ChkSPED.Checked;
end;

procedure TFrmApuracao.Normal1Click(Sender: TObject);
begin
  inherited;
  FController.ProcessarSintegra(fsNormal);
end;

procedure TFrmApuracao.Retificao1Click(Sender: TObject);
begin
  inherited;
  FController.ProcessarSintegra(fsRetificacao);
end;

end.
