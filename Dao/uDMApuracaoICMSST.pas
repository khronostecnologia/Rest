unit uDMApuracaoICMSST;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmApuracaoICMSST = class(TDataModule)
    QryAnalise: TFDQuery;
    DsAnalise: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FQry :TFDQuery;
  public
    { Public declarations }
    function GetAnalise(pCodPart , pMes , pAno : String ; pXML , pSPED : Boolean):Boolean;
    function GetContribuinte(pCNPJ : String):Boolean;
    function GetSQL88STES(pDatIni, pDatFin, pCNPJ: String): String;
    function GetQry : TFDQuery;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


Uses uDMBase,BiblKhronos;

{ TDmApuracaoICMSST }

procedure TDmApuracaoICMSST.DataModuleCreate(Sender: TObject);
begin
  FQry := TFDQuery.Create(nil);
end;

procedure TDmApuracaoICMSST.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FQry);
end;

function TDmApuracaoICMSST.GetAnalise(pCodPart , pMes , pAno : String ;
pXML , pSPED : Boolean):Boolean;
  function GetSQL : String;
  begin
    result :=    'SELECT * FROM (';
    if pSPED then
    begin
      result :=  result + #13 + 'SELECT * FROM (                                                                                   '+
                 'SELECT                                                                                                           '+
                 'P."COD_ITEM",P."CODBARRA",P."DESCR_ITEM",                                                                        '+
                 'NF."DT_E_ES" AS "DATA_ENTRADA",                                                                                  '+
                 'SUM(COALESCE(NP."QTDE",0)) AS "QTDE_ENTRADA",                                                                    '+
                 'SUM(NP."VL_BC_ICMS_ST") AS "BC_ICMS_ST_ENT",                                                                     '+
                 'SUM(NP."VL_ICMS_ST") AS "VL_ICMS_ST_ENT",                                                                        '+
                 'SUM((NP."VL_BC_ICMS_ST" / NP."QTDE")) VL_ICMS_ST_UNI_ENT,                                                        '+
                 'V."DATA" AS "DATA_SAIDA",                                                                                        '+
                 'SUM(VI."QTD") AS "QTDE_SAIDA",                                                                                   '+
                 'SUM((VI."QTD" * VI."VL_ITEM")) AS "BC_ICMS_ST_SAI",                                                              '+
                 'SUM(( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM")) AS TOTAL_ICMS_SAIDA,                                     '+
                 'SUM( ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))) TOTAL_ICMS_ENTRADA,  '+
                 'SUM(( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                                       '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                            '+
                 '))DIFERENCA,                                                                                                     '+
                 '(SUM(COALESCE(NP."QTDE",0)) - SUM(COALESCE(VI."QTD",0))) ESTOQUE_FINAL,                                          '+
                 'SUM( (                                                                                                  '+
                 ' CASE                                                                                                   '+
                 '  WHEN                                                                                                  '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                               '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                   '+
                 '   ) < 0 THEN                                                                                           '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                               '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                   '+
                 '   )                                                                                                    '+
                 '   ELSE                                                                                                 '+
                 '    0                                                                                                   '+
                 '  END                                                                                                   '+
                 ' ))SALDO_RESTITUIR,                                                                                     '+
                 '                                                                                                        '+
                 ' SUM(  (                                                                                                '+
                 '  CASE                                                                                                  '+
                 '  WHEN                                                                                                  '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                               '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                '+
                 '       ) > 0 THEN                                                                                       '+
                 '       ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                           '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                '+
                 '       )                                                                                                '+
                 '       ELSE                                                                                             '+
                 '        0                                                                                               '+
                 '      END                                                                                               '+
                 '    )) SALDO_ARECOLHER                                                                                  '+
                 '                                                                                                        '+
                 ' FROM "REGISTRO0200" P                                                                                  '+
                 ' LEFT JOIN "REGISTRO0000" C ON C."ID" = P."ID_SPED"                                                     '+
                 ' LEFT JOIN "REGISTROC170" NP ON NP."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC100" NF ON NF."ID" = NP."IDNF"                                                     '+
                 ' LEFT JOIN "REGISTROC425" VI ON VI."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC400" V ON V."ID" = VI."ID_REDZ"                                                    '+
                 ' WHERE C."MES" =:MES AND C."ANO" =:ANO AND C."CNPJ" = :CNPJ                                             '+
                 ' GROUP BY  P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES",V."DATA"                              '+
                 ' ORDER BY P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES",V."DATA" )A                            ';
    end;

    if pXML then
    begin
      if pSPED then
      result := Result + ' UNION ALL ';

      result := result + 'SELECT * FROM ( SELECT                                                               '+
                         '    NP."COD_ITEM",NP."COD_EAN",NP."DESCR_ITEM",                                      '+
                         '    NF."DT_E_ES" AS "DATA_ENTRADA",                                                  '+
                         '    SUM(COALESCE(NP."QTDE",0)) AS "QTDE_ENTRADA",                                    '+
                         '    SUM(NP."VL_BC_ICMS_ST") AS "BC_ICMS_ST_ENT",                                     '+
                         '    SUM(NP."VL_ICMS_ST") AS "VL_ICMS_ST_ENT",                                        '+
                         '    SUM((NP."VL_BC_ICMS_ST" / NP."QTDE")) VL_ICMS_ST_UNI_ENT,                        '+
                         '    NF."DT_E_ES" AS "DATA_SAIDA",                                                    '+
                         '    SUM(NP."QTDE" * 0) AS "QTDE_SAIDA",                                              '+
                         '    SUM(0) AS "BC_ICMS_ST_SAI",                                                      '+
                         '    SUM(0) AS TOTAL_ICMS_SAIDA,                                                      '+
                         '    SUM(NP."VL_ICMS_ST") TOTAL_ICMS_ENTRADA,                                         '+
                         '    SUM(NP."VL_ICMS_ST")DIFERENCA,                                                   '+
                         '    SUM(COALESCE(NP."QTDE",0)) ESTOQUE_FINAL,                                        '+
                         '    SUM(NP."VL_ICMS_ST")SALDO_RESTITUIR,                                             '+
                         '    0 SALDO_ARECOLHER                                                                '+
                         '    FROM "NF_ITENS" NP                                                               '+
                         '    LEFT JOIN "NF" NF ON NF."ID" = NP."IDNF"                                         '+
                         '    WHERE NF."MES" =:MES  AND NF."ANO" = :ANO AND NF."COD_EMP" =:CNPJ                '+
                         '    GROUP BY  NP."COD_ITEM", NP."COD_EAN",NP."DESCR_ITEM",NF."DT_E_ES"               '+
                         '    ORDER BY NP."COD_ITEM", NP."COD_EAN",NP."DESCR_ITEM",NF."DT_E_ES")B              ';

    end;

    result := result + #13 +
              ') X ----- where X."VL_ICMS_ST_ENT" > 0';
    CopyQuery(Result);
  end;
begin
  with QryAnalise do
  begin
    Close;
    SQL.Text := GetSQL;
    ParamByName('CNPJ').AsString  := pCodPart;
    ParamByName('MES').AsInteger  := pMes.ToInteger;
    ParamByName('ANO').AsInteger  := pAno.ToInteger;
    Open;
    result := not (IsEmpty);
  end;
end;

function TDmApuracaoICMSST.GetContribuinte(pCNPJ: String): Boolean;

  function GetSQL : String;
  begin
    result := 'SELECT * FROM "GET_CONTRIBUINTE" WHERE "CNPJ" = ' + pCNPJ.QuotedString;
  end;

begin
  with FQry do
  begin
    close;
    SQL.Text := GetSQL;
    CopyQuery(SQL.Text);
    Open;
  end;
  result := not (FQry.IsEmpty);
end;

function TDmApuracaoICMSST.GetQry: TFDQuery;
begin
  Result := FQry;
end;

function TDmApuracaoICMSST.GetSQL88STES(pDatIni, pDatFin, pCNPJ: String): String;
begin
  result  := ' SELECT I."COD_ITEM",'+
             ' CAST( '+
             '  ( (CASE WHEN N."IND_OPER" = ''E'' THEN SUM("QTDE") '+
             '  ELSE 0 END) - (CASE WHEN N."IND_OPER" = ''S'' '+
             '  THEN SUM("QTDE") ELSE 0 END)) AS NUMERIC(15,2) '+
             '    ) "QTDE", '+
             '  (CASE WHEN N."IND_OPER" = ''E'' THEN SUM(I."VL_ICMS_ST") '+
             '  ELSE 0 END) - (CASE WHEN N."IND_OPER" = ''S'' THEN '+
             '  SUM(I."VL_ICMS_ST") ELSE 0 END) "VL_ICMSST", '+
             '  (CASE WHEN N."IND_OPER" = ''E'' THEN SUM(I."VL_ICMS") '+
             '  ELSE 0 END) - (CASE WHEN N."IND_OPER" = ''S'' THEN '+
             '  SUM(I."VL_ICMS") ELSE 0 END) "VL_ICMS" '+
             '  FROM "NF_ITENS" I '+
             '  LEFT JOIN "NF" N ON N."ID" = I."IDNF" '+
             '  WHERE N."DT_E_ES" BETWEEN ' + pDatIni.QuotedString +
             '  AND ' + pDatFin.QuotedString +
             '  AND N."COD_EMP" = ' + pCNPJ.QuotedString +
             '  GROUP BY I."COD_ITEM",N."IND_OPER"  '+
             '  ORDER BY CAST("COD_ITEM" AS NUMERIC)';
end;

end.
