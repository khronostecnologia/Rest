unit uImportacaoSPED;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMaster, Vcl.StdCtrls, AdvSmoothPanel,
  Vcl.Mask, JvExMask, JvToolEdit, AdvGroupBox, AdvGlowButton, AdvEdit, AdvEdBtn,
  AdvFileNameEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, AdvOfficeButtons,
  cxPC, W7Classes, W7ProgressBars, AdvProgressBar, Vcl.ComCtrls, AdvProgr,
  AdvCircularProgress, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ACBrEFDImportar, ACBrBase, ACBrSpedFiscal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxTextEdit, cxGridCustomPopupMenu, cxGridPopupMenu, Vcl.Menus, AdvMenus,
  Vcl.DBCtrls,BiblKhronos,uDMImportacaoSPED;

type

  TFrmImportacaoSPED = class(TFrmMaster)
    AdvGroupBox1: TAdvGroupBox;
    Label1: TLabel;
    BtnIniciaImportacao: TAdvGlowButton;
    BtnGravar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    BtnSair: TAdvGlowButton;
    EdtArquivo: TJvFilenameEdit;
    cxPgcImportacao: TcxPageControl;
    Tbs0200: TcxTabSheet;
    TbsC100E: TcxTabSheet;
    TbsC100S: TcxTabSheet;
    GpbRegistro0000: TAdvGroupBox;
    cxGrid0200: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridC100e: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    TbsC400: TcxTabSheet;
    GpbProcessaImportacao: TAdvGroupBox;
    ProgressBar: TW7ProgressBar;
    lblInfoImportacao: TLabel;
    cxGrid0000: TcxGrid;
    cxGrid0000DBTableView1: TcxGridDBTableView;
    cxGrid0000Level1: TcxGridLevel;
    ACBrSPEDFiscal: TACBrSPEDFiscal;
    ACBrSpedFiscalImportar: TACBrSpedFiscalImportar;
    cxGrid0000DBTableView1COD_FIN: TcxGridDBColumn;
    cxGrid0000DBTableView1DT_INI: TcxGridDBColumn;
    cxGrid0000DBTableView1DT_FIM: TcxGridDBColumn;
    cxGrid0000DBTableView1NOME: TcxGridDBColumn;
    cxGrid0000DBTableView1CNPJ: TcxGridDBColumn;
    cxGrid0000DBTableView1CPF: TcxGridDBColumn;
    cxGrid0000DBTableView1UF: TcxGridDBColumn;
    cxGrid0000DBTableView1IE: TcxGridDBColumn;
    cxGrid0000DBTableView1IND_PERFIL: TcxGridDBColumn;
    cxGrid0000DBTableView1IND_ATIV: TcxGridDBColumn;
    cxGridDBTableView1COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView1DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView1CODBARRA: TcxGridDBColumn;
    cxGridDBTableView1UNID: TcxGridDBColumn;
    cxGridDBTableView1TIPO_ITEM: TcxGridDBColumn;
    cxGridDBTableView1COD_NCM: TcxGridDBColumn;
    cxGridDBTableView1ALIQ_ICMS: TcxGridDBColumn;
    cxGridDBTableView1CEST: TcxGridDBColumn;
    cxGridDBTableView2IND_OPER: TcxGridDBColumn;
    cxGridDBTableView2COD_PART: TcxGridDBColumn;
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
    cxGridDBTableView2VL_BC_PIS: TcxGridDBColumn;
    cxGridDBTableView2VL_PIS: TcxGridDBColumn;
    cxGridDBTableView2VL_BC_COFINS: TcxGridDBColumn;
    cxGridDBTableView2VL_COFINS: TcxGridDBColumn;
    cxGridDBTableView2PARTICIPANTE: TcxGridDBColumn;
    cxGridC100s: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
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
    cxGridLevel3: TcxGridLevel;
    BtnLocalizaImportacao: TAdvGlowButton;
    BtnNovaImportacacao: TAdvGlowButton;
    cxGridDBTableView2COD_SIT: TcxGridDBColumn;
    cxGridDBTableView3SituacaoDocumento: TcxGridDBColumn;
    GpbRegistroC170s: TAdvGroupBox;
    cxGridC170s: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridDBColumn37: TcxGridDBColumn;
    cxGridDBColumn39: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    GpbRegistroC170e: TAdvGroupBox;
    cxGridC170e: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBTableView4NUM_ITEM: TcxGridDBColumn;
    cxGridDBTableView4COD_ITEM: TcxGridDBColumn;
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
    Label2: TLabel;
    cxGridDBTableView5Descr_item: TcxGridDBColumn;
    cxGridDBTableView4Descr_item: TcxGridDBColumn;
    cxGridc400DBTableView1: TcxGridDBTableView;
    cxGridc400Level1: TcxGridLevel;
    cxGridc400: TcxGrid;
    cxGridc400DBTableView1DATA: TcxGridDBColumn;
    cxGridc400DBTableView1ECF_FAB: TcxGridDBColumn;
    AdvPopupMenu1: TAdvPopupMenu;
    Analtico1: TMenuItem;
    Sinttico1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    BtnExcluir: TAdvGlowButton;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGrid0000DBTableView1Column1Codigo: TcxGridDBColumn;
    AdvMenuStyler1: TAdvMenuStyler;
    CxPgcC400Itens: TcxPageControl;
    TbsC425: TcxTabSheet;
    TbsC470: TcxTabSheet;
    CxGridC425: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBTableView7COD_TOT_PAR: TcxGridDBColumn;
    cxGridDBTableView7COD_ITEM: TcxGridDBColumn;
    cxGridDBTableView7DESCR_ITEM: TcxGridDBColumn;
    cxGridDBTableView7QTD: TcxGridDBColumn;
    cxGridDBTableView7VL_ITEM: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    CxGridC470: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn40: TcxGridDBColumn;
    cxGridDBColumn41: TcxGridDBColumn;
    cxGridDBColumn42: TcxGridDBColumn;
    cxGridDBColumn43: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    procedure BtnIniciaImportacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtArquivoAfterDialog(Sender: TObject; var AName: string;
      var AAction: Boolean);
    procedure BtnNovaImportacacaoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnLocalizaImportacaoClick(Sender: TObject);
    procedure cxGridDBTableView2CanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridc400DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridc400DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FCNPJ             : String;
    procedure ImportarSPED;
    procedure ImportaReg0000;
    procedure ImportaReg0200;
    procedure ImportaRegC100;
    procedure ImportaRegC400;
    procedure LimpaTela;
    procedure MostraAbaC400Itens;
    function  ExcluirArqSPED :Boolean;
    function  ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmImportacaoSPED: TFrmImportacaoSPED;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,ACBrEFDBlocos,uPesquisa,uMenu;

procedure TFrmImportacaoSPED.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmImportacaoSPED.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not FrmMensagem.Confirmacao('Deseja realmente excluir a apuração?') then
  exit;

  if not ExcluirArqSPED then
  exit;

  FrmMensagem.Informacao('Registro excluído com sucesso!');
  LimpaTela;
end;

procedure TFrmImportacaoSPED.BtnGravarClick(Sender: TObject);
begin
  inherited;
  DMImportacaoSPED.Qry0000.ApplyUpdates(0);
  DMImportacaoSPED.Qry0200.ApplyUpdates(0);
  DMImportacaoSPED.QryC100.ApplyUpdates(0);
  DMImportacaoSPED.QryC170.ApplyUpdates(0);
  DMImportacaoSPED.QryC400.ApplyUpdates(0);
  DMImportacaoSPED.QryC425.ApplyUpdates(0);
  DMImportacaoSPED.QryC470.ApplyUpdates(0);
  FrmMensagem.Informacao('Importação salva com sucesso!');
  BtnNovaImportacacao.Enabled   := true;
  BtnLocalizaImportacao.Enabled := true;
  BtnCancelar.Enabled           := false;
  BtnGravar.Enabled             := false;
end;

procedure TFrmImportacaoSPED.BtnIniciaImportacaoClick(Sender: TObject);
begin
  inherited;
  if not (EdtArquivo.Text <> '') then
  begin
    FrmMensagem.Informacao('Informe o arquivo que deseja importar ' +
                           ' e tente novamente!');
    SetaFoco(EdtArquivo);
    exit;
  end;

  try
    ImportarSPED;
    MostraAbaC400Itens;
    cxPgcImportacao.ActivePageIndex := 0;
    BtnGravar.Enabled             := true;
    BtnCancelar.Enabled           := true;
    BtnLocalizaImportacao.Enabled := false;
    BtnNovaImportacacao.Enabled   := false;
    BtnIniciaImportacao.Enabled   := false;
  except
    LimpaTela;
  end;

end;

procedure TFrmImportacaoSPED.BtnLocalizaImportacaoClick(Sender: TObject);
var
  vCodPart : String;
  vMes     : String;
  vAno     : String;
begin
  inherited;
  LimpaTela;
  Try
    FrmPesquisa := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "GET_EMP_SPED_IMPORTADOS" ORDER BY "EMPRESA","MES","ANO"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
     vCodPart := FrmPesquisa.QryPesquisa.FieldByName('CODIGO').AsString;
     vMes     := FrmPesquisa.QryPesquisa.FieldByName('MES').AsString;
     vAno     := FrmPesquisa.QryPesquisa.FieldByName('ANO').AsString;
     if DMImportacaoSPED.GetSPED(DMImportacaoSPED.GetIDRegistro0000(vCodPart,vMes,vAno)) then
     begin
       MostraAbaC400Itens;
       BtnIniciaImportacao.Enabled   := false;
       BtnGravar.Enabled             := false;
       BtnCancelar.Enabled           := true;
       BtnLocalizaImportacao.Enabled := false;
       BtnNovaImportacacao.Enabled   := false;
       BtnExcluir.Enabled            := true;
       GpbRegistro0000.Visible       := true;
       cxPgcImportacao.Visible       := true;
     end
     else
       FrmMensagem.Informacao('Arquivo não encontrado!');
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;
end;

procedure TFrmImportacaoSPED.BtnNovaImportacacaoClick(Sender: TObject);
  procedure PreparaDiretorio;
  var
   vDir : String;
  begin
   vDir := EdtArquivo.Text;
   vDir := vDir.Replace('"','').Trim;
   EdtArquivo.Text := vDir;
  end;
begin
  inherited;
  LimpaTela;
  EdtArquivo.Enabled := true;
  EdtArquivo.DoClick;
  PreparaDiretorio;
  if BtnIniciaImportacao.Enabled then
  SetaFoco(BtnIniciaImportacao);
end;

procedure TFrmImportacaoSPED.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmImportacaoSPED.cxGridc400DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (DMImportacaoSPED.QryC400.Active) and
     (DMImportacaoSPED.QryC400.State = (dsBrowse)) then
  begin
    DMImportacaoSPED.QryC425.Filtered := false;
    DMImportacaoSPED.QryC425.Filter   := ' ID_REDZ = ' +
                                          DMImportacaoSPED.QryC400ID.AsString;
    DMImportacaoSPED.QryC425.Filtered := true;
  end;

  if (DMImportacaoSPED.QryC400.Active) and
     (DMImportacaoSPED.QryC400.State = (dsBrowse)) then
  begin
    DMImportacaoSPED.QryC470.Filtered := false;
    DMImportacaoSPED.QryC470.Filter   := ' ID_REDZ = ' +
                                          DMImportacaoSPED.QryC400ID.AsString;
    DMImportacaoSPED.QryC470.Filtered := true;
  end;
end;

procedure TFrmImportacaoSPED.cxGridc400DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMImportacaoSPED.QryC400.Active) and
       (DMImportacaoSPED.QryC400.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC400.DisableControls;

      if Key = VK_UP then
        DMImportacaoSPED.QryC400.Prior
      else
        DMImportacaoSPED.QryC400.Next;

      DMImportacaoSPED.QryC425.Filtered := false;
      DMImportacaoSPED.QryC425.Filter   := ' ID_REDZ = ' +
                                          DMImportacaoSPED.QryC400ID.AsString;
      DMImportacaoSPED.QryC425.Filtered := true;

      if key = VK_UP then
        DMImportacaoSPED.QryC400.Next
      else
        DMImportacaoSPED.QryC400.Prior;

      DMImportacaoSPED.QryC400.EnableControls;
    end;

    if (DMImportacaoSPED.QryC400.Active) and
       (DMImportacaoSPED.QryC400.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC400.DisableControls;

      if Key = VK_UP then
        DMImportacaoSPED.QryC400.Prior
      else
        DMImportacaoSPED.QryC400.Next;

      DMImportacaoSPED.QryC470.Filtered := false;
      DMImportacaoSPED.QryC470.Filter   := ' ID_REDZ = ' +
                                          DMImportacaoSPED.QryC400ID.AsString;
      DMImportacaoSPED.QryC470.Filtered := true;

      if key = VK_UP then
        DMImportacaoSPED.QryC400.Next
      else
        DMImportacaoSPED.QryC400.Prior;

      DMImportacaoSPED.QryC400.EnableControls;
    end;
  end;
end;

procedure TFrmImportacaoSPED.cxGridDBTableView2CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;

    if (DMImportacaoSPED.QryC170s.Active) and
       (DMImportacaoSPED.QryC100s.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC170s.Filtered := false;
      DMImportacaoSPED.QryC170s.Filter   := ' IDNF = ' +
                                          DMImportacaoSPED.QryC100s.fieldByName('ID').AsString;
      DMImportacaoSPED.QryC170s.Filtered := true;
    end;

end;

procedure TFrmImportacaoSPED.cxGridDBTableView2CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
    if (DMImportacaoSPED.QryC170e.Active) and
       (DMImportacaoSPED.QryC100e.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC170e.Filtered := false;
      DMImportacaoSPED.QryC170e.Filter   := ' IDNF = ' +
                                          DMImportacaoSPED.QryC100eID.AsString;
      DMImportacaoSPED.QryC170e.Filtered := true;
    end;
end;

procedure TFrmImportacaoSPED.cxGridDBTableView2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMImportacaoSPED.QryC170e.Active) and
       (DMImportacaoSPED.QryC100e.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC100e.DisableControls;

      if Key = VK_UP then
        DMImportacaoSPED.QryC100e.Prior
      else
        DMImportacaoSPED.QryC100e.Next;

      DMImportacaoSPED.QryC170e.Filtered := false;
      DMImportacaoSPED.QryC170e.Filter   := ' IDNF = ' +
                                          DMImportacaoSPED.QryC100eID.AsString;
      DMImportacaoSPED.QryC170e.Filtered := true;

      if key = VK_UP then
        DMImportacaoSPED.QryC100e.Next
      else
        DMImportacaoSPED.QryC100e.Prior;

      DMImportacaoSPED.QryC100e.EnableControls;
    end;
  end;
end;

procedure TFrmImportacaoSPED.cxGridDBTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (DMImportacaoSPED.QryC170s.Active) and
     (DMImportacaoSPED.QryC100s.State = (dsBrowse)) then
  begin
    DMImportacaoSPED.QryC170s.Filtered := false;
    DMImportacaoSPED.QryC170s.Filter   := ' IDNF = ' +
                                          DMImportacaoSPED.QryC100s.FieldByName('ID').AsString;
    DMImportacaoSPED.QryC170s.Filtered := true;
  end;
end;

procedure TFrmImportacaoSPED.cxGridDBTableView3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMImportacaoSPED.QryC170s.Active) and
       (DMImportacaoSPED.QryC100s.State = (dsBrowse)) then
    begin
      DMImportacaoSPED.QryC100s.DisableControls;

      if Key = VK_UP then
        DMImportacaoSPED.QryC100s.Prior
      else
        DMImportacaoSPED.QryC100s.Next;

      DMImportacaoSPED.QryC170s.Filtered := false;
      DMImportacaoSPED.QryC170s.Filter   := ' IDNF = ' +
                                          DMImportacaoSPED.QryC100s.FieldByName('ID').AsString;
      DMImportacaoSPED.QryC170s.Filtered := true;

      if key = VK_UP then
        DMImportacaoSPED.QryC100s.Next
      else
        DMImportacaoSPED.QryC100s.Prior;

      DMImportacaoSPED.QryC100s.EnableControls;
    end;
  end;
end;

procedure TFrmImportacaoSPED.EdtArquivoAfterDialog(Sender: TObject;
  var AName: string; var AAction: Boolean);
begin
  inherited;
  BtnIniciaImportacao.Enabled := (AName <> '');
end;

function TFrmImportacaoSPED.ExcluirArqSPED : Boolean;
  function GetDeleteSQL0000 : String;
  begin
    result := 'DELETE FROM "REGISTRO0000" WHERE "ID" = ' +
              DMImportacaoSPED.Qry0000ID.AsString;
  end;

  function GetDeleteSQL0200 : String;
  begin
    result := 'DELETE FROM "REGISTRO0200" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString;
  end;

  function GetDeleteSQLC100C170 : String;
  begin
    result := 'DELETE FROM "REGISTROC170" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString + ';' +
              'DELETE FROM "REGISTROC100" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString;
  end;

  function GetDeleteSQLC400C425C470 : String;
  begin
    result := 'DELETE FROM "REGISTROC470" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString + ';' +
              'DELETE FROM "REGISTROC425" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString + ';' +
              'DELETE FROM "REGISTROC400" WHERE "ID_SPED" = ' +
              DMImportacaoSPED.Qry0000ID.AsString;
  end;

begin
  result := true;
  try
    dmPrincipal.DB.StartTransaction;
    dmPrincipal.DB.ExecSQL(GetDeleteSQL0200);
    dmPrincipal.DB.ExecSQL(GetDeleteSQLC100C170);
    dmPrincipal.DB.ExecSQL(GetDeleteSQLC400C425C470);
    dmPrincipal.DB.ExecSQL(GetDeleteSQL0000);
    dmPrincipal.DB.Commit;
  except
    on e: exception do
    begin
      dmPrincipal.DB.Rollback;
      result := false;
    end;
  end;
end;

function TFrmImportacaoSPED.ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
var
  Qry      : TFDQuery;
  vSQL     : String;
begin
  try
    vSQL   := ' SELECT "ID" FROM "REGISTRO0000" ' +
              ' WHERE "DT_INI" = ' + QuotedStr(ADT_INI) +
              ' AND "DT_FIM" = ' + QuotedStr(ADT_FIM) +
              ' AND "CNPJ" = ' + QuotedStr(ACNPJCPF) +
              ' OR "CPF" = ' + QuotedStr(ACNPJCPF);
    CopyQuery(vSQL);
    Qry    := ConsultaSQL(vSQL,dmPrincipal.DB);
    result := not (Qry.IsEmpty);
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TFrmImportacaoSPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(DMImportacaoSPED);
  FreeAndNil(FrmImportacaoSPED);
end;

procedure TFrmImportacaoSPED.FormCreate(Sender: TObject);
begin
  inherited;
  DMImportacaoSPED := TDMImportacaoSPED.Create(nil);
end;

procedure TFrmImportacaoSPED.FormShow(Sender: TObject);
begin
  inherited;
  EdtArquivo.InitialDir          := dmPrincipal.DirApp;
  BtnIniciaImportacao.Enabled    := False;
  BtnGravar.Enabled              := False;
  BtnExcluir.Enabled             := false;
  BtnCancelar.Enabled            := false;
  GpbProcessaImportacao.Visible  := false;
  GpbRegistro0000.Visible        := false;
  cxPgcImportacao.Visible        := false;
  EdtArquivo.Enabled             := false;
  SetaFoco(BtnNovaImportacacao);
end;

procedure TFrmImportacaoSPED.ImportaReg0000;
var
  vDT_INI     : TDateTime;
  vDT_FIM     : TDateTime;

  function GetCodFin : String;
  begin
    Case TACBrCodFin(ACBrSPEDFiscal.Bloco_0.Registro0000.COD_FIN) of
      raOriginal    : result := 'Original';
      raSubstituto  : result := 'Substituto';
    End;
  end;

  function GetCodPerfil : String;
  begin
    case TACBrIndPerfil(ACBrSPEDFiscal.Bloco_0.Registro0000.IND_PERFIL) of
      pfPerfilA : result := 'A';
      pfPerfilB : result := 'B';
      pfPerfilC : result := 'C';
      pfNenhum  : result := 'Nenhum';
    end;
  end;

  function GetCodAtiv : String;
  begin
    case TACBrIndAtiv(ACBrSPEDFiscal.Bloco_0.Registro0000.IND_ATIV) of
     atIndustrial : result := 'Industrial';
     atOutros     : result := 'Outros';
    end;
  end;


begin
  lblInfoImportacao.Caption     := 'Carregando registro 0000...';
  ProgressBar.Max               := 100;
  ProgressBar.Position          := 0;
  Application.ProcessMessages;

  vDT_INI     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI;
  vDT_FIM     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_FIN;
  FCNPJ       := iif(ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ <> '',
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ,
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CPF);
  ProgressBar.Position          := ProgressBar.Position + 20;

  lblInfoImportacao.Caption     := 'Verificando registro de arquivos importados...';
  if ExisteArqSPED(DateToStr(vDT_INI),DateToStr(vDT_FIM),FCNPJ) then
  begin
    FrmMensagem.Informacao('Arquivo importado anteriormente...tente novamente!');
    abort;
  end;

  ProgressBar.Position          := ProgressBar.Position + 30;
  Application.ProcessMessages;

  With DMImportacaoSPED.Qry0000 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM "REGISTRO0000" WHERE "ID" = -1';
    Open;
    Insert;
    FieldByName('ID').AsInteger         := GetID('"REGISTRO0000"',dmPrincipal.DB) + 1;
    FieldByName('COD_FIN').AsString     := GetCodFin;
    FieldByName('NOME').AsString        := ACBrSPEDFiscal.Bloco_0.Registro0000.NOME;
    FieldByName('DT_INI').AsDateTime    := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI;
    FieldByName('DT_FIM').AsDateTime    := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_FIN;
    FieldByName('CNPJ').AsString        := ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ;
    FieldByName('CPF').AsString         := ACBrSPEDFiscal.Bloco_0.Registro0000.CPF;
    FieldByName('UF').AsString          := ACBrSPEDFiscal.Bloco_0.Registro0000.UF;
    FieldByName('IE').AsString          := ACBrSPEDFiscal.Bloco_0.Registro0000.IE;
    FieldByName('COD_MUN').AsInteger    := ACBrSPEDFiscal.Bloco_0.Registro0000.COD_MUN;
    FieldByName('IND_PERFIL').AsString  := GetCodPerfil;
    FieldByName('IND_ATIV').AsString    := GetCodAtiv;
    FieldByName('MES').AsString         := FormatDateTime('MM',ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI);
    FieldByName('ANO').AsString         := FormatDateTime('YYYY',ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI);;
    Post;
  end;
  ProgressBar.Position          := ProgressBar.Position + 45;
  ProgressBar.Position          := 99;
  Application.ProcessMessages;
end;

procedure TFrmImportacaoSPED.ImportaReg0200;
var
  i             : Integer;
  j             : Integer;
  vID0200       : Integer;
  vGerouID0200  : Boolean;

  function GetTipoItem(ATipoItem :TACBrTipoItem) : String;
  begin
    case ATipoItem of
      tiMercadoriaRevenda    : result := 'MercadoriaRevenda';
      tiMateriaPrima         : result := 'MateriaPrima';
      tiEmbalagem            : result := 'Embalagem';
      tiProdutoProcesso      : result := 'ProdutoProcesso';
      tiProdutoAcabado       : result := 'ProdutoAcabado';
      tiSubproduto           : result := 'Subproduto';
      tiProdutoIntermediario : result := 'ProdutoIntermediario';
      tiMaterialConsumo      : result := 'MaterialConsumo';
      tiAtivoImobilizado     : result := 'AtivoImobilizado';
      tiServicos             : result := 'Servicos';
      tiOutrosInsumos        : result := 'OutrosInsumos';
      tiOutras               : result := 'Outras';
    end;
  end;
begin
  lblInfoImportacao.Caption     := 'Carregando registro 0200...';
  j                             := Pred(ACBrSPEDFiscal.Bloco_0.Registro0001.Registro0200.Count);
  ProgressBar.Max               := ACBrSPEDFiscal.Bloco_0.Registro0001.Registro0200.Count;
  ProgressBar.Position          := 0;
  vGerouID0200                  := false;
  Application.ProcessMessages;

  if ACBrSPEDFiscal.Bloco_0.Registro0001.Registro0200.Count > 0 then
  begin

    with DMImportacaoSPED do
    begin
      Qry0200.Close;
      Qry0200.SQL.Clear;
      Qry0200.SQL.Text  := 'SELECT * FROM "REGISTRO0200" WHERE "ID" = -1';
      Qry0200.Open;
      for I := 0 to j do
      begin
         Qry0200.Insert;

         if not vGerouID0200 then
         begin
           vID0200       := GetID('"REGISTRO0200"',dmPrincipal.DB);
           vGerouID0200  := true;
         end;

         vID0200                     := vID0200 + 1;
         Qry0200ID.AsInteger         := vID0200;
         Qry0200ID_SPED.AsInteger    := Qry0000ID.AsInteger;
         Qry0200COD_ITEM.AsString    := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_ITEM;
         Qry0200DESCR_ITEM.AsString  := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].DESCR_ITEM;
         Qry0200CODBARRA.AsString    := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_BARRA;
         Qry0200UNID.AsString        := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].UNID_INV;
         Qry0200TIPO_ITEM.AsString   := GetTipoItem(ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].TIPO_ITEM);
         Qry0200COD_NCM.AsString     := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].COD_NCM;
         Qry0200ALIQ_ICMS.AsVariant  := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].ALIQ_ICMS;
         Qry0200CEST.AsString        := ACBrSPEDFiscal.Bloco_0.Registro0001.
                                        Registro0200.Items[I].CEST;
         Qry0200.Post;
         ProgressBar.Position        :=  ProgressBar.Position + 1;
         Application.ProcessMessages;
      end;
    end;
  end;
end;

procedure TFrmImportacaoSPED.ImportaRegC100;
var
  i              : Integer;
  j              : Integer;
  K              : Integer;
  vIDC100        : Integer;
  vIDC170        : Integer;
  vGerouIDC100   : Boolean;
  vGerouIDC170   : Boolean;

  function GetCodSit : String;
  begin
    case ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_SIT of
      sdRegular             : result := '00 - Documento regular';
      sdExtempRegular       : result := '01 - Escrituração extemporânea de documento regular';
      sdCancelado           : result := '02 - Documento cancelado';
      sdCanceladoExtemp     : result := '03 - Escrituração extemporânea de documento cancelado';
      sdDoctoDenegado       : result := '04 - NF-e ou CT-e - denegado';
      sdDoctoNumInutilizada : result := '05 - NF-e ou CT-e - Numeração inutilizada';
      sdFiscalCompl         : result := '06 - Documento Fiscal Complementar';
      sdExtempCompl         : result := '07 - Escrituração extemporânea de documento complementar';
      sdRegimeEspecNEsp     : result := '08 - Documento Fiscal emitido com base em Regime Especial ou Norma Específica';
    end;
  end;

  function GetIndOperacao : String;
  begin
    if ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].IND_OPER
    = tpEntradaAquisicao then
      result := 'E'
    else
      result := 'S';
  end;

begin
  lblInfoImportacao.Caption     := 'Carregando registro C100 e C170...';
  j                             := Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Count);
  ProgressBar.Max               := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Count;
  ProgressBar.Position          := 0;
  Application.ProcessMessages;

  {Controla sequence temp}
  vGerouIDC100  := false;
  vGerouIDC170  := false;

  if ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Count > 0 then
  begin

    with DMImportacaoSPED do
    begin
      QryC100.Close;
      QryC100.SQL.Clear;
      QryC100.SQL.Text  := 'SELECT * FROM "REGISTROC100" WHERE "ID" = -1';
      QryC100.Open;

      QryC170.Close;
      QryC170.SQL.Clear;
      QryC170.SQL.Text  := 'SELECT * FROM "REGISTROC170" WHERE "ID" = -1';
      QryC170.Open;

      for I := 0 to j do
      begin

        if not (ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_SIT
        = sdRegular) then
        continue;

        if not vGerouIDC100 then
        begin
          vIDC100       := GetID('"REGISTROC100"',dmPrincipal.DB);
          vGerouIDC100  := true;
        end;

        QryC100.Insert;
        vIDC100                      := vIDC100 + 1;
        QryC100ID.AsInteger          := vIDC100;
        QryC100ID_SPED.AsInteger     := Qry0000ID.AsInteger;
        QryC100IND_OPER.AsString     := GetIndOperacao;
        QryC100COD_SIT.AsString      := GetCodSit;
        QryC100COD_PART.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_PART;
        QryC100PARTICIPANTE.AsString := 'PARTICIPANTE AVULSO';
        QryC100COD_MOD.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_MOD;
        QryC100SER.AsString          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].SER;
        QryC100NUM_DOC.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].NUM_DOC;
        QryC100CHV_NFE.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].CHV_NFE;
        QryC100DT_DOC.AsDateTime     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_DOC;
        QryC100DT_E_ES.AsDateTime    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_E_S;
        QryC100VL_DOC.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DOC;
        QryC100VL_MERC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_MERC;
        QryC100VL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DESC;
        QryC100VL_FRT.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_FRT;
        QryC100VL_SEG.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_SEG;
        QryC100VL_OUT_DA.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_OUT_DA;
        QryC100VL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS;
        QryC100VL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS;
        QryC100VL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS_ST;
        QryC100VL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS_ST;
        QryC100.Post;

        for K := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i]
        .RegistroC170.Count) do
        begin
          if not vGerouIDC170 then
          begin
            vIDC170       := GetID('"REGISTROC170"',dmPrincipal.DB);
            vGerouIDC170  := true;
          end;

          QryC170.Insert;
          vIDC170                      :=  vIDC170 + 1;
          QryC170ID.AsInteger          :=  vIDC170;
          QryC170ID_SPED.AsInteger     := Qry0000ID.AsInteger;
          QryC170IDNF.AsInteger        := QryC100ID.AsInteger;

          QryC170NUM_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].NUM_ITEM;

          QryC170COD_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].COD_ITEM;

          QryC170DESCR_ITEM.AsString   := DMImportacaoSPED.GetProduto(QryC170eCOD_ITEM.AsString);

          QryC170QTDE.AsFloat          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].QTD;

          QryC170UNID.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].UNID;

          QryC170VL_ITEM.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_ITEM;

          QryC170VL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_DESC;

          QryC170CST_ICMS.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].CST_ICMS;

          QryC170CFOP.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].CFOP;

          QryC170VL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_BC_ICMS;

          QryC170ALIQ_ICMS.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].ALIQ_ICMS;

          QryC170VL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_ICMS;

          QryC170VL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_BC_ICMS_ST;

          QryC170VL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].VL_ICMS_ST;

          QryC170ALIQ_ST.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                           RegistroC170.Items[k].ALIQ_ST;
          QryC170.Post;
        end;
        ProgressBar.Position  := ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;

      QryC100e.Close;
      QryC100e.Data      := QryC100.Data;
      QryC100e.Filter    := 'IND_OPER = ''E'' ';
      QryC100e.Filtered  := true;

      {Filtra para nao mostra todos os registros}
      {Mostrar somente quando clica no registro}
      QryC170e.Close;
      QryC170e.Data      := QryC170.Data;
      QryC170e.Filter    := 'ID = -99';
      QryC170e.Filtered  := true;

      QryC100s.Close;
      QryC100s.Data      := QryC100.Data;
      QryC100s.Filter    := 'IND_OPER = ''S'' ';
      QryC100s.Filtered  := true;

      {Filtra para nao mostra todos os registros}
      {Mostrar somente quando clica no registro}
      QryC170s.Close;
      QryC170s.Data      := QryC170.Data;
      QryC170s.Filter    := 'ID = -99';
      QryC170s.Filtered  := true;
    end;
  end;
end;

procedure TFrmImportacaoSPED.ImportaRegC400;
var
  i             : Integer;
  j             : Integer;
  K             : Integer;
  L             : Integer;
  M             : Integer;
  vIDC400       : Integer;
  vIDC425       : Integer;
  vIDC470       : Integer;
  vGerouIDC400  : Boolean;
  vGerouIDC425  : Boolean;
  vGerouIDC470  : Boolean;
  vTot          : String;
  vAbriuC400    : Boolean;
  vEncontrouF1  : Boolean;
begin
  lblInfoImportacao.Caption     := 'Carregando registro C400 e C425...';
  j                             := Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.Count);
  ProgressBar.Max               := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.Count;
  ProgressBar.Position          := 0;
  Application.ProcessMessages;
  vGerouIDC400                  := false;
  vGerouIDC425                  := false;

  if ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.Count > 0 then
  begin
    with DMImportacaoSPED do
    begin
      QryC400.Close;
      QryC400.SQL.Clear;
      QryC400.SQL.Text  := 'SELECT * FROM "REGISTROC400" WHERE "ID" = -1';
      QryC400.Open;

      QryC425.Close;
      QryC425.SQL.Clear;
      QryC425.SQL.Text  := 'SELECT * FROM "REGISTROC425" WHERE "ID" = -1';
      QryC425.Open;

      QryC470.Close;
      QryC470.SQL.Clear;
      QryC470.SQL.Text  := 'SELECT * FROM "REGISTROC470" WHERE "ID" = -1';
      QryC470.Open;

      for I := 0 to j do {C400 pega o numero de serie da ECF}
      begin
        for K := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Count) do
        begin
          if not vGerouIDC400 then
          begin
            vIDC400       := GetID('"REGISTROC400"',dmPrincipal.DB);
            vGerouIDC400  := true;
          end;

          QryC400.Insert;
          vIDC400                   := vIDC400 + 1;
          QryC400ID.AsInteger       := vIDC400;
          QryC400ID_SPED.AsInteger  := Qry0000ID.AsInteger;
          QryC400DATA.AsDateTime    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                       Items[i].RegistroC405.Items[k].DT_DOC;
          QryC400ECF_FAB.AsString   := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.Items[i].ECF_FAB;
          QryC400.Post;
          vAbriuC400   := true;
          vEncontrouF1 := false;

          for L := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                        Items[i].RegistroC405.Items[k].RegistroC420.Count) do
          begin
            vTot :=   ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                        Items[i].RegistroC405.Items[k].RegistroC420.Items[L].COD_TOT_PAR;

            if not vTot.Contains('F') then
            continue;

            vEncontrouF1 := true;


             if Qry0000.FieldByName('IND_PERFIL').AsString = 'B' then
             begin

              for M := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                            Items[i].RegistroC405.Items[k].RegistroC420.Items[L].
                            RegistroC425.Count) do
              begin
                if not vGerouIDC425 then
                begin
                  vIDC425       := GetID('"REGISTROC425"',dmPrincipal.DB);
                  vGerouIDC425  := true;
                end;

                QryC425.Insert;
                vIDC425                      := vIDC425 + 1;
                QryC425ID.AsInteger          := vIDC425;
                QryC425ID_SPED.AsInteger     := Qry0000ID.AsInteger;
                QryC425ID_REDZ.AsInteger     := QryC400ID.AsInteger;

                QryC425COD_TOT_PAR.AsString  := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC420.Items[L].COD_TOT_PAR;

                QryC425COD_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC420.Items[L].
                                                RegistroC425.Items[M].COD_ITEM;

                QryC425DESCR_ITEM.AsString   := DMImportacaoSPED.GetProduto(QryC425COD_ITEM.AsString);

                QryC425QTD.AsFloat           := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC420.Items[L].
                                                RegistroC425.Items[M].QTD;

                QryC425VL_ITEM.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC420.Items[L].
                                                RegistroC425.Items[M].VL_ITEM;
                QryC425.Post;
              end;
            end;


            if Qry0000.FieldByName('IND_PERFIL').AsString = 'A' then
            begin
              for M := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                            Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                            RegistroC470.Count) do
              begin
                if not vGerouIDC470 then
                begin
                  vIDC470       := GetID('"REGISTROC470"',dmPrincipal.DB);
                  vGerouIDC470  := true;
                end;

                QryC470.Insert;
                vIDC470                      := vIDC470 + 1;
                QryC470ID.AsInteger          := vIDC470;
                QryC470ID_SPED.AsInteger     := Qry0000ID.AsInteger;
                QryC470ID_REDZ.AsInteger     := QryC400ID.AsInteger;

                QryC470COD_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].COD_ITEM;

                QryC470DESCR_ITEM.AsString   := DMImportacaoSPED.GetProduto(QryC470COD_ITEM.AsString);

                QryC470QTD.AsFloat           := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].QTD;

                QryC470QTD_CANC.AsFloat      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].QTD_CANC;

                QryC470UNID.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].UNID;

                QryC470VL_ITEM.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].VL_ITEM;

                QryC470CST_ICMS.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].CST_ICMS;

                QryC470CFOP.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].CFOP;

                QryC470ALIQ_ICMS.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].ALIQ_ICMS;

                QryC470VL_PIS.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].VL_PIS;


                QryC470VL_COFINS.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC400.
                                                Items[i].RegistroC405.Items[k].RegistroC460.Items[L].
                                                RegistroC470.Items[M].VL_COFINS;

                QryC470.Post;
              end;
            end;
          end;
          if (vAbriuC400) and (not vEncontrouF1) then //somente mantem reducao de F1
          QryC400.Delete;
        end;
        ProgressBar.Position := ProgressBar.Position + 1;
      end;
    end;
  end;
end;

procedure TFrmImportacaoSPED.ImportarSPED;
begin
 try
   try
     ACBrSPEDFiscal.CancelaGeracao;
     ACBrSpedFiscalImportar.Arquivo := EdtArquivo.Text;
     ACBrSpedFiscalImportar.Importar;
     GpbProcessaImportacao.Visible := true;
     Application.ProcessMessages;

     ImportaReg0000;
     ImportaReg0200;
     ImportaRegC100;
     ImportaRegC400;

     lblInfoImportacao.Caption := 'Registros carregados com sucesso...';
     Application.ProcessMessages;
     FrmMensagem.Informacao('Importação realizada com sucesso!');
     GpbRegistro0000.Visible       := true;
     cxPgcImportacao.Visible       := true;
    except
      on e: exception do
      begin
        FrmMensagem.Informacao(e.Message + ' ao importar arquivo SPED.');
        abort;
      end;
   end;
 finally
   GpbProcessaImportacao.Visible := false;
 end;

end;

procedure TFrmImportacaoSPED.LimpaTela;
begin
  EdtArquivo.Enabled            := false;
  BtnIniciaImportacao.Enabled   := false;
  BtnGravar.Enabled             := false;
  BtnCancelar.Enabled           := false;
  BtnExcluir.Enabled            := false;
  BtnNovaImportacacao.Enabled   := true;
  BtnLocalizaImportacao.Enabled := true;
  EdtArquivo.Clear;
  cxPgcImportacao.Visible       := false;
  GpbRegistro0000.Visible       := false;

  with DMImportacaoSPED do
  begin
    if Qry0000.Active then
    begin
      Qry0000.CancelUpdates;
      Qry0000.Close;
    end;

    if Qry0200.Active then
    begin
      Qry0200.CancelUpdates;
      Qry0200.Close;
    end;

    if QryC100.Active then
    begin
      QryC100.CancelUpdates;
      QryC100.Close;
    end;

    if QryC170.Active then
    begin
      QryC170.CancelUpdates;
      QryC170.Close;
    end;

    if QryC400.Active then
    begin
      QryC400.CancelUpdates;
      QryC400.Close;
    end;

    if QryC425.Active then
    begin
      QryC425.CancelUpdates;
      QryC425.Close;
    end;
  end;
end;

procedure TFrmImportacaoSPED.MostraAbaC400Itens;
begin
  (*TbsC425.TabVisible := (DMImportacaoSPED.QryC425.RecordCount > 0);
  TbsC470.TabVisible := (DMImportacaoSPED.QryC470.RecordCount > 0);
  Application.ProcessMessages;*)
end;
end.
