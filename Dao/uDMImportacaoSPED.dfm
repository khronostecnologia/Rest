object DMImportacaoSPED: TDMImportacaoSPED
  OldCreateOrder = False
  Height = 348
  Width = 388
  object Qry0000: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    SQL.Strings = (
      'SELECT * FROM "REGISTRO0000"')
    Left = 32
    Top = 14
    object Qry0000ID: TAutoIncField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Qry0000DT_INI: TDateTimeField
      FieldName = 'DT_INI'
    end
    object Qry0000DT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
    end
    object Qry0000COD_MUN: TIntegerField
      FieldName = 'COD_MUN'
    end
    object Qry0000COD_FIN: TStringField
      FieldName = 'COD_FIN'
    end
    object Qry0000NOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object Qry0000CNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object Qry0000CPF: TStringField
      FieldName = 'CPF'
    end
    object Qry0000UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object Qry0000IE: TStringField
      FieldName = 'IE'
    end
    object Qry0000IND_PERFIL: TStringField
      FieldName = 'IND_PERFIL'
      Size = 30
    end
    object Qry0000IND_ATIV: TStringField
      FieldName = 'IND_ATIV'
      Size = 30
    end
    object Qry0000MES: TIntegerField
      FieldName = 'MES'
    end
    object Qry0000ANO: TIntegerField
      FieldName = 'ANO'
    end
  end
  object Qry0200: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTRO0200"')
    Left = 32
    Top = 70
    object Qry0200COD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 30
    end
    object Qry0200DESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 100
    end
    object Qry0200CODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 14
    end
    object Qry0200UNID: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object Qry0200TIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 50
    end
    object Qry0200COD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 15
    end
    object Qry0200ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object Qry0200CEST: TStringField
      FieldName = 'CEST'
      Size = 15
    end
    object Qry0200ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
    end
    object Qry0200ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
  end
  object QryC400: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC400"')
    Left = 32
    Top = 286
    object QryC400ID: TIntegerField
      FieldName = 'ID'
    end
    object QryC400ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC400DATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QryC400ECF_FAB: TStringField
      FieldName = 'ECF_FAB'
      Size = 21
    end
  end
  object QryC425: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 96
    Top = 286
    object QryC425ID: TIntegerField
      FieldName = 'ID'
    end
    object QryC425ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC425ID_REDZ: TIntegerField
      FieldName = 'ID_REDZ'
    end
    object QryC425COD_TOT_PAR: TStringField
      FieldName = 'COD_TOT_PAR'
      Size = 7
    end
    object QryC425COD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 30
    end
    object QryC425DESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 100
    end
    object QryC425QTD: TFloatField
      FieldName = 'QTD'
    end
    object QryC425VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
  end
  object Ds0000: TDataSource
    DataSet = Qry0000
    Left = 96
    Top = 14
  end
  object Ds0200: TDataSource
    DataSet = Qry0200
    Left = 96
    Top = 70
  end
  object DsC100e: TDataSource
    DataSet = QryC100e
    Left = 160
    Top = 174
  end
  object DsC170e: TDataSource
    DataSet = QryC170e
    Left = 224
    Top = 174
  end
  object DsC400: TDataSource
    DataSet = QryC400
    Left = 224
    Top = 286
  end
  object DsC425: TDataSource
    DataSet = QryC425
    Left = 280
    Top = 286
  end
  object QryC100e: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC100"')
    Left = 32
    Top = 174
    object QryC100eID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC100eIND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object QryC100eCOD_PART: TStringField
      FieldName = 'COD_PART'
      Size = 50
    end
    object QryC100eCOD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 5
    end
    object QryC100eSER: TStringField
      FieldName = 'SER'
      Size = 5
    end
    object QryC100eNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object QryC100eCHV_NFE: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object QryC100eDT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QryC100eDT_E_ES: TDateTimeField
      FieldName = 'DT_E_ES'
    end
    object QryC100eVL_DOC: TFloatField
      FieldName = 'VL_DOC'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_MERC: TFloatField
      FieldName = 'VL_MERC'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_FRT: TFloatField
      FieldName = 'VL_FRT'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_SEG: TFloatField
      FieldName = 'VL_SEG'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_BC_IPI: TFloatField
      FieldName = 'VL_BC_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100eVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100ePARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 100
    end
    object QryC100eID: TIntegerField
      FieldName = 'ID'
    end
    object QryC100eCOD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 50
    end
  end
  object QryC170e: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC170"')
    Left = 96
    Top = 174
    object QryC170eID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC170eIDNF: TIntegerField
      FieldName = 'IDNF'
    end
    object QryC170eNUM_ITEM: TStringField
      FieldName = 'NUM_ITEM'
      Size = 5
    end
    object QryC170eCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 14
    end
    object QryC170eQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QryC170eUNID: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object QryC170eVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object QryC170eVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC170eCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryC170eCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryC170eVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170eALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryC170eVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170eVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170eALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QryC170eVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170eID: TIntegerField
      FieldName = 'ID'
    end
    object QryC170eDESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 50
    end
  end
  object DsC100s: TDataSource
    DataSet = QryC100s
    Left = 160
    Top = 230
  end
  object DsC170s: TDataSource
    DataSet = QryC170s
    Left = 224
    Top = 230
  end
  object QryC100s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC100"')
    Left = 32
    Top = 230
    object QryC100sIND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object QryC100sCOD_PART: TStringField
      FieldName = 'COD_PART'
      Size = 50
    end
    object QryC100sCOD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 5
    end
    object QryC100sSER: TStringField
      FieldName = 'SER'
      Size = 5
    end
    object QryC100sNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object QryC100sCHV_NFE: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object QryC100sDT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QryC100sDT_E_ES: TDateTimeField
      FieldName = 'DT_E_ES'
    end
    object QryC100sVL_DOC: TFloatField
      FieldName = 'VL_DOC'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_MERC: TFloatField
      FieldName = 'VL_MERC'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_FRT: TFloatField
      FieldName = 'VL_FRT'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_SEG: TFloatField
      FieldName = 'VL_SEG'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_BC_IPI: TFloatField
      FieldName = 'VL_BC_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100sVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100sPARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 100
    end
    object QryC100sCOD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 50
    end
    object QryC100sID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC100sID: TIntegerField
      FieldName = 'ID'
    end
  end
  object QryC170s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC170"')
    Left = 96
    Top = 230
    object QryC170sID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC170sIDNF: TIntegerField
      FieldName = 'IDNF'
    end
    object QryC170sNUM_ITEM: TStringField
      FieldName = 'NUM_ITEM'
      Size = 5
    end
    object QryC170sCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 14
    end
    object QryC170sQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QryC170sUNID: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object QryC170sVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object QryC170sVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC170sCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryC170sCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryC170sVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170sALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryC170sVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170sVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170sALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QryC170sVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170sID: TIntegerField
      FieldName = 'ID'
    end
    object QryC170sDESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 50
    end
  end
  object DsC100: TDataSource
    DataSet = QryC100
    Left = 160
    Top = 126
  end
  object DsC170: TDataSource
    DataSet = QryC170
    Left = 224
    Top = 126
  end
  object QryC100: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC100"')
    Left = 32
    Top = 126
    object QryC100ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC100IND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object QryC100COD_PART: TStringField
      FieldName = 'COD_PART'
      Size = 50
    end
    object QryC100COD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 5
    end
    object QryC100SER: TStringField
      FieldName = 'SER'
      Size = 5
    end
    object QryC100NUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object QryC100CHV_NFE: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object QryC100DT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QryC100DT_E_ES: TDateTimeField
      FieldName = 'DT_E_ES'
    end
    object QryC100VL_DOC: TFloatField
      FieldName = 'VL_DOC'
      DisplayFormat = '0.00'
    end
    object QryC100VL_MERC: TFloatField
      FieldName = 'VL_MERC'
      DisplayFormat = '0.00'
    end
    object QryC100VL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC100VL_FRT: TFloatField
      FieldName = 'VL_FRT'
      DisplayFormat = '0.00'
    end
    object QryC100VL_SEG: TFloatField
      FieldName = 'VL_SEG'
      DisplayFormat = '0.00'
    end
    object QryC100VL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
      DisplayFormat = '0.00'
    end
    object QryC100VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC100VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC100VL_BC_IPI: TFloatField
      FieldName = 'VL_BC_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100VL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0.00'
    end
    object QryC100VL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100VL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '0.00'
    end
    object QryC100VL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '0.00'
    end
    object QryC100PARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 100
    end
    object QryC100ID: TIntegerField
      FieldName = 'ID'
    end
    object QryC100COD_SIT: TStringField
      FieldName = 'COD_SIT'
      Size = 50
    end
  end
  object QryC170: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC170"')
    Left = 96
    Top = 126
    object QryC170ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC170IDNF: TIntegerField
      FieldName = 'IDNF'
    end
    object QryC170NUM_ITEM: TStringField
      FieldName = 'NUM_ITEM'
      Size = 5
    end
    object QryC170COD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 14
    end
    object QryC170QTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QryC170UNID: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object QryC170VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object QryC170VL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryC170CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryC170CFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryC170VL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryC170VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryC170VL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170ALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QryC170VL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryC170ID: TIntegerField
      FieldName = 'ID'
    end
    object QryC170DESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 50
    end
  end
  object QryC470: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "REGISTROC400"')
    Left = 160
    Top = 286
    object QryC470ID: TIntegerField
      FieldName = 'ID'
    end
    object QryC470ID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC470ID_REDZ: TIntegerField
      FieldName = 'ID_REDZ'
    end
    object QryC470COD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 30
    end
    object QryC470DESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 100
    end
    object QryC470QTD: TFloatField
      FieldName = 'QTD'
    end
    object QryC470QTD_CANC: TFloatField
      FieldName = 'QTD_CANC'
    end
    object QryC470UNID: TStringField
      FieldName = 'UNID'
      Size = 6
    end
    object QryC470VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object QryC470CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryC470CFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryC470ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryC470VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QryC470VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object DsC470: TDataSource
    DataSet = QryC470
    Left = 328
    Top = 286
  end
end
