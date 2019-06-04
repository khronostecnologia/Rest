unit uArquivo;

interface

Uses System.Classes,SysUtils;

type

  TArquivo = class
  protected
    class var FLista : TStringList;
    class var F      : TSearchRec;
  Public
    class function Listar(pNomeDiretorio : String) : Boolean;Virtual;Abstract;
    class function GetListaXML : TStringList;Virtual;Abstract;
  end;

  TXML = class(TArquivo)
    class function Listar(pNomeDiretorio : String) : Boolean;Override;
    class function GetListaXML(Var opLista : TStringList) :Boolean;
  end;

implementation

{TXML}

class function TXML.Listar(pNomeDiretorio : String) : Boolean;
begin
  FLista := TStringList.Create;

  if FindFirst(pNomeDiretorio + '\*.xml', faAnyFile, F) = 0 then
  Repeat
    FLista.Add(F.Name);
  Until FindNext(F) <> 0;

  FindClose(F);
end;

class function TXML.GetListaXML(Var opLista : TStringList) :Boolean;
begin
  opLista := FLista;
  result  := (opLista <> nil);
end;

end.
