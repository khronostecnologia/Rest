unit uLog;

interface

Uses System.SysUtils,Vcl.Forms;

Type
  TLog = class
    class procedure Gravar(pDirLog ,pNomeArquivoLog ,pTextoLog : String);
  end;

implementation

{ TLog }

class procedure TLog.Gravar(pDirLog, pNomeArquivoLog, pTextoLog: String);
var
  vArquivo : TextFile;
  vNomeArq : String;
begin
  vNomeArq  := ChangeFileExt(pDirLog + '\',pNomeArquivoLog + '.txt');
  AssignFile(vArquivo,vNomeArq);
  if FileExists(vNomeArq) then
    Append(vArquivo)
  else
    ReWrite(vArquivo);
  try
    WriteLn(vArquivo, DateTimeToStr(Now) + ':' + pTextoLog);
    WriteLn(vArquivo, '----------------------------------------------------------------------');
  finally
    CloseFile(vArquivo)
  end;

end;

end.
