object DmApuracaoICMSST: TDmApuracaoICMSST
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 136
  Width = 449
  object QryAnalise: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT '
      '   P."COD_ITEM",P."CODBARRA",P."DESCR_ITEM",'
      '   NF."DT_E_ES" AS "DATA_ENTRADA",'
      '   SUM(COALESCE(NP."QTDE",0)) AS "QTDE_ENTRADA",'
      '   SUM(NP."VL_BC_ICMS_ST") AS "BC_ICMS_ST_ENT",'
      '   SUM(NP."VL_ICMS_ST") AS "VL_ICMS_ST_ENT",'
      '   SUM((NP."VL_BC_ICMS_ST" / NP."QTDE")) VL_ICMS_ST_UNI_ENT,'
      '   V."DATA" AS "DATA_SAIDA",'
      '   SUM(VI."QTD") AS "QTDE_SAIDA",'
      '   SUM((VI."QTD" * VI."VL_ITEM")) AS "BC_ICMS_ST_SAI",'
      
        '   SUM(( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM")) AS TO' +
        'TAL_ICMS_SAIDA,'
      
        '   SUM( ( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALI' +
        'QUOTA PRATICA SAIDA*/ 14.00))) TOTAL_ICMS_ENTRADA,'
      '   SUM(( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") - '
      
        #9'( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA P' +
        'RATICA SAIDA*/ 14.00))'
      '   ))DIFERENCA,'
      
        '  (SUM(COALESCE(NP."QTDE",0)) - SUM(COALESCE(VI."QTD",0))) ESTOQ' +
        'UE_FINAL,'
      '  SUM( ('
      '    CASE '
      #9'   WHEN '
      #9'    ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") - '
      
        #9'( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA P' +
        'RATICA SAIDA*/ 14.00))'
      '      ) < 0 THEN'
      #9'    ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") - '
      
        #9'( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA P' +
        'RATICA SAIDA*/ 14.00))'
      '      )'
      #9'    ELSE'
      #9'     0'
      #9'   END'#9'   '
      '   ))SALDO_RESTITUIR,'
      '   '
      '   SUM(  ('
      '    CASE '
      #9'   WHEN '
      #9'    ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") - '
      
        #9'( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA P' +
        'RATICA SAIDA*/ 14.00))'
      '      ) > 0 THEN'
      #9'    ( ( /*ALIQUOTA PRATICA SAIDA*/ 14.00 * VI."VL_ITEM") - '
      
        #9'( (NP."VL_BC_ICMS_ST" / NP."QTDE") * (VI."QTD") * (/*ALIQUOTA P' +
        'RATICA SAIDA*/ 14.00))'
      '      )'
      #9'    ELSE'
      #9'     0'
      #9'   END'#9'   '
      '   )) SALDO_ARECOLHER'
      '   '
      'FROM "REGISTRO0200" P'
      'LEFT JOIN "REGISTROC170" NP ON NP."COD_ITEM" = P."COD_ITEM"'
      'LEFT JOIN "REGISTROC100" NF ON NF."ID" = NP."IDNF"'
      'LEFT JOIN "REGISTROC425" VI ON VI."COD_ITEM" = P."COD_ITEM"'
      'LEFT JOIN "REGISTROC400" V ON V."ID" = VI."ID_REDZ"'
      'WHERE P."ID_SPED" =:ID'
      
        'GROUP BY  P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES"' +
        ',V."DATA"'
      
        'ORDER BY P."COD_ITEM", P."CODBARRA",P."DESCR_ITEM",NF."DT_E_ES",' +
        'V."DATA"')
    Left = 24
    Top = 7
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object DsAnalise: TDataSource
    DataSet = QryAnalise
    Left = 24
    Top = 63
  end
end
