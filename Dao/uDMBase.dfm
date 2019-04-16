object DMBase: TDMBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 249
  Width = 370
  object DB: TFDConnection
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = DB
    Left = 40
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 128
  end
  object QryEmpresa: TFDQuery
    Connection = DB
    SQL.Strings = (
      'SELECT * FROM "CADASTROS"."EMPRESAS"'
      'WHERE ID =:ID')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QryEmpresaID: TIntegerField
      FieldName = 'ID'
      Origin = '"ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryEmpresaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"RAZAO_SOCIAL"'
      Size = 50
    end
    object QryEmpresaNOME_EMPRESARIAL: TWideStringField
      FieldName = 'NOME_EMPRESARIAL'
      Origin = '"NOME_EMPRESARIAL"'
      Size = 50
    end
    object QryEmpresaRGIE: TWideStringField
      FieldName = 'RGIE'
      Origin = '"RGIE"'
    end
    object QryEmpresaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 100
    end
    object QryEmpresaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 50
    end
    object QryEmpresaCEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object QryEmpresaCPFCNPJ: TWideStringField
      FieldName = 'CPFCNPJ'
      Origin = '"CPFCNPJ"'
      Size = 18
    end
    object QryEmpresaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object QryEmpresaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"IDCIDADE"'
    end
  end
end
