object DMCadNCM: TDMCadNCM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QryNCM: TFDQuery
    OnNewRecord = QryNCMNewRecord
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "ncm"'
      'WHERE "id" =:CODIGO')
    Left = 32
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object QryNCMid: TIntegerField
      FieldName = 'id'
    end
    object QryNCMncm: TStringField
      FieldName = 'ncm'
      Size = 8
    end
    object QryNCMmva: TFloatField
      FieldName = 'mva'
    end
  end
end
