object DMImportacaoSPED: TDMImportacaoSPED
  OldCreateOrder = False
  Height = 300
  Width = 284
  object Qry0000: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "CADASTROS"."REGISTRO0000_"')
    Left = 32
    Top = 14
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
  end
  object Qry0200: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
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
  end
  object QryC100e: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 126
    object QryC100eID_SPED: TIntegerField
      FieldName = 'ID_SPED'
    end
    object QryC100eIND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object QryC100eCOD_PART: TStringField
      FieldName = 'COD_PART'
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
    end
    object QryC100eVL_MERC: TFloatField
      FieldName = 'VL_MERC'
    end
    object QryC100eVL_DESC: TFloatField
      FieldName = 'VL_DESC'
    end
    object QryC100eVL_FRT: TFloatField
      FieldName = 'VL_FRT'
    end
    object QryC100eVL_SEG: TFloatField
      FieldName = 'VL_SEG'
    end
    object QryC100eVL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
    end
    object QryC100eVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object QryC100eVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QryC100eVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QryC100eVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object QryC100eVL_BC_IPI: TFloatField
      FieldName = 'VL_BC_IPI'
    end
    object QryC100eVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QryC100eVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object QryC100eVL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QryC100eVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object QryC100eVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QryC170e: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 96
    Top = 126
    object QryC170eID_SPED: TIntegerField
      FieldName = 'ID_SPED'
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
    end
    object QryC170eVL_DESC: TFloatField
      FieldName = 'VL_DESC'
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
    end
    object QryC170eALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryC170eVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object QryC170eVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object QryC170eALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QryC170eVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
  end
  object QryC400: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 238
  end
  object QryC470: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 96
    Top = 238
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
    Top = 126
  end
  object DsC170e: TDataSource
    DataSet = QryC170e
    Left = 224
    Top = 126
  end
  object DsC100s: TDataSource
    Left = 160
    Top = 182
  end
  object DsC170s: TDataSource
    Left = 224
    Top = 182
  end
  object DsC400: TDataSource
    DataSet = QryC400
    Left = 160
    Top = 238
  end
  object DsC470: TDataSource
    DataSet = QryC470
    Left = 224
    Top = 238
  end
  object QryC100s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 182
    object IntegerField1: TIntegerField
      FieldName = 'ID_SPED'
    end
    object StringField1: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'COD_PART'
    end
    object StringField3: TStringField
      FieldName = 'COD_MOD'
      Size = 5
    end
    object StringField4: TStringField
      FieldName = 'SER'
      Size = 5
    end
    object StringField5: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object StringField6: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_E_ES'
    end
    object FloatField1: TFloatField
      FieldName = 'VL_DOC'
    end
    object FloatField2: TFloatField
      FieldName = 'VL_MERC'
    end
    object FloatField3: TFloatField
      FieldName = 'VL_DESC'
    end
    object FloatField4: TFloatField
      FieldName = 'VL_FRT'
    end
    object FloatField5: TFloatField
      FieldName = 'VL_SEG'
    end
    object FloatField6: TFloatField
      FieldName = 'VL_OUT_DA'
    end
    object FloatField7: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object FloatField8: TFloatField
      FieldName = 'VL_ICMS'
    end
    object FloatField9: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object FloatField10: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
    object FloatField11: TFloatField
      FieldName = 'VL_BC_IPI'
    end
    object FloatField12: TFloatField
      FieldName = 'VL_IPI'
    end
    object FloatField13: TFloatField
      FieldName = 'VL_BC_PIS'
    end
    object FloatField14: TFloatField
      FieldName = 'VL_PIS'
    end
    object FloatField15: TFloatField
      FieldName = 'VL_BC_COFINS'
    end
    object FloatField16: TFloatField
      FieldName = 'VL_COFINS'
    end
  end
  object QryC170s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 96
    Top = 182
    object IntegerField2: TIntegerField
      FieldName = 'ID_SPED'
    end
    object StringField7: TStringField
      FieldName = 'NUM_ITEM'
      Size = 5
    end
    object StringField8: TStringField
      FieldName = 'COD_ITEM'
      Size = 14
    end
    object FloatField17: TFloatField
      FieldName = 'QTDE'
    end
    object StringField9: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object FloatField18: TFloatField
      FieldName = 'VL_ITEM'
    end
    object FloatField19: TFloatField
      FieldName = 'VL_DESC'
    end
    object StringField10: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object FloatField20: TFloatField
      FieldName = 'VL_BC_ICMS'
    end
    object FloatField21: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object FloatField22: TFloatField
      FieldName = 'VL_ICMS'
    end
    object FloatField23: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
    end
    object FloatField24: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object FloatField25: TFloatField
      FieldName = 'VL_ICMS_ST'
    end
  end
end
