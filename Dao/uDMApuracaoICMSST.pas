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
    FQry     : TFDQuery;
    FQryTemp : TFDMemTable;
    vSefSQL  : String;
  public
    { Public declarations }
    function GetAnalise(pCodPart , pMes , pAno : String ; pXML , pSPED : Boolean):Boolean;
    function GetContribuinte(pCNPJ : String):Boolean;
    function GetSQL88STES(pDatIni, pDatFin, pCNPJ: String): String;
    function GetSQL88STITNF(pDatIni, pDatFin, pCNPJ: String): String;
    function GetQry : TFDQuery;
    function GetQryTemp : TFDMemTable;
    function GetSEF(pDatIni, pDatFin, pCNPJ : String) : String;

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


Uses uDMBase,BiblKhronos, uApuracaoICMSST;

{ TDmApuracaoICMSST }

procedure TDmApuracaoICMSST.DataModuleCreate(Sender: TObject);
begin
  FQry                    := TFDQuery.Create(nil);
  FQry.Connection         := dmPrincipal.BancoExec;
  FQryTemp                := TFDMemTable.Create(nil);
  FQryTemp.CachedUpdates  := true;
end;

procedure TDmApuracaoICMSST.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FQry);
  FreeAndNil(FQryTemp);
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
                 'SUM((P."ALIQ_ICMS" * VI."VL_ITEM")) AS TOTAL_ICMS_SAIDA,                                                         '+
                 'SUM( ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))) TOTAL_ICMS_ENTRADA,                     '+
                 'SUM(( (P."ALIQ_ICMS" * VI."VL_ITEM") -                                                                           '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))                                                '+
                 '))DIFERENCA,                                                                                                     '+
                 '(SUM(COALESCE(NP."QTDE",0)) - SUM(COALESCE(VI."QTD",0))) ESTOQUE_FINAL,                                          '+
                 'SUM( (                                                                                                           '+
                 ' CASE                                                                                                            '+
                 '  WHEN                                                                                                           '+
                 '   ( (P."ALIQ_ICMS" * VI."VL_ITEM") -                                                                            '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))                                               '+
                 '   ) < 0 THEN                                                                                                    '+
                 '   ( (P."ALIQ_ICMS"  * VI."VL_ITEM") -                                                                           '+
                 '( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))                                               '+
                 '   )                                                                                                             '+
                 '   ELSE                                                                                                 '+
                 '    0                                                                                                   '+
                 '  END                                                                                                   '+
                 ' ))SALDO_RESTITUIR,                                                                                     '+
                 '                                                                                                        '+
                 ' SUM(  (                                                                                                '+
                 '  CASE                                                                                                  '+
                 '  WHEN                                                                                                  '+
                 '   ( (P."ALIQ_ICMS" * VI."VL_ITEM") -                                                                   '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))                                   '+
                 '       ) > 0 THEN                                                                                       '+
                 '       ( (P."ALIQ_ICMS" * VI."VL_ITEM") -                                                               '+
                 '   ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (P."ALIQ_ICMS"))                                   '+
                 '       )                                                                                                '+
                 '       ELSE                                                                                             '+
                 '        0                                                                                               '+
                 '      END                                                                                               '+
                 '    )) SALDO_ACOMPLEMENTAR                                                                              '+
                 '                                                                                                        '+
                 ' FROM "REGISTRO0200" P                                                                                  '+
                 ' LEFT JOIN "REGISTRO0000" C ON C."ID" = P."ID_SPED"                                                     '+
                 ' LEFT JOIN "REGISTROC170" NP ON NP."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC100" NF ON NF."ID" = NP."IDNF"                                                     '+
                 ' LEFT JOIN "REGISTROC425" VI ON VI."COD_ITEM" = P."COD_ITEM"                                            '+
                 ' LEFT JOIN "REGISTROC400" V ON V."ID" = VI."ID_REDZ"                                                    '+
                 ' LEFT JOIN "NCM" NC ON P."COD_NCM" = NC."NCM"                                                           '+
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
                         '   SUM( (                                                                            '+
                         '    CASE                                                                             '+
                         '     WHEN                                                                            '+
                         '      ( (NP."VL_BC_ICMS_ST")                                                         '+
                         '      ) > 0 AND (NP."QTDE") > 0 THEN                                                 '+
                         '      ((NP."VL_BC_ICMS_ST" / NP."QTDE")                                              '+
                         '      )                                                                              '+
                         '      ELSE                                                                           '+
                         '       0                                                                             '+
                         '     END                                                                             '+
                         '    ))VL_ICMS_ST_UNI_ENT,                                                            '+
                         '    NF."DT_E_ES" AS "DATA_SAIDA",                                                    '+
                         '    SUM(NP."QTDE" * 0) AS "QTDE_SAIDA",                                              '+
                         '    SUM(0) AS "BC_ICMS_ST_SAI",                                                      '+
                         '    SUM(0) AS "TOTAL_ICMS_SAIDA",                                                    '+
                         '    SUM(NP."VL_ICMS_ST") "TOTAL_ICMS_ENTRADA",                                       '+
                         '    SUM((CASE                                                                        '+
                         '            WHEN ((NP."VL_BC_ICMS_ST")) > 0                                          '+
                         '             AND (NP."QTDE") > 0 THEN (NP."VL_BC_ICMS_ST" / NP."QTDE") - NP."VL_ITEM"'+
                         '         ELSE 0                                                                      '+
                         '         END))AS DIFERENCA,                                                          '+
                         '     SUM(COALESCE(NP."QTDE",0)) "ESTOQUE_FINAL",                                     '+
                         '  SUM((CASE                                                                          '+
                         '          WHEN ((NP."VL_BC_ICMS_ST")) > 0                                            '+
                         '           AND (NP."QTDE") > 0                                                       '+
                         '             THEN CASE                                                               '+
                         '                     WHEN (NP."VL_BC_ICMS_ST" / NP."QTDE") - NP."VL_ITEM" < 0 THEN ((NP."VL_BC_ICMS_ST" / NP."QTDE") - NP."VL_ITEM") * NP."ALIQ_ICMS" '+
                         '          ELSE 0                                                                     '+
                         '          END                                                                        '+
                         '   ELSE 0                                                                            '+
                         '   END)) SALDO_ACOMPLEMENTAR,                                                        '+
                         '  SUM((CASE                                                                          '+
                         '          WHEN ((NP."VL_BC_ICMS_ST")) > 0                                            '+
                         '           AND (NP."QTDE") > 0                                                       '+
                         '             THEN CASE                                                               '+
                         '                     WHEN (NP."VL_BC_ICMS_ST" / NP."QTDE") - NP."VL_ITEM" > 0 THEN ((NP."VL_BC_ICMS_ST" / NP."QTDE") - NP."VL_ITEM") * NP."ALIQ_ICMS" '+
                         '          ELSE 0                                                                     '+
                         '          END                                                                        '+
                         '   ELSE 0                                                                            '+
                         '   END)) SALDO_RESTITUIR                                                             '+
                         '    FROM "NF_ITENS" NP                                                               '+
                         '    LEFT JOIN "NF" NF ON NF."ID" = NP."IDNF"                                         '+
                         '    LEFT JOIN "NCM" NC ON NP."NCM" = NC."NCM"                                        '+
                         '    WHERE NF."MES" =:MES  AND NF."ANO" = :ANO AND NF."COD_EMP" =:CNPJ                '+
                         '    GROUP BY  NP."COD_ITEM", NP."COD_EAN",NP."DESCR_ITEM",NF."DT_E_ES",NP."VL_ITEM"  '+
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
  vSefSQL := GetSQL;
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

function TDmApuracaoICMSST.GetQryTemp: TFDMemTable;
begin
  result := FQryTemp;
end;

function TDmApuracaoICMSST.GetSEF(pDatIni, pDatFin, pCNPJ: String): String;
begin
   Result := ' SELECT *, ' +
             ' I."NCM", ' +
             ' I."COD_EAN", '+
             ' I."UNID", ' +
             ' I."P_MVA_ST", ' +
             ' I."P_RED_BC_ST" FROM "REGISTROC170" R ' +
             ' LEFT JOIN "NF" N ON R."IDNF" = N."ID" ' +
             ' LEFT JOIN "NF_ITENS" I ON R."IDNF" = I."ID" ' +
             // ' LEFT JOIN "NCM" NC ON NC."NCM" = I."NCM" ' +
             ' WHERE N."DT_E_ES" BETWEEN ' + pDatIni.QuotedString +
             ' AND ' + pDatFin.QuotedString +
             ' AND N."COD_EMP" = ' + pCNPJ.QuotedString;
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

function TDmApuracaoICMSST.GetSQL88STITNF(pDatIni, pDatFin,
  pCNPJ: String): String;
begin
  result := ' SELECT '+
            ' N."COD_PART", '+
            ' N."COD_MOD", '+
            ' N."SER", '+
            ' N."NUM_DOC", '+
            ' I."CFOP", '+
            ' COALESCE(I."CST",I."CSOSN")"CST", '+
            ' I."NUM_ITEM", '+
            ' N."DT_E_ES", '+
            ' I."COD_ITEM",  '+
            ' I."QTDE", '+
            ' I."VL_ITEM", '+
            ' I."VL_DESC", '+
            ' I."VL_BC_ICMS", '+
            ' I."VL_BC_ICMS_ST", '+
            ' I."ALIQ_ST", '+
            ' I."ALIQ_ICMS", '+
            ' I."VL_IPI", '+
            ' N."CHV_NFE"  '+
            ' FROM "NF_ITENS" I  '+
            ' LEFT JOIN "NF" N ON N."ID" = I."IDNF" '+
            ' WHERE I."VL_BC_ICMS_ST" > 0 '+
            ' AND N."DT_E_ES" BETWEEN ' + pDatIni.QuotedString +
            ' AND ' + pDatFin.QuotedString +
            ' AND N."COD_EMP" = ' + pCNPJ.QuotedString +
            ' ORDER BY N."CHV_NFE",I."NUM_ITEM" ';
end;

end.
