unit uImportacaoSPEDICMSIPI;

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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFrmImportarSPED = class(TFrmMaster)
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
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGridC170e: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
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
    cxGridDBColumn7: TcxGridDBColumn;
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
    cxGridC170s: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
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
    TbsAnalise: TcxTabSheet;
    GpbResultEntrada: TAdvGroupBox;
    GpbResultSaida: TAdvGroupBox;
    GpbTotalizador: TAdvGroupBox;
    lblTotalEntrada: TLabel;
    lblTotalSaida: TLabel;
    lblRestituir: TLabel;
    lblComplementar: TLabel;
    BtnImprimirResultado: TAdvGlowButton;
    cxGridTotalizadorEntradaDBTableView1: TcxGridDBTableView;
    cxGridTotalizadorEntradaLevel1: TcxGridLevel;
    cxGridTotalizadorEntrada: TcxGrid;
    cxGridTotalizadorSaida: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    BtnLocalizaImportacao: TAdvGlowButton;
    BtnNovaImportacacao: TAdvGlowButton;
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
  private
    { Private declarations }
    FNomeTabela : String;
    FCNPJ       : String;
    procedure ImportarSPED;
    procedure ImportaReg0000;
    procedure ImportaReg0200;
    procedure ImportaRegC100;
    procedure ImportaRegC400;
    procedure CriaTabelaEmpresaLogada(ASQL : String);
    procedure CarregaSPED(AID : Integer ;ACNPJ : String);
    function  ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
    function  GetSQLCreateRegistro0000(ACPFCNPJ : String): String;
    function  GetSQLCreateRegistro0200(ACPFCNPJ : String): String;
    function  GetSQLCreateRegistroC100(ACPFCNPJ : String): String;
    function  GetSQLCreateRegistroC400(ACPFCNPJ : String): String;
  public
    { Public declarations }
  end;

var
  FrmImportarSPED: TFrmImportarSPED;

implementation

{$R *.dfm}

Uses uDMBase,uMensagem,BiblKhronos,uDMImportacaoSPED,
     ACBrEFDBlocos,uPesquisa,uMenu;

procedure TFrmImportarSPED.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  EdtArquivo.Enabled            := false;
  BtnIniciaImportacao.Enabled   := false;
  BtnGravar.Enabled             := false;
  BtnCancelar.Enabled           := false;
  BtnNovaImportacacao.Enabled   := true;
  BtnLocalizaImportacao.Enabled := true;
  EdtArquivo.Clear;
  cxPgcImportacao.Visible       := false;
  GpbRegistro0000.Visible       := false;

  with DMImportacaoSPED do
  begin
    Qry0000.Close;
    Qry0200.Close;
    QryC100e.Close;
    QryC170e.Close;
    QryC400.Close;
    QryC470.Close;
    QryC100s.Close;
    QryC170s.Close;
  end;
end;

procedure TFrmImportarSPED.BtnIniciaImportacaoClick(Sender: TObject);
begin
  inherited;
  if not (EdtArquivo.Text <> '') then
  begin
    FrmMensagem.Informacao('Informe o arquivo que deseja importar ' +
                           ' e tente novamente!');
    SetaFoco(EdtArquivo);
  end;
  ImportarSPED;
  cxPgcImportacao.ActivePageIndex := 0;
  BtnGravar.Enabled             := true;
  BtnCancelar.Enabled           := true;
  BtnLocalizaImportacao.Enabled := false;
  BtnNovaImportacacao.Enabled   := false;
end;

procedure TFrmImportarSPED.BtnLocalizaImportacaoClick(Sender: TObject);
var
  vRetorno : Integer;
begin
  inherited;
  Try
  FrmMenu.SelecionaCliente;
  if dmPrincipal.QryEmpresa.Active then
  begin
    FrmPesquisa := TFrmPesquisa.Create(nil);
    FrmPesquisa.MontaSql('SELECT * FROM "CADASTROS"."REGISTRO0000_'+ dmPrincipal.QryEmpresaCPFCNPJ.AsString + '" ' +
                         ' ORDER BY "RAZAO_SOCIAL"');
    FrmPesquisa.ShowModal;
    if FrmPesquisa.Selecionou then
    begin
      vRetorno := FrmPesquisa.QryPesquisa.fieldbyName('ID').AsInteger;
     CarregaSPED(vRetorno,dmPrincipal.QryEmpresaCPFCNPJ.AsString);
     BtnIniciaImportacao.Enabled   := false;
     BtnGravar.Enabled             := false;
     BtnCancelar.Enabled           := true;
     BtnLocalizaImportacao.Enabled := false;
     BtnNovaImportacacao.Enabled   := false;
    end;
  end;
 finally
  FreeAndNil(FrmPesquisa);
 end;
end;

procedure TFrmImportarSPED.BtnNovaImportacacaoClick(Sender: TObject);
begin
  inherited;
  EdtArquivo.Enabled := true;
  SetaFoco(EdtArquivo);
end;

procedure TFrmImportarSPED.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmImportarSPED.CarregaSPED(AID : Integer ;ACNPJ : String);
begin
  try
    with DMImportacaoSPED do
    begin
      Qry0000.Close;
      Qry0000.SQL.Clear;
      Qry0000.SQL.Text := 'SELECT * FROM "CADASTROS"."REGISTRO0000_' + ACNPJ + '"' +
                          'WHERE IDSPED =' + AID.ToString;
      Qry0000.Open;

      Qry0200.Close;
      Qry0200.SQL.Clear;
      Qry0200.SQL.Text := 'SELECT * FROM "CADASTROS"."REGISTRO0200_' + ACNPJ + '"' +
                          'WHERE IDSPED =' + AID.ToString;
      Qry0200.Open;

      QryC100e.Close;
      QryC100e.SQL.Clear;
      QryC100e.SQL.Text := 'SELECT * FROM "REG_ENT"."REGISTROC100_' + ACNPJ + '"' +
                           'WHERE IDSPED =' + AID.ToString;
      QryC100e.Open;

      QryC170e.Close;
      QryC170e.SQL.Clear;
      QryC170e.SQL.Text := 'SELECT * FROM "REG_ENT"."REGISTROC170_' + ACNPJ + '"' +
                           'WHERE IDSPED =' + AID.ToString;
      QryC170e.Open;

      QryC100s.Close;
      QryC100s.SQL.Clear;
      QryC100s.SQL.Text := 'SELECT * FROM "REG_SAIDA"."REGISTROC100_' + ACNPJ + '"' +
                           'WHERE IDSPED =' + AID.ToString;
      QryC100s.Open;

      QryC170s.Close;
      QryC170s.SQL.Clear;
      QryC170s.SQL.Text := 'SELECT * FROM "REG_SAIDA"."REGISTROC170_' + ACNPJ + '"' +
                           'WHERE IDSPED =' + AID.ToString;
      QryC170s.Open;

    end;
  except
    on e: exception do
    begin
      FrmMensagem.Informacao('Erro : ' + e.Message + ' ao tentar carregar SPED.');
      abort;
    end;
  end;
end;

procedure TFrmImportarSPED.CriaTabelaEmpresaLogada(ASQL: String);
begin
  dmPrincipal.DB.ExecSQL(ASQL);
end;


procedure TFrmImportarSPED.EdtArquivoAfterDialog(Sender: TObject;
  var AName: string; var AAction: Boolean);
begin
  inherited;
  BtnIniciaImportacao.Enabled := (AName <> '');
end;

function TFrmImportarSPED.ExisteArqSPED(ADT_INI,ADT_FIM,ACNPJCPF : String) : Boolean;
var
  Qry      : TFDQuery;
  vSQL     : String;
begin
  try
    vSQL   := ' SELECT "ID" FROM "CADASTROS"."REGISTRO0000_' +
                QuotedStr(dmPrincipal.QryEmpresaCPFCNPJ.AsString) +
              ' WHERE "DT_INI" = ' + QuotedStr(ADT_INI) +
              ' AND "DT_FIM" = ' + QuotedStr(ADT_FIM) +
              ' AND "CNPJ" = ' + QuotedStr(ACNPJCPF) +
              ' OR "CPF" = ' + QuotedStr(ACNPJCPF);
    Qry    := ConsultaSQL(vSQL,dmPrincipal.DB);
    result := (Qry.IsEmpty);
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TFrmImportarSPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(DMImportacaoSPED);
  FreeAndNil(FrmImportarSPED);
end;

procedure TFrmImportarSPED.FormCreate(Sender: TObject);
begin
  inherited;
  DMImportacaoSPED := TDMImportacaoSPED.Create(nil);
end;

procedure TFrmImportarSPED.FormShow(Sender: TObject);
begin
  inherited;
  EdtArquivo.InitialDir          := dmPrincipal.DirApp;
  BtnIniciaImportacao.Enabled    := False;
  BtnGravar.Enabled              := False;
  BtnCancelar.Enabled            := false;
  GpbProcessaImportacao.Visible  := false;
  GpbRegistro0000.Visible        := false;
  cxPgcImportacao.Visible        := false;
  EdtArquivo.Enabled             := false;
  SetaFoco(BtnNovaImportacacao);
end;

function TFrmImportarSPED.GetSQLCreateRegistro0000(ACPFCNPJ : String): String;
begin
  result := 'CREATE TABLE "CADASTROS"."REGISTRO0000_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "COD_FIN" character varying(30),                    '+
            '      "DT_INI" TIMESTAMP,                                 '+
            '      "DT_FIM" TIMESTAMP,                                 '+
            '      "NOME" character varying(100),                      '+
            '      "CNPJ" character varying(20),                       '+
            '      "CPF" character varying(20),                        '+
            '      "UF" character varying(2),                          '+
            '      "IE" character varying(20),                         '+
            '      "COD_MUN" integer,                                  '+
            '      "IND_PERFIL" character varying(30),                 '+
            '      "IND_ATIV" character varying(30),                   '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "CADASTROS"."REGISTRO0000_' + ACPFCNPJ + '" '+
            '      OWNER to postgres;                                  ';
end;

function TFrmImportarSPED.GetSQLCreateRegistro0200(ACPFCNPJ: String): String;
begin
  result := 'CREATE TABLE "CADASTROS"."REGISTRO0200_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "IDSPED" Integer,                                   '+
            '      "COD_ITEM" character varying(30),                   '+
            '      "DESCR_ITEM" character varying(100),                '+
            '      "CODBARRA" character varying(14),                   '+
            '      "UNID" character varying(5),                        '+
            '      "TIPO_ITEM" character varying(30),                  '+
            '      "COD_NCM" character varying(15),                    '+
            '      "ALIQ_ICMS" DECIMAL(15,2),                          '+
            '      "CEST" character varying(15),                       '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "CADASTROS"."REGISTRO0200_' + ACPFCNPJ + '" '+
            '      OWNER to postgres;                                  ';
end;

function TFrmImportarSPED.GetSQLCreateRegistroC100(ACPFCNPJ: String): String;
begin
  result := 'CREATE TABLE "REG_ENT"."REGISTROC100_' + ACPFCNPJ + '"    '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "ID_SPED" Integer,                                  '+
            '      "IND_OPER" character varying(50),                   '+
            '      "COD_PART" character varying(50),                   '+
            '      "PARTICIPANTE" character varying(100),              '+
            '      "COD_MOD" character varying(5),                     '+
            '      "SER" character varying(5),                         '+
            '      "NUM_DOC" character varying(10),                    '+
            '      "CHV_NFE" character varying(44),                    '+
            '      "DT_DOC" timestamp,                                 '+
            '      "DT_E_ES" timestamp,                                '+
            '      "VL_DOC" decimal(15,2),                             '+
            '      "VL_MERC" decimal(15,2),                            '+
            '      "VL_DESC" decimal(15,2),                            '+
            '      "VL_FRT" decimal(15,2),                             '+
            '      "VL_SEG" decimal(15,2),                             '+
            '      "VL_OUT_DA" decimal(15,2),                          '+
            '      "VL_BC_ICMS" decimal(15,2),                         '+
            '      "VL_ICMS" decimal(15,2),                            '+
            '      "VL_BC_ICMS_ST" decimal(15,2),                      '+
            '      "VL_ICMS_ST" decimal(15,2),                         '+
            '      "VL_BC_IPI" decimal(15,2),                          '+
            '      "VL_IPI" decimal(15,2),                             '+
            '      "VL_BC_PIS" decimal(15,2),                          '+
            '      "VL_PIS" decimal(15,2),                             '+
            '      "VL_BC_COFINS" decimal(15,2),                       '+
            '      "VL_COFINS" decimal(15,2),                          '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_ENT"."REGISTROC100_' + ACPFCNPJ + '" '+
            '      OWNER to postgres; '+

            'CREATE TABLE "REG_ENT"."REGISTROC170_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "IDNF" Integer,                                     '+
            '      "ID_SPED" Integer,                                  '+
            '      "NUM_ITEM" character varying(5),                    '+
            '      "COD_ITEM" character varying(14),                   '+
            '      "QTDE" decimal(15,3),                               '+
            '      "UNID" character varying(5),                        '+
            '      "VL_ITEM" decimal(15,2),                            '+
            '      "VL_DESC" decimal(15,2),                            '+
            '      "CST_ICMS" character varying(3),                    '+
            '      "CFOP" character varying(4),                        '+
            '      "VL_BC_ICMS" decimal(15,2),                         '+
            '      "ALIQ_ICMS" decimal(15,2),                          '+
            '      "VL_ICMS" decimal(15,2),                            '+
            '      "VL_BC_ICMS_ST" decimal(15,2),                      '+
            '      "ALIQ_ST" decimal(15,2),                            '+
            '      "VL_ICMS_ST" decimal(15,2),                         '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_ENT"."REGISTROC170_' + ACPFCNPJ + '" '+
            '      OWNER to postgres; '+

            'CREATE TABLE "REG_SAIDA"."REGISTROC100_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "ID_SPED" Integer,                                  '+
            '      "IND_OPER" character varying(50),                   '+
            '      "COD_PART" character varying(50),                   '+
            '      "PARTICIPANTE" character varying(100),              '+
            '      "COD_MOD" character varying(5),                     '+
            '      "SER" character varying(5),                         '+
            '      "NUM_DOC" character varying(10),                    '+
            '      "CHV_NFE" character varying(44),                    '+
            '      "DT_DOC" timestamp,                                 '+
            '      "DT_E_ES" timestamp,                                '+
            '      "VL_DOC" decimal(15,2),                             '+
            '      "VL_MERC" decimal(15,2),                            '+
            '      "VL_DESC" decimal(15,2),                            '+
            '      "VL_FRT" decimal(15,2),                             '+
            '      "VL_SEG" decimal(15,2),                             '+
            '      "VL_OUT_DA" decimal(15,2),                          '+
            '      "VL_BC_ICMS" decimal(15,2),                         '+
            '      "VL_ICMS" decimal(15,2),                            '+
            '      "VL_BC_ICMS_ST" decimal(15,2),                      '+
            '      "VL_ICMS_ST" decimal(15,2),                         '+
            '      "VL_BC_IPI" decimal(15,2),                          '+
            '      "VL_IPI" decimal(15,2),                             '+
            '      "VL_BC_PIS" decimal(15,2),                          '+
            '      "VL_PIS" decimal(15,2),                             '+
            '      "VL_BC_COFINS" decimal(15,2),                       '+
            '      "VL_COFINS" decimal(15,2),                          '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_SAIDA"."REGISTROC100_' + ACPFCNPJ + '" '+
            '      OWNER to postgres; '+

            'CREATE TABLE "REG_SAIDA"."REGISTROC170_' + ACPFCNPJ + '" '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "ID_SPED" Integer,                                  '+
            '      "IDNF" Integer,                                     '+
            '      "NUM_ITEM" character varying(5),                    '+
            '      "COD_ITEM" character varying(14),                   '+
            '      "QTDE" decimal(15,3),                               '+
            '      "UNID" character varying(5),                        '+
            '      "VL_ITEM" decimal(15,2),                            '+
            '      "VL_DESC" decimal(15,2),                            '+
            '      "CST_ICMS" character varying(3),                    '+
            '      "CFOP" character varying(4),                        '+
            '      "VL_BC_ICMS" decimal(15,2),                         '+
            '      "ALIQ_ICMS" decimal(15,2),                          '+
            '      "VL_ICMS" decimal(15,2),                            '+
            '      "VL_BC_ICMS_ST" decimal(15,2),                      '+
            '      "ALIQ_ST" decimal(15,2),                            '+
            '      "VL_ICMS_ST" decimal(15,2),                         '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_SAIDA"."REGISTROC170_' + ACPFCNPJ + '" '+
            '      OWNER to postgres; ';
end;

function TFrmImportarSPED.GetSQLCreateRegistroC400(ACPFCNPJ: String): String;
begin

  result := 'CREATE TABLE "REG_SAIDA"."REGISTROC400_' + ACPFCNPJ + '"  '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "ID_SPED" Integer,                                  '+
            '      "DATA" timestamp,                                   '+
            '      "ECF_FAB" character varying(30),                    '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_SAIDA"."REGISTROC400_' + ACPFCNPJ + '" '+
            '      OWNER to postgres'+

            'CREATE TABLE "REG_SAIDA"."REGISTROC425_' + ACPFCNPJ + '"  '+
            '  (                                                       '+
            '      "ID" Integer NOT NULL,                              '+
            '      "ID_SPED" Integer,                                  '+
            '      "ID_REDZ" Integer,                                  '+
            '      "COD_ITEM" character varying(30),                   '+
            '      "DESCR_ITEM" character varying(100),                '+
            '      "QTD" decimal(15,2),                                '+
            '      "VL_ITEM" decimal(15,2),                            '+
            '      PRIMARY KEY ("ID")                                  '+
            '  )                                                       '+
            '  WITH (                                                  '+
            '      OIDS = FALSE                                        '+
            '  );                                                      '+
            '  ALTER TABLE "REG_SAIDA"."REGISTROC425_' + ACPFCNPJ + '" '+
            '      OWNER to postgres';

end;

procedure TFrmImportarSPED.ImportaReg0000;
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

  vDT_INI     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_INI;
  vDT_FIM     := ACBrSPEDFiscal.Bloco_0.Registro0000.DT_FIN;
  FCNPJ       := iif(ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ <> '',
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CNPJ,
                 ACBrSPEDFiscal.Bloco_0.Registro0000.CPF);
  FNomeTabela := 'REGISTRO0000_' + FCNPJ;
  ProgressBar.Position          := ProgressBar.Position + 20;

  if dmPrincipal.QryEmpresa.Active then
  begin
    lblInfoImportacao.Caption     := 'Verificando registro de arquivos importados...';
    if ExisteArqSPED(DateToStr(vDT_INI),DateToStr(vDT_FIM),FCNPJ) then
    begin
      FrmMensagem.Informacao('Arquivo com registro de importado...tente novamente!');
      Abort;
    end;
  end
  else
  begin
    lblInfoImportacao.Caption  := 'Verificando tabela de identificação existe...';
    if not TabelaExiste(FNomeTabela,dmPrincipal.DB) then
    begin
      try
        lblInfoImportacao.Caption  := 'Criando tabela de identificação...';
        CriaTabelaEmpresaLogada(GetSQLCreateRegistro0000(FCNPJ));
      except
        raise;
      end;
    end;
  end;

  ProgressBar.Position          := ProgressBar.Position + 30;

  With DMImportacaoSPED.Qry0000 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM "CADASTROS"."' + FNomeTabela + '" '+
                'WHERE "ID" = -1';
    Open;
    Insert;
    FieldByName('ID').AsInteger         := GetID('"CADASTROS"."'+ FNomeTabela + '"',dmPrincipal.DB) + 1;
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
    Post;
  end;
  ProgressBar.Position          := ProgressBar.Position + 45;
  ProgressBar.Position          := 99;
end;

procedure TFrmImportarSPED.ImportaReg0200;
var
  i           : Integer;
  j           : Integer;

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
  ProgressBar.Max               := j;
  ProgressBar.Position          := 0;
  FNomeTabela                   := 'REGISTRO0200_' + FCNPJ;
  if j > 0 then
  begin
    if not TabelaExiste(FNomeTabela,dmPrincipal.DB) then
    CriaTabelaEmpresaLogada(GetSQLCreateRegistro0200(FCNPJ));

    with DMImportacaoSPED do
    begin
      Qry0200.Close;
      Qry0200.SQL.Clear;
      Qry0200.SQL.Text  := 'SELECT * FROM "CADASTROS"."' + FNomeTabela + '" '+
                           'WHERE "ID" = -1';
      Qry0200.Open;

      for I := 0 to j do
      begin
         Qry0200.Insert;
         Qry0200ID.AsInteger         := GetID('"CADASTROS"."'+ FNomeTabela + '"',dmPrincipal.DB) + 1;
         Qry0200IDSPED.AsInteger     := Qry0000ID.AsInteger;
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
      end;
    end;
  end;
end;

procedure TFrmImportarSPED.ImportaRegC100;
var
  i          : Integer;
  j          : Integer;
  K          : Integer;
  vIDC170e   : Integer;
  vIDC170s   : Integer;
  vGerouIDe  : Boolean;
  vGerouIDs  : Boolean;
begin
  lblInfoImportacao.Caption     := 'Carregando registro C100 e C170...';
  j                             := Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Count);
  ProgressBar.Max               := j;
  ProgressBar.Position          := 0;
  FNomeTabela                   := 'REGISTROC100_' + FCNPJ;

  {Controla sequence temp}
  vGerouIDe                     := false;
  vGerouIDs                     := false;

  if j > 0 then
  begin
    if not TabelaExiste(FNomeTabela,dmPrincipal.DB) then
    CriaTabelaEmpresaLogada(GetSQLCreateRegistroC100(FCNPJ));

    with DMImportacaoSPED do
    begin
      QryC100e.Close;
      QryC100e.SQL.Clear;
      QryC100e.SQL.Text  := 'SELECT * FROM "REG_ENT"."REGISTROC100_' + FCNPJ + '"'+
                            'WHERE "ID" = -1';
      QryC100e.Open;

      QryC170e.Close;
      QryC170e.SQL.Clear;
      QryC170e.SQL.Text  := 'SELECT * FROM "REG_ENT"."REGISTROC170_' + FCNPJ + '"'+
                            'WHERE "ID" = -1';
      QryC170e.Open;

      QryC100s.Close;
      QryC100s.SQL.Clear;
      QryC100s.SQL.Text  := 'SELECT * FROM "REG_SAIDA"."REGISTROC100_' + FCNPJ + '"'+
                            'WHERE "ID" = -1';
      QryC100s.Open;

      QryC170s.Close;
      QryC170s.SQL.Clear;
      QryC170s.SQL.Text  := 'SELECT * FROM "REG_SAIDA"."REGISTROC170_' + FCNPJ + '"'+
                            'WHERE "ID" = -1';
      QryC170s.Open;

      for I := 0 to j do
      begin
        if ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].IND_OPER
         = tpEntradaAquisicao then
        begin
          QryC100e.Insert;
          QryC100eID.AsInteger          := GetID('"REG_ENT"."'+ FNomeTabela + '"',dmPrincipal.DB) + 1;
          QryC100eID_SPED.AsInteger     := Qry0000ID.AsInteger;
          QryC100eIND_OPER.AsString     := 'Entrada Aquisicao';
          QryC100eCOD_PART.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_PART;
          QryC100ePARTICIPANTE.AsString := 'PARTICIPANTE AVULSO';
          QryC100eCOD_MOD.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_MOD;
          QryC100eSER.AsString          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].SER;
          QryC100eNUM_DOC.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].NUM_DOC;
          QryC100eCHV_NFE.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].CHV_NFE;
          QryC100eDT_DOC.AsDateTime     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_DOC;
          QryC100eDT_E_ES.AsDateTime    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_E_S;
          QryC100eVL_DOC.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DOC;
          QryC100eVL_MERC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_MERC;
          QryC100eVL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DESC;
          QryC100eVL_FRT.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_FRT;
          QryC100eVL_SEG.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_SEG;
          QryC100eVL_OUT_DA.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_OUT_DA;
          QryC100eVL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS;
          QryC100eVL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS;
          QryC100eVL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS_ST;
          QryC100eVL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS_ST;
          QryC100e.Post;
        end
        else
        begin
          QryC100s.Insert;
          QryC100sID_SPED.AsInteger     := Qry0000ID.AsInteger;
          QryC100sID.AsInteger          := GetID('"REG_SAIDA"."' + FNomeTabela + '"',dmPrincipal.DB) + 1;
          QryC100sIND_OPER.AsString     := 'Saida prestação';
          QryC100sCOD_PART.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_PART;
          QryC100sPARTICIPANTE.AsString := 'PARTICIPANTE AVULSO';
          QryC100sCOD_MOD.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].COD_MOD;
          QryC100sSER.AsString          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].SER;
          QryC100sNUM_DOC.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].NUM_DOC;
          QryC100sCHV_NFE.AsString      := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].CHV_NFE;
          QryC100sDT_DOC.AsDateTime     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_DOC;
          QryC100sDT_E_ES.AsDateTime    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].DT_E_S;
          QryC100sVL_DOC.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DOC;
          QryC100sVL_MERC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_MERC;
          QryC100sVL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_DESC;
          QryC100sVL_FRT.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_FRT;
          QryC100sVL_SEG.AsFloat        := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_SEG;
          QryC100sVL_OUT_DA.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_OUT_DA;
          QryC100sVL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS;
          QryC100sVL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS;
          QryC100sVL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_BC_ICMS_ST;
          QryC100sVL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].VL_ICMS_ST;
          QryC100s.Post;
        end;


        for K := 0 to Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i]
        .RegistroC170.Count) do
        begin
          if ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].IND_OPER
          = tpEntradaAquisicao then
          begin

            if not vGerouIDe then
            begin
              vIDC170e   := GetID('"REG_ENT"."REGISTROC170_' + FCNPJ + '"',dmPrincipal.DB);
              vGerouIDe  := true;
            end;

            QryC170e.Insert;
            vIDC170e                      :=  vIDC170e + 1;
            QryC170eID.AsInteger          :=  vIDC170e;
            QryC170eID_SPED.AsInteger     := Qry0000ID.AsInteger;
            QryC170eIDNF.AsInteger        := QryC100eID.AsInteger;

            QryC170eNUM_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].NUM_ITEM;

            QryC170eCOD_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].COD_ITEM;

            QryC170eQTDE.AsFloat          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].QTD;

            QryC170eUNID.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].UNID;

            QryC170eVL_ITEM.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ITEM;

            QryC170eVL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_DESC;

            QryC170eCST_ICMS.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].CST_ICMS;

            QryC170eCFOP.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].CFOP;

            QryC170eVL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_BC_ICMS;

            QryC170eALIQ_ICMS.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].ALIQ_ICMS;

            QryC170eVL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ICMS;

            QryC170eVL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_BC_ICMS_ST;

            QryC170eVL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ICMS_ST;

            QryC170eALIQ_ST.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].ALIQ_ST;
            QryC170e.Post;
          end
          else
          begin
            if not vGerouIDs then
            begin
              vIDC170s   := GetID('"REG_SAIDA"."REGISTROC170_' + FCNPJ + '"',dmPrincipal.DB);
              vGerouIDs  := true;
            end;

            QryC170s.Insert;
            vIDC170s                      := vIDC170s + 1;
            QryC170SID.AsInteger          := vIDC170s;
            QryC170sIDNF.AsInteger        := QryC100sID.AsInteger;
            QryC170sID_SPED.AsInteger     := Qry0000ID.AsInteger;

            QryC170sNUM_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].NUM_ITEM;

            QryC170sCOD_ITEM.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].COD_ITEM;

            QryC170sQTDE.AsFloat          := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].QTD;

            QryC170sUNID.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].UNID;

            QryC170sVL_ITEM.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ITEM;

            QryC170sVL_DESC.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_DESC;

            QryC170sCST_ICMS.AsString     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].CST_ICMS;

            QryC170sCFOP.AsString         := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].CFOP;

            QryC170sVL_BC_ICMS.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_BC_ICMS;

            QryC170sALIQ_ICMS.AsFloat     := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].ALIQ_ICMS;

            QryC170sVL_ICMS.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ICMS;

            QryC170sVL_BC_ICMS_ST.AsFloat := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_BC_ICMS_ST;

            QryC170sVL_ICMS_ST.AsFloat    := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].VL_ICMS_ST;

            QryC170sALIQ_ST.AsFloat       := ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Items[i].
                                             RegistroC170.Items[k].ALIQ_ST;
            QryC170s.Post;
          end;
        end;
        ProgressBar.Position  := ProgressBar.Position + 1;
      end;
    end;
  end;
end;

procedure TFrmImportarSPED.ImportaRegC400;
var
  i : Integer;
  j : Integer;
  K : Integer;
begin
  lblInfoImportacao.Caption     := 'Carregando registro C400 e C425...';
  j                             := Pred(ACBrSPEDFiscal.Bloco_C.RegistroC001.RegistroC100.Count);
  ProgressBar.Max               := j;
  ProgressBar.Position          := 0;

end;

procedure TFrmImportarSPED.ImportarSPED;
begin
 try
   try
     ACBrSpedFiscalImportar.Arquivo := EdtArquivo.Text;
     ACBrSpedFiscalImportar.Importar;
     GpbProcessaImportacao.Visible := true;

     ImportaReg0000;
     ImportaReg0200;
     ImportaRegC100;
     ImportaRegC400;

     Application.ProcessMessages;
     FrmMensagem.Informacao('Importação realizada com sucesso!');
     GpbRegistro0000.Visible       := true;
     cxPgcImportacao.Visible       := true;
    except
      on e: exception do
      begin
        FrmMensagem.Informacao('Erro : ' + e.Message + ' ao importar arquivo SPED.');
        GpbRegistro0000.Visible       := false;
        cxPgcImportacao.Visible       := false;
      end;
   end;
 finally
   GpbProcessaImportacao.Visible := false;
 end;

end;

end.
