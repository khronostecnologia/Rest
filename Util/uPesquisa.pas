unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,DBClient,DBCtrls, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  AdvGlowButton, Mask, JvExMask, JvToolEdit, JvBaseEdits, ComCtrls,
  AdvSmoothPanel;

type
  TFrmPesquisa = class(TForm)
    GridPesquisa: TJvDBUltimGrid;
    pnlTexto: TPanel;
    edtDescCampo: TEdit;
    lblDescricaoTexto: TLabel;
    edtData: TJvDateEdit;
    edtNumero: TJvCalcEdit;
    QryPesquisa: TFDQuery;
    DtsPesquisa: TDataSource;
    QryTipoDados: TFDMemTable;
    QryTipoDadosCampoNome: TStringField;
    QryTipoDadosCampoTipo: TIntegerField;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cbxCampos: TComboBox;
    cbxOperador: TComboBox;
    pnlEntre: TPanel;
    EdtDataInicial: TJvDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtDataFinal: TJvDateEdit;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    PnlHeader: TAdvSmoothPanel;
    lblTitulo: TLabel;
    PnlCentral: TAdvSmoothPanel;
    PnlFooter: TAdvSmoothPanel;
    BtnSelecionar: TAdvGlowButton;
    BtnCancelar: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxCamposCloseUp(Sender: TObject);
    procedure edtDescCampoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure cbxOperadorChange(Sender: TObject);
    procedure edtDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbxCamposKeyPress(Sender: TObject; var Key: Char);
    procedure cbxOperadorKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescCampoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FSqlOriginal    : String;
    FPosicaoAtual   : Integer;
    FSelecionou     : Boolean;
    FFilter         : String;
    Procedure SetSelecionou(const Value: Boolean);
    Procedure FechaTela(pSelecionou : Boolean);
    Procedure CarregarCamposTabela;
    Procedure OpenQuery;
    Function  GetOperador(pStrOperador : String ; pValue , pValue2 : Variant):String;
  public
    { Public declarations }
    Procedure MontaSql(pSQL : String);
    Procedure Filtro(pFiltro : String; pValue : Variant);
    Property  Selecionou : Boolean read FSelecionou write SetSelecionou;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

Uses BiblKhronos,uDMBase;

{ TFrmPesquisa }

Procedure TFrmPesquisa.CarregarCamposTabela;
Var
   i : Integer;

 Procedure GravaTipoDado(pNomeCampo : String ; pTipoCampo : Integer);
 begin
  if not QryTipoDados.Active then
  QryTipoDados.Open;

  QryTipoDados.Append;
  QryTipoDadosCampoNome.AsString  := pNomeCampo;
  QryTipoDadosCampoTipo.AsInteger := pTipoCampo;
  QryTipoDados.Post;
 end;


begin
 cbxCampos.Items.Clear;

 For  i := 0 to QryPesquisa.FieldCount - 1 do
 begin

   cbxCampos.Items.Add(QryPesquisa.Fields[i].FieldName);

   case QryPesquisa.FieldByName(QryPesquisa.Fields[i].FieldName).DataType of
    ftString            : GravaTipoDado(QryPesquisa.Fields[i].FieldName,Ord(ftstring));
    ftInteger           : GravaTipoDado(QryPesquisa.Fields[i].FieldName,Ord(ftInteger));
    ftFloat,ftCurrency  : GravaTipoDado(QryPesquisa.Fields[i].FieldName,Ord(ftFloat));
    ftDate,ftDateTime   : GravaTipoDado(QryPesquisa.Fields[i].FieldName,Ord(ftDateTime));
   end;

 end;
end;

procedure TFrmPesquisa.MontaSql(pSQL : String);
begin
 FSqlOriginal         := pSQL;
end;

procedure TFrmPesquisa.OpenQuery;
begin
 QryPesquisa.Close;
 QryPesquisa.SQL.Text := FSqlOriginal;
 QryPesquisa.Open;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
 Try
  OpenQuery;
  CarregarCamposTabela;
  AjustaTamanhoCampoGrid(GridPesquisa);
  StatusBar1.Panels[0].Text  := FSqlOriginal;
  cbxCampos.ItemIndex        := 0;
  cbxOperador.ItemIndex      := 0;
  SetaFoco(cbxCampos);
 except
  On e: exception do
  begin
   raise Exception.Create('Erro: ' + e.message + ' ao abrir tela de pesquisa');
  end;
 end;
end;

procedure TFrmPesquisa.FormCreate(Sender: TObject);
begin
 edtData.Visible            := False;
 edtNumero.Visible          := False;
 FPosicaoAtual              := edtDescCampo.Left;
 Caption                    := 'Pesquisa | ' + Name;
end;

procedure TFrmPesquisa.cbxCamposCloseUp(Sender: TObject);
begin
 if QryTipoDados.Locate('CampoNome',cbxCampos.Text,[]) then
 Begin
   Case TFieldType(QryTipoDadosCampoTipo.AsInteger) of
    ftString          :
    begin
     edtDescCampo.Left     := FPosicaoAtual;
     edtDescCampo.Visible  := True;
     edtNumero.Visible     := False;
     edtData.Visible       := False;
    end;
    ftInteger,ftFloat :
    begin
     edtNumero.Left        := FPosicaoAtual;
     edtNumero.Visible     := True;
     edtDescCampo.Visible  := False;
     edtData.Visible       := False;
    end;
    ftDate,ftDateTime :
    begin
     edtData.Left          := FPosicaoAtual;
     edtData.Visible       := True;
     edtNumero.Visible     := False;
     edtDescCampo.Visible  := False;
    end;
   end;
 end;
 cbxOperadorChange(Sender);
end;
procedure TFrmPesquisa.edtDescCampoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Return then
 begin
  FFilter  := cbxCampos.Text +  GetOperador(cbxOperador.Text,edtDescCampo.Text,'');
  Filtro(FFilter,edtDescCampo.Text);
 end;
end;

procedure TFrmPesquisa.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Return then
 begin
  FFilter  := cbxCampos.Text + GetOperador(cbxOperador.Text,edtData.Text,'');
  Filtro(FFilter,edtData.Text);
 end;
end;

procedure TFrmPesquisa.edtNumeroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Return then
 begin
  FFilter  := cbxCampos.Text +  GetOperador(cbxOperador.Text,IntToStr(edtNumero.AsInteger),'');
  Filtro(FFilter,edtNumero.AsInteger);
 end;
end;

procedure TFrmPesquisa.BtnCancelarClick(Sender: TObject);
begin
 FechaTela(False);
end;

procedure TFrmPesquisa.SetSelecionou(const Value: Boolean);
begin
  FSelecionou := Value;
end;

procedure TFrmPesquisa.BtnSelecionarClick(Sender: TObject);
begin
 FechaTela(QryPesquisa.RecordCount > 0);
end;

procedure TFrmPesquisa.FechaTela(pSelecionou: Boolean);
begin
 FSelecionou := pSelecionou;
 Close;
end;

procedure TFrmPesquisa.Filtro(pFiltro : String; pValue : Variant);
begin
  With QryPesquisa do
  begin
   DisableControls;
   Filtered := False;

   if VarIsEmpty(pValue) then
    Filter  := ''
   else
    begin
     Filter   := pFiltro;
     Filtered := True;
    end;

   EnableControls;
  end;
end;

 Function TFrmPesquisa.GetOperador(pStrOperador : String ; pValue , pValue2 : Variant):String;
 begin
  if pStrOperador = 'Igual' then
   Result := ' = ' + iif(VarIsStr(pValue),QuotedStr(pValue),pValue)
  else if pStrOperador = 'Diferente' then
   Result := ' <> ' + iif(VarIsStr(pValue),QuotedStr(pValue),pValue)
  else if pStrOperador = 'Começa com' then
   Result := ' LIKE ' + iif(VarIsStr(pValue),QuotedStr(pValue + '%'),pValue + '%')
  else if pStrOperador = 'Contem' then
   Result := ' LIKE ' + iif(VarIsStr(pValue),QuotedStr('%' + pValue + '%'),'%' + pValue + '%')
  else {Entre}
   Result := ' Between' + iif(VarIsStr(pValue),QuotedStr(pValue),pValue) + ' AND ' + iif(VarIsStr(pvalue2),QuotedStr(pvalue2),pValue2);
 end;

procedure TFrmPesquisa.cbxOperadorChange(Sender: TObject);
begin
 With pnlEntre do
 begin
   Left    := iif(cbxOperador.Text = 'Entre',pnlTexto.left,344);
   Top     := iif(cbxOperador.Text = 'Entre',pnlTexto.Top,662);
   Visible := (cbxOperador.Text = 'Entre');
 end;
end;

procedure TFrmPesquisa.edtDataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Return then
 begin
  FFilter  := cbxCampos.Text +  GetOperador(cbxOperador.Text,EdtDataInicial.Text,edtDataFinal.text);
  Filtro(FFilter,EdtDataInicial.Text);
 end;
end;

procedure TFrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Escape then
 Close;
end;

procedure TFrmPesquisa.GridPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key = #13 then
 Begin
  btnSelecionar.Click;
 end;
end;

procedure TFrmPesquisa.cbxCamposKeyPress(Sender: TObject; var Key: Char);
begin
 If key = #13 then
 Begin
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
 end;
end;

procedure TFrmPesquisa.cbxOperadorKeyPress(Sender: TObject; var Key: Char);
begin
 If key = #13 then
 Begin
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
 end;
end;

procedure TFrmPesquisa.edtDescCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
 If key = #13 then
 Begin
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
 end;
end;

end.
