object DMCadNCM: TDMCadNCM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QryNCM: TFDQuery
    OnNewRecord = QryNCMNewRecord
    CachedUpdates = True
    Connection = DMBase.DB
    SQL.Strings = (
      'SELECT * FROM "NCM"'
      'WHERE "ID" =:CODIGO')
    Left = 32
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object QryNCMID: TIntegerField
      FieldName = 'ID'
    end
    object QryNCMNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object QryNCMMVA: TFloatField
      FieldName = 'MVA'
    end
  end
end
