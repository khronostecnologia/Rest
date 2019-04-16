unit BiblKhronos;

{Autor : Giovanny Oliveira - Khronos Tecnologia}

interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Provider, DB, DBClient, StdCtrls, Grids,
  DBGrids,uMenu,Clipbrd,frxClass,DateUtils,JvToolEdit, Mask, JvExMask, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvExStdCtrls, JvEdit,JvExDBGrids, JvDBGrid,
  JvDBUltimGrid,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  RLPreviewForm, RLHTMLFilter, RLRichFilter,
  RLXLSFilter, RLFilters, RLPDFFilter, ImgList,
  RxCalc, Buttons, ComCtrls, ExtCtrls, Menus, frxExportText, frxExportCSV, frxExportImage,
  frxExportRTF, frxExportHTML, frxExportPDF, frxExportBIFF, frxExportDBF,
  frxExportTXT, frxExportMail, frxExportXML, frxExportXLS, DBCtrls,
  jpeg,TLHelp32, PsAPI, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite,shellapi,MidasLib,
  FireDAC.Phys.MySQL, AppEvnts;


  Type
  TpOperacao              = (Inclusao,Edicao);
  TState                  = (stBrowser,stEdit,stInsert,stDelete);
  TTpEstoque              = (estLoja,estDep);
  TTpMov                  = (tmSomar,tmSubtrair);
  TMovimento              = (tmovCompra,tmovVenda);

  Function GetValor(AConexao : TFDConnection; ACampo, ATabela : String; AAgregacao : String  = '' ; AWhere : String = '') : Variant;
  Function GetStrValor(AConexao : TFDConnection; ACampo, ATabela : String; AAgregacao : String  = '' ; AWhere : String = '') : Variant;
  function ConsultaSQL(ASQL : String ; AConnection : TFDConnection):TFDQuery;Overload;
  Function InserirLog(AConexao:TFDConnection; ATexto : String ; ATabela : String = '' ;
  ACodUsuario : String =  '';AAplicCommit : Boolean = False):Boolean;
  Function IIf(const condicao: Boolean; const Verdadeiro, Falso: Variant): Variant;
  Function TerminarProcesso(sFile: String): Boolean;
  Procedure SelecionarRegistros(Querie : TFDQuery;Sel : String; SelAll : Boolean);
  Procedure Imprimir(Var pReport : TfrxReport);
  Procedure AjustaTamanhoCampoGrid(pGrid : TJvDBUltimGrid);
  Procedure SetaFoco(AControl : TWinControl);
  Procedure MarcacaoCheckBox(ADataSet : TFDQuery ; AMarcacao : Boolean) ;
  Procedure CopyQuery(SQL : String);

Const
  CheckBoxMarcado      = True;
  CheckBoxDesmarcado   = False;

implementation

function TerminarProcesso(sFile: String): Boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap,hdlProcess: THandle;
  bPath,bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: Array [0..1023] of DWORD;
  iC: DWord;
  k,iCount: Integer;
  arrModul: Array [0..299] of Char;
  hdlModul: HMODULE;
begin
  Result := False;
  if ExtractFileName(sFile)=sFile then
    bPath:=false
  else
    bPath:=true;
  verSystem.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId=VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize:=Sizeof(peEntry);
    bLoop:=Process32First(hdlSnap,peEntry);
    while integer(bLoop)<>0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile,sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID), 0);
          Result := True;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile),sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID), 0);
          Result := True;
        end;
      end;
      bLoop := Process32Next(hdlSnap,peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else
    if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then
    begin
      EnumProcesses(@arrPid,SizeOf(arrPid),iC);
      iCount := iC div SizeOf(DWORD);
      for k := 0 to Pred(iCount) do
      begin
        hdlProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
        if (hdlProcess<>0) then
        begin
          EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
          GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
          if bPath then
          begin
            if CompareText(arrModul,sFile) = 0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end
          else
          begin
            if CompareText(ExtractFileName(arrModul),sFile) = 0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end;
          CloseHandle(hdlProcess);
        end;
      end;
    end;
 end;

Function InserirLog(AConexao:TFDConnection; ATexto : String ; ATabela : String = '' ;
  ACodUsuario : String =  '';AAplicCommit : Boolean = False):Boolean;
Var
 QryTemp : TFDQuery;
begin

 QryTemp := TFDQuery.Create(nil);

 Try
  Result := True;
   try
    QryTemp.Connection  := AConexao;
    QryTemp.SQL.Text    := 'INSERT INTO TB_LOG (DESCRICAO,DATA,USUARIO,TABELA)VALUES(:DESCRICAO,getDate(),:USUARIO,:TABELA)';
    QryTemp.ParamByName('DESCRICAO').AsString  := ATexto;
    QryTemp.ParamByName('USUARIO').AsString    := ACodUsuario;
    QryTemp.ParamByName('Tabela').AsString     := ATabela;
    QryTemp.Prepare;
    QryTemp.ExecSQL;

    if AAplicCommit then
    AConexao.Commit;
   except
    raise;
   End;
  Finally
   QryTemp.Unprepare;
   QryTemp.Free;
  End;

end;

Procedure CopyQuery(SQL : String);
begin
 Clipboard.AsText := SQL;
end;

procedure SelecionarRegistros(Querie : TFDQuery;Sel : String; SelAll : Boolean);
begin
  IF SelAll then
  begin
   Querie.First;
   While not Querie.Eof do
   begin
    Querie.Edit;
     Querie.FieldByName('SELECIONADO').AsString := Sel;
    Querie.Post;
    Querie.Next;
   end;
   Querie.First;
  end
  else
  begin
    Querie.Edit;
     Querie.FieldByName('SELECIONADO').AsString := Sel;
    Querie.Post;
  end;
end;

function IIf(const condicao: Boolean; const Verdadeiro, Falso: Variant): Variant;
begin
  if condicao then
    Result := Verdadeiro
  else
    Result := Falso;
end;


procedure Imprimir(Var pReport : TfrxReport);
begin
 if (GetKeyState(VK_SHIFT) <  0) then
   pReport.DesignReport
 else
   pReport.ShowReport(True);
end;

procedure AjustaTamanhoCampoGrid(pGrid : TJvDBUltimGrid);
Var
  i, Calc  : Integer;
begin

  for i := 0 to pGrid.Columns.Count - 1 do
  begin

    case pGrid.columns[i].Field.DataType of
      ftString:
      begin
        Calc := pGrid.columns[i].Field.Size * 8;

        if (Calc > length(pGrid.columns[i].FieldName) * 8) then
        begin
          if Calc in [1..200] then
            pGrid.columns[i].Width := Calc
          else if Calc > 400 then
            pGrid.columns[i].Width := 200
          else
            pGrid.columns[i].Width := Calc;
        end
        else
          pGrid.columns[i].Width := Length(pGrid.columns[i].FieldName) * 10;
      end;
      ftFMTBcd:
      begin
         if (pGrid.columns[i].Width > 100) then
         pGrid.columns[i].Width := 90;
      end;
      ftDate, ftTimeStamp:
      begin
        if (pGrid.columns[i].Width > 60) and ((Length(pGrid.columns[i].FieldName) * 8) < 60)then
          pGrid.columns[i].Width := 70
        else
          pGrid.columns[i].Width := Length(pGrid.columns[i].FieldName) * 8;

      end;
    end;

    {Ocultar colunas que são fields do masterdetail}
    if Pos('sqq',pGrid.columns[i].FieldName) > 0 then
    pGrid.columns[i].Visible := False;

    pGrid.columns[i].Title.Caption := StringReplace(UpperCase(Copy(pGrid.columns[i].FieldName, 1, 1)) +
                                                          LowerCase(Copy(pGrid.columns[i].FieldName, 2,
                                                          Length(pGrid.columns[i].FieldName))), '_', ' ', [rfReplaceAll]);
  end;
end;

Procedure SetaFoco(AControl : TWinControl);
begin
 AControl.SetFocus;
end;

Function GetValor(AConexao : TFDConnection; ACampo, ATabela : String; AAgregacao : String  = '' ; AWhere : String = '') : Variant;
Var
 vSQL : String;
begin

 if AAgregacao <> '' Then
  vSQL        := ' SELECT ' + AAgregacao + '(COALESCE(' + ACampo + ',0)) RETORNO FROM ' + ATabela + ' WHERE ' + AWhere
 else
  vSQL        := ' SELECT COALESCE(' + ACampo + ',0)RETORNO FROM ' + ATabela + ' WHERE ' + AWhere;

 Result       := AConexao.ExecSQLScalar(vSQL);

end;

Function GetStrValor(AConexao : TFDConnection; ACampo, ATabela : String; AAgregacao : String  = '' ; AWhere : String = '') : Variant;
Var
 vSQL : String;
begin

 if AAgregacao <> '' Then
  vSQL        := ' SELECT ' + AAgregacao + '(COALESCE(' + ACampo + ',''0'')) RETORNO FROM ' + ATabela + ' WHERE ' + AWhere
 else
  vSQL        := ' SELECT COALESCE(' + ACampo + ',''0'')RETORNO FROM ' + ATabela + ' WHERE ' + AWhere;

 Result       := AConexao.ExecSQLScalar(vSQL);

end;

Procedure MarcacaoCheckBox(ADataSet : TFDQuery ; AMarcacao : Boolean) ;
Var
 vRecNo : Integer;
begin
 With ADataSet do
 begin
  DisableControls;
  vRecNo := ADataSet.RecNo;
  First;
   while not Eof do
   begin
    Edit;
     FieldByName('SELECIONADO').AsString := iif(AMarcacao,'S','N');
    Post;
    Next;
   end;
  RecNo := vRecNo;
  EnableControls;
 end;
end;

function ConsultaSQL(ASQL : String ; AConnection : TFDConnection):TFDQuery;
Var
 Qry : TFDQuery;
begin
 Qry             := TFDQuery.Create(nil);
 Qry.Connection  := AConnection;
 Qry.SQL.Text    := ASQL;
 Try
  Qry.Open;
 except
  On e: exception do
  begin
   Qry.Free;
   raise Exception.Create('Erro: ' + e.message + ' ao tentar executar consultaSQL.');
  end;
 end;
 result := Qry;
end;

end.
