object DMCadContribuinte: TDMCadContribuinte
  OldCreateOrder = False
  Height = 229
  Width = 368
  object QryContribuinte: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "CONTRIBUINTE"')
    Left = 32
    Top = 16
    object QryContribuinteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryContribuinteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QryContribuinteIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object QryContribuinteNOME: TStringField
      FieldName = 'NOME'
      Size = 35
    end
    object QryContribuinteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 30
    end
    object QryContribuinteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QryContribuinteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 34
    end
    object QryContribuinteNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object QryContribuinteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 22
    end
    object QryContribuinteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 15
    end
    object QryContribuinteCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object QryContribuinteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 12
    end
  end
end
