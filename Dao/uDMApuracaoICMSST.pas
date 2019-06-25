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
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAnalise(pCodPart , pMes , pAno : String ; pXML , pSPED : Boolean):Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


Uses uDMBase;

{ TDmApuracaoICMSST }

function TDmApuracaoICMSST.GetAnalise(pCodPart , pMes , pAno : String ;
pXML , pSPED : Boolean):Boolean;
  function GetSQL : String;
  begin
    result :=    'SELECT * FROM (';
    if pXML then
    begin
      result :=  result + #13 +
                 'SELECT  '+
                 'P."COD_ITEM",P."CODBARRA",P."DESCR_ITEM", '+
                 'NF."DT_E_ES" AS "DATA_ENTRADA",            '+
                 'SUM(COALESCE(NP."QTDE",0)) AS "QTDE_ENTRADA", '+
                 'SUM(NP."VL_BC_ICMS_ST") AS "BC_ICMS_ST_ENT",  '+
                 'SUM(NP."VL_ICMS_ST") AS "VL_ICMS_ST_ENT",      '+
                 'SUM((NP."VL_BC_ICMS_ST" / NP."QTDE")) VL_ICMS_ST_UNI_ENT, '+
                 'V."DATA" AS "DATA_SAIDA",                            '+
                 'SUM(VI."QTD") AS "QTDE_SAIDA",                        '+
                 'SUM((VI."QTD" * VI."VL_ITEM")) AS "BC_ICMS_ST_SAI",   '+
                 'SUM(( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM")) AS TOTAL_ICMS_SAIDA,   '+
                 'SUM( ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))) TOTAL_ICMS_ENTRADA,  '+
                 'SUM(( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                                      '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                           '+
                 '))DIFERENCA,                                                                                                   '+
                 '(SUM(COALESCE(NP."QTDE",0)) - SUM(COALESCE(VI."QTD",0))) ESTOQUE_FINAL,                                       '+
                 'SUM( (                                                                                                        '+
                 ' CASE                                                                                                        '+
                 '  WHEN                                                                                                       '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                                   '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                       '+
                 '   ) < 0 THEN                                                                                               '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                                   '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                       '+
                 '   )                                                                                                       '+
                 '   ELSE                                                                                                    '+
                 '    0                                                                                                      '+
                 '  END                                                                                                      '+
                 ' ))SALDO_RESTITUIR,                                                                                       '+
                 '                                                                                                          '+
                 ' SUM(  (                                                                                                   '+
                 '  CASE                                                                                                     '+
                 '  WHEN                                                                                                     '+
                 '   ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                                  '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                  '+
                 '       ) > 0 THEN                                                                                         '+
                 '       ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") -                                             '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA PRATICA SAIDA*/ 14.00))                  '+
                 '       )                                                                                                '+
                 '       ELSE                                                                                              '+
                 '        0                                                                                                '+
                 '      END                                                                                                '+
                 '    )) SALDO_ARECOLHER                                                                                   '+
                 '                                                                                                        '+
                 ' FROM "REGISTRO0200" P                                                                                  '+
                 ' LEFT JOIN "REGISTRO0000" C ON C."ID" = P."ID_SPED"                                                     '+
                 ' LEFT JOIN "REGISTROC170" NP ON NP."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC100" NF ON NF."ID" = NP."IDNF"                                                     '+
                 ' LEFT JOIN "REGISTROC425" VI ON VI."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC400" V ON V."ID" = VI."ID_REDZ"                                                    '+
                 ' WHERE C."MES" =:MES AND C."ANO" =:ANO AND C."CNPJ" = :CNPJ                                             '+
                 ' GROUP BY  P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES",V."DATA"                              '+
                 ' ORDER BY P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES",V."DATA"  ';
    end;

    if pSPED then
    begin
      if pXML then
      result := Result + ' UNION ALL ';

      result := result + 'SELECT * FROM (                                                                      '+
                         ' SELECT                                                                              '+
                         '    NP."COD_ITEM",NP."COD_EAN",NP."DESCR_ITEM",                                      '+
                         '    NF."DT_E_ES" AS "DATA_ENTRADA",                                                  '+
                         '    SUM(COALESCE(NP."QTDE",0)) AS "QTDE_ENTRADA",                                    '+
                         '    SUM(NP."VL_BC_ICMS_ST") AS "BC_ICMS_ST_ENT",                                     '+
                         '    SUM(NP."VL_ICMS_ST") AS "VL_ICMS_ST_ENT",                                        '+
                         '    SUM((NP."VL_BC_ICMS_ST" / NP."QTDE")) VL_ICMS_ST_UNI_ENT,                        '+
                         '    0 AS "DATA_SAIDA",                                                               '+
                         '    0 AS "QTDE_SAIDA",                                                               '+
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
                         '    ORDER BY NP."COD_ITEM", NP."COD_EAN",NP."DESCR_ITEM",NF."DT_E_ES"                ';
    end;

    result := result + #13 +
              ') X where X."VL_ICMS_ST_ENT" > 0';
  end;
begin
  with QryAnalise do
  begin
    Close;
    ParamByName('CNPJ').AsString  := pCodPart;
    ParamByName('MES').AsString   := pMes;
    ParamByName('ANO').AsString   := pAno;
    Open;
    result := not (IsEmpty);
  end;
end;

end.
