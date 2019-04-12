object DMmain: TDMmain
  OldCreateOrder = False
  Height = 337
  Width = 488
  object DB: TFDConnection
    Left = 32
    Top = 8
  end
  object Transacao: TFDTransaction
    Connection = DB
    Left = 32
    Top = 56
  end
  object WCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 104
  end
  object DriverPostGres: TFDPhysPgDriverLink
    Left = 32
    Top = 152
  end
  object QryEmpresa: TFDQuery
    CachedUpdates = True
    Connection = DB
    Left = 104
    Top = 8
  end
  object QryUsuario: TFDQuery
    CachedUpdates = True
    Connection = DB
    Left = 104
    Top = 56
  end
end
