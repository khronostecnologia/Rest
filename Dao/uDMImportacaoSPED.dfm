object DMImportacaoSPED: TDMImportacaoSPED
  OldCreateOrder = False
  Height = 304
  Width = 563
  object Qry0000: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "CADASTROS"."EMPRESAS"'
      'WHERE "ID" =:ID')
    Left = 32
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object Qry0000ID: TIntegerField
      FieldName = 'ID'
      Origin = '"ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Qry0000RAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"RAZAO_SOCIAL"'
      Size = 50
    end
    object Qry0000NOME_EMPRESARIAL: TWideStringField
      FieldName = 'NOME_EMPRESARIAL'
      Origin = '"NOME_EMPRESARIAL"'
      Size = 50
    end
    object Qry0000CPFCNPJ: TWideStringField
      FieldName = 'CPFCNPJ'
      Origin = '"CPFCNPJ"'
      Size = 18
    end
    object Qry0000RGIE: TWideStringField
      FieldName = 'RGIE'
      Origin = '"RGIE"'
    end
    object Qry0000ENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 100
    end
    object Qry0000NUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object Qry0000BAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 50
    end
    object Qry0000CEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object Qry0000IDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"IDCIDADE"'
    end
  end
  object Qry0200: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 64
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
