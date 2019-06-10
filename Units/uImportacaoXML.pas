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
  uDMImportacaoXML, cxTextEdit, cxCalendar,uGenerico, AdvStickyPopupMenu,
  Vcl.Menus,uLog;

type
  TModoExclusao = (mLote,mXML);

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
    BtnNovaImportacao: TAdvGlowButton;
    BtnImprimirResultado: TAdvGlowButton;
    BtnExcluir: TAdvGlowButton;
    EdtDiretorio: TJvDirectoryEdit;
    BtnIniciaImportacao: TAdvGlowButton;
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
    cxGridDBTVNF: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    GpbRegistroItensNF: TAdvGroupBox;
    cxGridItensNF: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTVNFIND_OPER: TcxGridDBColumn;
    cxGridDBTVNFCOD_PART: TcxGridDBColumn;
    cxGridDBTVNFCOD_MOD: TcxGridDBColumn;
    cxGridDBTVNFSER: TcxGridDBColumn;
    cxGridDBTVNFNUM_DOC: TcxGridDBColumn;
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
    cxGridDBTVNFPARTICIPANTE: TcxGridDBColumn;
    cxGridDBTVNFID: TcxGridDBColumn;
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
    MnuExcluir: TPopupMenu;
    MnuExcluirLote: TMenuItem;
    MnuExcluirXML: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnNovaImportacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIniciaImportacaoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure cxGridDBTVNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTVNFCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnLocalizaImportacaoClick(Sender: TObject);
    procedure MnuExcluirLoteClick(Sender: TObject);
    procedure MnuExcluirXMLClick(Sender: TObject);
  private
    { Private declarations }
    FCodPartLote    : String;
    FMesLote        : String;
    DMImportacaoXML : TDMImportacaoXML;
    FImportacao     : Boolean;
    FForm           : TFormGeneric;
    procedure LimpaTela;
    procedure FiltraItensNF;
    procedure SetCaptionAbaNF;
    function Excluir(pExclusao : TModoExclusao) : Boolean;
  public
    { Public declarations }
    constructor create(pOwner : TComponent ; pFinalidadeTela : TFinalidadeTela);
  end;

  TFormImportacao = class(TFormGeneric)
    procedure ConfigControles;Override;
    procedure HabilitaControlesModoInclusao;Override;
    procedure Pesquisa;Override;
  end;

  TFormApuracao = class(TFormGeneric)
    procedure ConfigControles;Override;
    procedure HabilitaControlesModoInclusao;Override;
    procedure Pesquisa;Override;
  end;

var
  FrmImportacaoXML: TFrmImportacaoXML;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,uArquivo,uBarraProgresso,uPesquisa;

{ TFormImportacao }

procedure TFormImportacao.ConfigControles;
begin
  inherited;
  with FrmImportacaoXML do
  begin
    TbsAnalise.TabVisible        := false;
    BtnImprimirResultado.Visible := TbsAnalise.TabVisible;
    BtnSair.Left                 := BtnImprimirResultado.Left;
  end;
end;

procedure TFormImportacao.HabilitaControlesModoInclusao;
begin
  inherited;
  with FrmImportacaoXML do
  begin
    BtnCancelar.Enabled           := False;
    BtnExcluir.Enabled            := BtnCancelar.Enabled;
    BtnGravar.Enabled             := BtnExcluir.Enabled;
    BtnIniciaImportacao.Enabled   := btnGravar.Enabled;
    BtnLocalizaImportacao.Enabled := true;
    BtnNovaImportacao.Enabled     := BtnLocalizaImportacao.Enabled;
    EdtDiretorio.InitialDir       := dmPrincipal.DirApp;
    SetaFoco(BtnNovaImportacao);
  end;
end;

procedure TFormImportacao.Pesquisa;
begin
  inherited;
end;

{ TFormApuracao }

procedure TFormApuracao.HabilitaControlesModoInclusao;
begin
  with FrmImportacaoXML do
  begin
    BtnCancelar.Enabled           := False;
    BtnExcluir.Enabled            := BtnCancelar.Enabled;
    BtnImprimirResultado.Enabled  := BtnExcluir.Enabled;
    BtnLocalizaImportacao.Enabled := not (BtnImprimirResultado.Enabled);
    SetaFoco(BtnLocalizaImportacao);
  end;
end;

procedure TFormApuracao.Pesquisa;
begin
  inherited;
  Try
    FrmPesquisa := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "NF" ORDER BY "NOME"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;
end;

procedure TFormApuracao.ConfigControles;
begin
  with FrmImportacaoXML do
  begin
    lblTitulo.Caption           := 'Apuração XML';
    GpbSelArquivos.Visible      := false;
    BtnGravar.Visible           := GpbSelArquivos.Visible;
    BtnNovaImportacao.Visible   := BtnGravar.Visible;

    BtnSair.Left                := BtnCancelar.Left;
    BtnImprimirResultado.Left   := BtnExcluir.Left;
    BtnCancelar.Left            := BtnNovaImportacao.Left;
    BtnExcluir.Left             := BtnGravar.Left;
  end;
end;

procedure TFrmImportacaoXML.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  DMImportacaoXML.Cancelar;
  FForm.HabilitaControlesModoInclusao;
  LimpaTela;
end;

procedure TFrmImportacaoXML.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if not DMImportacaoXML.GravarImportacao then
  exit;

  FrmMensagem.Informacao('Importação salva com sucesso!');
  BtnNovaImportacao.Enabled      := true;
  BtnLocalizaImportacao.Enabled  := true;
  BtnGravar.Enabled              := false;
end;

procedure TFrmImportacaoXML.BtnIniciaImportacaoClick(Sender: TObject);
var
  vListaXML   : TStringList;
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
      DMImportacaoXML.NomeArqLog := dmPrincipal.GetNomeArqLog;
      lblInfoImportacaoXML.Caption := 'Iniciando processo de importação...';
      ProgressBar.Position := 0;
      GpbProcessaImportacao.Visible := true;
      Application.ProcessMessages;
      Sleep(500);

      TLog.Gravar(dmPrincipal.DirImportacaoXML,DMImportacaoXML.NomeArqLog,lblInfoImportacaoXML.Caption);

      if not TXML.Listar(EdtDiretorio.Text) then
      begin
        FrmMensagem.Informacao('Arquivo xml(s) não encontrado no diretório informado.');
        TLog.Gravar(dmPrincipal.DirImportacaoXML,DMImportacaoXML.NomeArqLog,'Arquivo xml(s) não encontrado no diretório informado.');
        exit;
      end;

      if not TXML.GetListaXML(vListaXML) then
      begin
        FrmMensagem.Informacao('Erro ao obter lista de xml encontrados!');
        TLog.Gravar(dmPrincipal.DirRaizApp,DMImportacaoXML.NomeArqLog,'Arquivo xml(s) não encontrado no diretório informado.');
        exit;
      end;

      if not DMImportacaoXML.ImportarXML(EdtDiretorio.Text,vListaXML) then
      begin
        if not DMImportacaoXML.ExisteXMLImportar then
        FrmMensagem.Informacao('Não identificado novo XML á importar!');

        FForm.HabilitaControlesModoInclusao;
        LimpaTela;
        Exit;
      end;

      TLog.Gravar(dmPrincipal.DirImportacaoXML,DMImportacaoXML.NomeArqLog,'Importação realizada com sucesso.');
      Application.ProcessMessages;
      Sleep(1200);
      cxPgcImportacao.Visible         := true;
      cxPgcImportacao.ActivePageIndex := 0;
      BtnGravar.Enabled               := true;
      BtnCancelar.Enabled             := true;
      BtnLocalizaImportacao.Enabled   := false;
      BtnNovaImportacao.Enabled       := false;
      BtnIniciaImportacao.Enabled     := false;
      GpbProcessaImportacao.Visible   := false;
      SetCaptionAbaNF;
      SetaFoco(cxGridNF);
      FiltraItensNF;
    except
      on e: exception do
      begin
        ShowMessage('Erro : ' + e.Message + ' ao tentar importat xml');
        LimpaTela;
      end;
    end;
  finally
    vListaXML.Free;
  end;
end;

procedure TFrmImportacaoXML.BtnLocalizaImportacaoClick(Sender: TObject);
begin
  inherited;
  Try
    if not DMImportacaoXML.QryNF.IsEmpty then
    begin
      FForm.HabilitaControlesModoInclusao;
      LimpaTela;
    end;

    FrmPesquisa := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "GET_PART_IMPORTADOS" ORDER BY "PARTICIPANTE","MES"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
      FCodPartLote := FrmPesquisa.QryPesquisa.FieldByName('CODIGO').AsString;
      FMesLote     := FrmPesquisa.QryPesquisa.FieldByName('MES').AsString;
      if DMImportacaoXML.GetTodasNF(FCodPartLote,FMesLote) then
      begin
        BtnCancelar.Enabled           := true;
        BtnExcluir.Enabled            := true;
        BtnNovaImportacao.Enabled     := false;
        cxPgcImportacao.Visible       := true;
        BtnLocalizaImportacao.Enabled := false;
        SetCaptionAbaNF;
        FiltraItensNF;
      end;
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;
end;

procedure TFrmImportacaoXML.BtnNovaImportacaoClick(Sender: TObject);
begin
  inherited;
  if not DMImportacaoXML.QryNF.IsEmpty then
  begin
    FForm.HabilitaControlesModoInclusao;
    LimpaTela;
  end;
  GpbSelArquivos.Visible        := true;
  EdtDiretorio.Enabled          := GpbSelArquivos.Visible;
  Application.ProcessMessages;
  EdtDiretorio.DoClick;
  BtnIniciaImportacao.Enabled   := (EdtDiretorio.Text <> '');
  BtnNovaImportacao.Enabled     := not (BtnIniciaImportacao.Enabled);
  BtnCancelar.Enabled           := not (BtnNovaImportacao.Enabled);
  BtnLocalizaImportacao.Enabled := false;
  if BtnIniciaImportacao.Enabled  then
  SetaFoco(BtnIniciaImportacao);
end;

procedure TFrmImportacaoXML.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

constructor TFrmImportacaoXML.create(pOwner: TComponent;
  pFinalidadeTela: TFinalidadeTela);
begin
  inherited create(pOwner);
  DMImportacaoXML := TDMImportacaoXML.Create(Self);

  if pFinalidadeTela = ftImportacao then
    FForm := TFormImportacao.Create
  else
    FForm := TFormApuracao.Create;
end;

procedure TFrmImportacaoXML.cxGridDBTVNFCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FiltraItensNF;
end;

procedure TFrmImportacaoXML.cxGridDBTVNFKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if (Key = VK_UP) or ( key = VK_DOWN) then
  begin
    if (DMImportacaoXML.QryItensNF.Active) and
       (DMImportacaoXML.QryItensNF.State = (dsBrowse)) then
    begin
      DMImportacaoXML.QryNF.DisableControls;

      if Key = VK_UP then
        DMImportacaoXML.QryNF.Prior
      else
        DMImportacaoXML.QryNF.Next;

      DMImportacaoXML.QryItensNF.Filtered := false;
      DMImportacaoXML.QryItensNF.Filter   := ' IDNF = ' +
                                             DMImportacaoXML.QryNF.FieldByName('ID').AsString;
      DMImportacaoXML.QryItensNF.Filtered := true;

      if key = VK_UP then
        DMImportacaoXML.QryNF.Next
      else
        DMImportacaoXML.QryNF.Prior;

      DMImportacaoXML.QryNF.EnableControls;
    end;
  end;
end;

function TFrmImportacaoXML.Excluir(pExclusao: TModoExclusao): Boolean;
  function ExcluirLote : Boolean;
  begin
    result := true;
    try
      DMImportacaoXML.DeletaTodasNF(FCodPartLote,FMesLote);
    except
      result := false;
    end;
  end;
  function ExcluirXML : Boolean;
  begin
    result := true;
    try
      DMImportacaoXML.DeleteNF;
    except
      result := false;
    end;
  end;
begin
  case pExclusao of
    mLote: result := ExcluirLote;
    mXML : result := ExcluirXML;
  end;
end;

procedure TFrmImportacaoXML.FiltraItensNF;
begin
   if (DMImportacaoXML.QryItensNF.Active) and
     (DMImportacaoXML.QryNF.State = (dsBrowse)) then
  begin
    DMImportacaoXML.QryItensNF.Filtered := false;
    DMImportacaoXML.QryItensNF.Filter   := ' IDNF = ' +
                                          DMImportacaoXML.QryNF.FieldByName('ID').AsString;
    DMImportacaoXML.QryItensNF.Filtered := true;
  end;
end;

procedure TFrmImportacaoXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FForm);
  FreeAndNil(DMImportacaoXML);
  FreeAndNil(FrmImportacaoXML);
end;

procedure TFrmImportacaoXML.FormShow(Sender: TObject);
begin
  inherited;
  FForm.ConfigControles;
  FForm.HabilitaControlesModoInclusao;
  LimpaTela;
end;

procedure TFrmImportacaoXML.LimpaTela;
begin
  FCodPartLote                   := '';
  FMesLote                       := '';
  EdtDiretorio.Text              := '';
  GpbProcessaImportacao.Visible  := false;
  cxPgcImportacao.Visible        := false;
  EdtDiretorio.Enabled           := false;
  GpbSelArquivos.Visible         := false;
end;

procedure TFrmImportacaoXML.MnuExcluirLoteClick(Sender: TObject);
begin
  inherited;
  if cxGridDBTVNF.Controller.SelectedColumnCount < 0 then
  begin
    FrmMensagem.Informacao('Selecione o registro e tente novamente!');
    exit;
  end;

  if not FrmMensagem.Confirmacao('Deseja realmente excluir o lote XML?') then
  exit;

  if not Excluir(mLote) then
  exit;

  FrmMensagem.Informacao('Registro excluído com sucesso!');
  FForm.HabilitaControlesModoInclusao;
  LimpaTela;
end;

procedure TFrmImportacaoXML.MnuExcluirXMLClick(Sender: TObject);
begin
  inherited;
  if cxGridDBTVNF.Controller.SelectedColumnCount < 0 then
  begin
    FrmMensagem.Informacao('Selecione o registro e tente novamente!');
    exit;
  end;

  if not FrmMensagem.Confirmacao('Deseja realmente excluir o XML selecionado?') then
  exit;

  if not Excluir(mXML) then
  exit;

  FrmMensagem.Informacao('Registro excluído com sucesso!');
  FForm.HabilitaControlesModoInclusao;
  LimpaTela;
end;

procedure TFrmImportacaoXML.SetCaptionAbaNF;
begin
  TbsNF.Caption := 'Nota fiscal(' + DMImportacaoXML.QryNF.RecordCount.ToString + ')';
end;

end.
