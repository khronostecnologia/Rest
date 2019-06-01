object DMImportacaoXML: TDMImportacaoXML
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 370
  object QryNF: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 8
    object QryNFIND_OPER: TStringField
      FieldName = 'IND_OPER'
      Size = 50
    end
    object QryNFCOD_PART: TStringField
      FieldName = 'COD_PART'
      Size = 50
    end
    object QryNFCOD_MOD: TStringField
      FieldName = 'COD_MOD'
      Size = 5
    end
    object QryNFSER: TStringField
      FieldName = 'SER'
      Size = 5
    end
    object QryNFNUM_DOC: TStringField
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object QryNFCHV_NFE: TStringField
      FieldName = 'CHV_NFE'
      Size = 44
    end
    object QryNFDT_DOC: TDateTimeField
      FieldName = 'DT_DOC'
    end
    object QryNFDT_E_ES: TDateTimeField
      FieldName = 'DT_E_ES'
    end
    object QryNFVL_DOC: TFloatField
      FieldName = 'VL_DOC'
      DisplayFormat = '0.00'
    end
    object QryNFVL_MERC: TFloatField
      FieldName = 'VL_MERC'
      DisplayFormat = '0.00'
    end
    object QryNFVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryNFVL_FRT: TFloatField
      FieldName = 'VL_FRT'
      DisplayFormat = '0.00'
    end
    object QryNFVL_SEG: TFloatField
      FieldName = 'VL_SEG'
      DisplayFormat = '0.00'
    end
    object QryNFVL_OUT_DA: TFloatField
      FieldName = 'VL_OUT_DA'
      DisplayFormat = '0.00'
    end
    object QryNFVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryNFVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryNFVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryNFVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryNFVL_BC_IPI: TFloatField
      FieldName = 'VL_BC_IPI'
      DisplayFormat = '0.00'
    end
    object QryNFVL_IPI: TFloatField
      FieldName = 'VL_IPI'
      DisplayFormat = '0.00'
    end
    object QryNFVL_BC_PIS: TFloatField
      FieldName = 'VL_BC_PIS'
      DisplayFormat = '0.00'
    end
    object QryNFVL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '0.00'
    end
    object QryNFVL_BC_COFINS: TFloatField
      FieldName = 'VL_BC_COFINS'
      DisplayFormat = '0.00'
    end
    object QryNFVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '0.00'
    end
    object QryNFPARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 100
    end
    object QryNFID: TIntegerField
      FieldName = 'ID'
    end
  end
  object QryItensNF: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 32
    Top = 64
    object QryItensNFIDNF: TIntegerField
      FieldName = 'IDNF'
    end
    object QryItensNFNUM_ITEM: TStringField
      FieldName = 'NUM_ITEM'
      Size = 5
    end
    object QryItensNFCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Size = 14
    end
    object QryItensNFQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QryItensNFUNID: TStringField
      FieldName = 'UNID'
      Size = 5
    end
    object QryItensNFVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      DisplayFormat = '0.00'
    end
    object QryItensNFVL_DESC: TFloatField
      FieldName = 'VL_DESC'
      DisplayFormat = '0.00'
    end
    object QryItensNFCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 3
    end
    object QryItensNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object QryItensNFVL_BC_ICMS: TFloatField
      FieldName = 'VL_BC_ICMS'
      DisplayFormat = '0.00'
    end
    object QryItensNFALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object QryItensNFVL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      DisplayFormat = '0.00'
    end
    object QryItensNFVL_BC_ICMS_ST: TFloatField
      FieldName = 'VL_BC_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryItensNFALIQ_ST: TFloatField
      FieldName = 'ALIQ_ST'
    end
    object QryItensNFVL_ICMS_ST: TFloatField
      FieldName = 'VL_ICMS_ST'
      DisplayFormat = '0.00'
    end
    object QryItensNFID: TIntegerField
      FieldName = 'ID'
    end
    object QryItensNFDESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Size = 50
    end
    object QryItensNFCOD_EAN: TStringField
      FieldName = 'COD_EAN'
      Size = 13
    end
    object QryItensNFNCM: TStringField
      FieldName = 'NCM'
      Size = 30
    end
    object QryItensNFCEST: TStringField
      FieldName = 'CEST'
      Size = 30
    end
    object QryItensNFVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object QryItensNFVL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object QryItensNFVL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object QryItensNFVL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object QryItensNFVL_OUTRAS_DESP: TFloatField
      FieldName = 'VL_OUTRAS_DESP'
    end
    object QryItensNFVL_ICMSST_RET: TFloatField
      FieldName = 'VL_ICMSST_RET'
    end
    object QryItensNFVL_ICMSST_DEST: TFloatField
      FieldName = 'VL_ICMSST_DEST'
    end
    object QryItensNFVL_ICMSST_DESON: TFloatField
      FieldName = 'VL_ICMSST_DESON'
    end
    object QryItensNFVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object QryItensNFVL_TOTAL_ITEM: TFloatField
      FieldName = 'VL_TOTAL_ITEM'
    end
  end
end
