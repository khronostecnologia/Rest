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
    CachedUpdates = True
    Connection = DB
    SQL.Strings = (
      'SELECT * FROM "CADASTROS"."EMPRESAS"'
      'WHERE "ID" =:ID')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QryEmpresaID: TIntegerField
      FieldName = 'ID'
    end
    object QryEmpresaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"IDCIDADE"'
    end
    object QryEmpresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QryEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object QryEmpresaNOME_EMPRESARIAL: TStringField
      FieldName = 'NOME_EMPRESARIAL'
      Size = 50
    end
    object QryEmpresaCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 18
    end
    object QryEmpresaRGIE: TStringField
      FieldName = 'RGIE'
    end
  end
end
