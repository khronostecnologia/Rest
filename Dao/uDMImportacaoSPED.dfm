object DMImportacaoSPED: TDMImportacaoSPED
  OldCreateOrder = False
  Height = 412
  Width = 682
  object Qry0000: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "CADASTROS"."REGISTRO0000_"')
    Left = 32
    Top = 8
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
    Top = 64
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
    Top = 120
  end
  object QryC100s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 176
  end
  object QryC170s: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 104
    Top = 176
  end
  object QryC170e: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 96
    Top = 120
  end
  object QryC400: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 232
  end
  object QryC470: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 104
    Top = 232
  end
  object Ds0000: TDataSource
    DataSet = Qry0000
    Left = 96
    Top = 8
  end
  object Ds0200: TDataSource
    DataSet = Qry0200
    Left = 96
    Top = 64
  end
  object DsC100e: TDataSource
    DataSet = QryC100e
    Left = 160
    Top = 120
  end
  object DsC170e: TDataSource
    DataSet = QryC170e
    Left = 224
    Top = 120
  end
  object DsC100s: TDataSource
    DataSet = QryC100s
    Left = 160
    Top = 176
  end
  object DsC170s: TDataSource
    DataSet = QryC170s
    Left = 224
    Top = 176
  end
  object DsC400: TDataSource
    DataSet = QryC400
    Left = 160
    Top = 232
  end
  object DsC470: TDataSource
    DataSet = QryC470
    Left = 224
    Top = 232
  end
end
