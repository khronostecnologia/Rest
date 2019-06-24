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
      'SELECT * FROM "GET_EMP_IMPORTADOS"'
      'WHERE "CODIGO" =:CODIGO')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
end
