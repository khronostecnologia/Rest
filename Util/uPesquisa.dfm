object FrmPesquisa: TFrmPesquisa
  Left = 355
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 478
  ClientWidth = 948
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCentral: TAdvSmoothPanel
    Left = 0
    Top = 57
    Width = 948
    Height = 345
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.HTMLShadowColor = clMenuHighlight
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.BackgroundColorTo = clMenuHighlight
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.RoundingType = rtNone
    Fill.ShadowColor = clHighlight
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.5.2.1'
    Align = alClient
    TabOrder = 6
    TMSStyle = 4
  end
  object GridPesquisa: TJvDBUltimGrid
    Left = 12
    Top = 120
    Width = 929
    Height = 217
    Color = clBtnHighlight
    DataSource = DtsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = GridPesquisaKeyPress
    TitleButtonAllowMove = True
    AlternateRowColor = clInfoBk
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object pnlTexto: TPanel
    Left = 298
    Top = 63
    Width = 641
    Height = 51
    Color = clGradientInactiveCaption
    TabOrder = 1
    object lblDescricaoTexto: TLabel
      Left = 9
      Top = 7
      Width = 43
      Height = 13
      Caption = 'Pesquisa'
    end
    object edtDescCampo: TEdit
      Left = 8
      Top = 24
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyDown = edtDescCampoKeyDown
      OnKeyPress = edtDescCampoKeyPress
    end
    object edtData: TJvDateEdit
      Left = 398
      Top = 24
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 1
      OnKeyDown = edtDataKeyDown
    end
    object edtNumero: TJvCalcEdit
      Left = 524
      Top = 23
      Width = 109
      Height = 21
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
      OnKeyDown = edtNumeroKeyDown
    end
  end
  object Panel1: TPanel
    Left = 12
    Top = 63
    Width = 281
    Height = 51
    Color = clGradientInactiveCaption
    TabOrder = 0
    object Label5: TLabel
      Left = 9
      Top = 9
      Width = 38
      Height = 13
      Caption = 'Campos'
    end
    object Label6: TLabel
      Left = 152
      Top = 10
      Width = 47
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object cbxCampos: TComboBox
      Left = 7
      Top = 26
      Width = 137
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnCloseUp = cbxCamposCloseUp
      OnKeyPress = cbxCamposKeyPress
      Items.Strings = (
        '')
    end
    object cbxOperador: TComboBox
      Left = 149
      Top = 26
      Width = 125
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbxOperadorChange
      OnKeyPress = cbxOperadorKeyPress
      Items.Strings = (
        'Igual'
        'Diferente'
        'Come'#231'a com'
        'Contem'
        'Entre')
    end
  end
  object pnlEntre: TPanel
    Left = 662
    Top = 344
    Width = 278
    Height = 51
    Color = clGradientInactiveCaption
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 65
      Height = 13
      Caption = 'Periodo inicial'
    end
    object Label2: TLabel
      Left = 129
      Top = 30
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label3: TLabel
      Left = 152
      Top = 9
      Width = 58
      Height = 13
      Caption = 'Periodo final'
    end
    object EdtDataInicial: TJvDateEdit
      Left = 6
      Top = 25
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object edtDataFinal: TJvDateEdit
      Left = 150
      Top = 24
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 1
      OnKeyDown = edtDataFinalKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 459
    Width = 948
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PnlHeader: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 57
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.HTMLShadowColor = clMenuHighlight
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.BackgroundColorTo = clMenuHighlight
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.RoundingType = rtTop
    Fill.ShadowColor = clHighlight
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.5.2.1'
    Align = alTop
    TabOrder = 4
    TMSStyle = 4
    object lblTitulo: TLabel
      Left = 8
      Top = 18
      Width = 122
      Height = 25
      Caption = 'PESQUISAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnlFooter: TAdvSmoothPanel
    Left = 0
    Top = 402
    Width = 948
    Height = 57
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.HTMLShadowColor = clMenuHighlight
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.BackgroundColorTo = clMenuHighlight
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.RoundingType = rtBottom
    Fill.ShadowColor = clHighlight
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.5.2.1'
    Align = alBottom
    TabOrder = 7
    TMSStyle = 4
    object BtnSelecionar: TAdvGlowButton
      Left = 360
      Top = 10
      Width = 135
      Height = 41
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        870000000473424954080808087C086488000000097048597300000EC400000E
        C401952B0E1B0000024E494441546881ED98BF6B136118C7BF4F7E5D8928973A
        E9D052E126FF014108DC52572729380A4274E9D0A5937F8075AD28740CE8A620
        EAE170ED5007B98C8AB543D1A120B6A98D21A431E471389A3CC6BEB9FCB81F11
        DECF78792EEFF3DCF3B9F77D3840A3D168341A8DE66C982928243020294CA752
        24C68D23A3F600B6DD56C5A5E24C6A58661D6F31057E49E0D5C2C9F947F0BCAC
        2A76EA0A9875BC4580CA0432C9E77EE1901EAAE23371261784E9548A003F27C0
        EC5E644E11E89CEA9EA9E9404F1BEA26CFCC0CD07AD5A89554F74D45077ADAE0
        ACE45706BDC489EF42A653292A9EFC46D5A89506250F24AC50A03601C903092A
        3489369244149A541B49EC0A85A18D245685C2D246129B42616A230954686EEB
        F382B5BDF3DEDADE591A6701207C6D24030BB8B2F9D13232F40AC035004FC729
        42CE36A7D726D546A254686EEBD325239B7E47A0ABBD85D120D0ED2FD7AD17C3
        FC7954DA48941DF8D6F9FE031D6CFA0BFA1021CFE0F2309D88521B895A21DB6E
        B77EE7564058EF2F02013A15DE78B7C07816953692E05DC8753356EEF2630077
        88A81BAFD2E9E25BEF26139509C8F7251F9A3692E083CCB6DBBBADFD12F8DF4E
        F4EB5478FD6149917CA8DA48863E07E6DDBD999CD15A03E3DEDF9DE05F00EE1E
        1C1F23954E3F017041FC26B569869BBACF68079942A70E73A35AAF232E6D24A3
        CD420A9DC09C8F531BC9E8C39C62773A25AADD46C558D3E8577BA1B97BB2BF0C
        60431621B4598ECAF97EC61FA7854EF0738F4D1BC9C4D3E8BCBB3793CE36D77E
        D61B8872B78916D7CDC075A7E20B8746A3D16834FF157F00A00D966161B483B7
        0000000049454E44AE426082}
      TabOrder = 0
      OnClick = BtnSelecionarClick
      Appearance.BorderColor = 14727579
      Appearance.BorderColorHot = 10079963
      Appearance.BorderColorDown = 4548219
      Appearance.Color = 15653832
      Appearance.ColorTo = 16178633
      Appearance.ColorChecked = 7915518
      Appearance.ColorCheckedTo = 11918331
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 7778289
      Appearance.ColorDownTo = 4296947
      Appearance.ColorHot = 15465983
      Appearance.ColorHotTo = 11332863
      Appearance.ColorMirror = 15586496
      Appearance.ColorMirrorTo = 16245200
      Appearance.ColorMirrorHot = 5888767
      Appearance.ColorMirrorHotTo = 10807807
      Appearance.ColorMirrorDown = 946929
      Appearance.ColorMirrorDownTo = 5021693
      Appearance.ColorMirrorChecked = 10480637
      Appearance.ColorMirrorCheckedTo = 5682430
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
    end
    object BtnCancelar: TAdvGlowButton
      Left = 507
      Top = 10
      Width = 135
      Height = 41
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F40000000473424954080808087C086488000000097048597300000EC400000E
        C401952B0E1B00000802494441545885A5976B6C53E719C7FFEFE55CECC4769C
        0B31092109E9565A34AA890C6940C787213AC245AC1ADDE5C3BEB4D22EEAD6B5
        ACEBA6AA55DB69DDA5D334A15E585BAA95B24153E8560202C48A601A6BD9B884
        52A216028D92142771ECE3D83EC7E7F89CF7BCFB10DB386912CAFA48477E651F
        3FFFDFFB5CDE0BC1CD1979A5BEFE96C6A6A6A5C1A6A616A6AA55444ACF4CA512
        A357AF5E3A158FF73E0F9800E4A776F8695EDADDDA7A5B6B67E7F7145DBF9B71
        DE42A4846B9A9042801002A6AAA09A06CF716C0F381EFFF0C39D2FF6F6BE7918
        703E13C0EEA6A696F6952B7FA755556D71D369E6E57280EF0352025242163F2B
        C7843168F5F5280871657870F0D17BCE9DDB0B40DC34C0DBAB567D3BDAD1F182
        37311111B91CE40CC252CA4920A0FC5B790C40A9A941C6B6F7FEFDCC99EF3F97
        CD2667D261337D79E2AEBB9E08B7B46C2B8C8CE8BE6D9767FD09E1E9E2D31E3F
        9F87EAFBB77FAEB1B16B7E2673E8A4E3A46F08707CEDDAC743F3E63D51181921
        B22452212A0A05E472B98FD3A67976C2B2CE9BF9FC55E1BA792A659452CA4865
        148AFFE142CC8B69DABA9069FEED8CE765674DC13F56ADFA46B4ADADBB303A5A
        162F093B96650FA552DD274647FFFC8A69BE07208FEBB9E52B75BDEEBB75755F
        5F5853737FB5AEDF422A52313994184D268FFF6470B06B78F2BF5323F05A7DFD
        FC96CECE43EED85870BAB8F47D240CE3DC53FDFDF71D75DDF7015800DC228000
        E00E79DEC4816CF63FEF2412AF766A1AAA15E5CB8C104A8AB3240074556D5B02
        E40F98E649145BB50CF0F0DAB5DBE0382B7CC7F984387C1F558140F39DC1E01D
        8964F2ADAB73B4970138FBD2E9E32B14A5BF56D7375242CA1A8C5228BEFF254D
        CA3DBD8E639401763636B6C7162F7E5918062DB7598538A404F17DE89AB6E88E
        60B033914AED9F0B0280ECC9642E7EADAECE88EAFA3A781E889420528273AE05
        1C87F498E65100920240FBF2E5F78A5C8ECBE2CCA5EFA390CF3BE386F17E0906
        528200A88D44D6FCB8A363EF1A2032070000F8DFEAEB7BC1D2F5C394D2721A54
        C6D0A069DF590884018002208AAEDF2D72B9290BCB502AF5E63357AEACCF6432
        A72A2B1A52A2361C5EF3404747F70A20740308AFAFBFFF515F0859181E861B8F
        C31B1B83EE38F5F7D5D5AD0600FA6C30D8C8285D5C197A5128E0DD4462E749DB
        1EDA3F30B02993CD9E463132DEC404ECE1616823236BB746227B5603D57311FC
        281EEFF542A15314005C17D2B6C16D1BF5427C0500A38D4D4D4B29A5A45C7452
        C2B2ACB1E733993300E476D31CDB3738B8213532723AF7C107B0878721B259C0
        F711F1BCAE076A6B5FBF0184EF107244ABA901630C8C31A88C41977209004EA3
        0B16B408DB9EB282599E771993AD0600D8619AA36F19C6863CE7A70921208480
        520A4208A2AEDBF5605DDD9C10E964F23D2D1A9D04A0149C31E894CE07C02953
        D590EF7953965A4F881400AFD2C90ED31C3DE8FB1B2C4D3B4D4B1045905ADFEF
        7AA8A161568889747A9CE97A39028C3170A00A00A3524A971072BDF5A4046C5B
        9DC9D10ED31C3DE0791B2C553D5D12A79482518A0629BB1E9A37EFAF4B271D4F
        315551B4D2CC4B5100210200A8691849AAAA93ED2725CCFE7EC8B1B166007C36
        886385C2265351CE970028216094623EA51B9F8EC5764D8768686E6E85E38033
        06CE1808A5F0294D011034313070892A0AE0FBC85DBE8C4232095DCACFAFD4F5
        BAD972FA47CB8A1FCAE7BBB28C9DAF8C04670CCD8AB2F9B7CDCD532022A1D00A
        6259609C83730E10025BCA01001E7D757CBCCF2D1472E6471FC14DA5400050CF
        53BFA9AA9B30C779E1B97CFEDA41D3ECCA30769E520AC6D82404A558A8AA9B9F
        59B870D752A0EA41205045C846EABA508A29F000A4283D0BC0A32700C7C9E78F
        1592D7CF0B044093E7FDB061867C4E87D89FC974A509395FAA855291B5EBFAE6
        DFB7B7EF5ABD7CF9FDD58E53AF1667CF18832DA5FF4FD37C1B806000B05ED745
        B8BA7A8B6B1828B599E2FB0DCBC361ABC7B6CB3BD74CF65FCFCB8685D8BF2818
        5C53CD798C1753C13947BDA62D8E46225F550D83F062840A9E8741DB7EE749C3
        D806C0A100F08B0B17F693DADAFE4AC7044093E33CF6876874DD5CA9284562CF
        F8F8FAA4EF5FA415ADA6708E702643754581528C80E5BAE8F5BC1731797A0605
        807EC0493ACEE381E6E6B2380030DFD7167BDEEB3BDADAB694DE9DCDFE94CF7F
        BC7B6262DDB81017CBBD5E84501405AAA2A0E0791872DD534F25123D281E66CA
        4EB7F4F6768B86861ECAA7761F73DDAA36C7D97D70D9B2977E198DB6CC158D3E
        C3880F05023BDD48A45C0F0AE750388704306E59D61BD9EC2300CA67C329CE7E
        1A0CC6D63436FE4B0C0D7590627F97FA9C0702505A5B6DAFA6A6C7C8640E8F0E
        0F5F801029CA981A098516C55A5B578528BD27ECBA8B782A854031EC8AA20000
        E286E1EF4B26B7FE3C1EDF0EC09E1100007E158BDDBEC4B28EA8B6BDA0128052
        0ACA18B8AA22108B8187C300636084409112C86641F379288C4199269ECCE5E4
        D164F2D73FB876ED3700663F9496ECE150E8D66542BC1116E20BBC12A0D46615
        EDC68A155FAAFC52B171CEE10981846539C772B9C7B65EBBB67DBA3830CBBDE0
        DF854232EFBA7B9A83C190E2FB5F5408A1A5CD8710024269F929ED8AB4628774
        8540DAB270259BEDFB4B3A7DEFD38944378A553FDD6E7437E43F0B853A6F051E
        A995B22B00A81A63508A154E2BD67610021F80E3FB484979A9AF5078E9C944E2
        351318C7FF73359B66CA164D6B5DA1EB9BAAA5BCB38A90DB744A638C109D10E2
        0B425236309006CE5E14E2C8B386F12E80094CDBD23F0B40E5FB1C800640298E
        25266758283E1E6EE27AFE3FC8B02D740B0AF83D0000000049454E44AE426082}
      TabOrder = 1
      OnClick = BtnCancelarClick
      Appearance.BorderColor = 14727579
      Appearance.BorderColorHot = 10079963
      Appearance.BorderColorDown = 4548219
      Appearance.BorderColorDisabled = 15921906
      Appearance.Color = 15653832
      Appearance.ColorTo = 16178633
      Appearance.ColorChecked = clMenu
      Appearance.ColorCheckedTo = 11918331
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 7778289
      Appearance.ColorDownTo = 4296947
      Appearance.ColorHot = 15465983
      Appearance.ColorHotTo = 11332863
      Appearance.ColorMirror = 15586496
      Appearance.ColorMirrorTo = 16245200
      Appearance.ColorMirrorHot = 5888767
      Appearance.ColorMirrorHotTo = 10807807
      Appearance.ColorMirrorDown = 946929
      Appearance.ColorMirrorDownTo = 5021693
      Appearance.ColorMirrorChecked = 10480637
      Appearance.ColorMirrorCheckedTo = 5682430
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
    end
  end
  object QryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = DMBase.DB
    Left = 56
    Top = 232
  end
  object DtsPesquisa: TDataSource
    DataSet = QryPesquisa
    Left = 96
    Top = 232
  end
  object QryTipoDados: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 22
    Top = 232
    object QryTipoDadosCampoNome: TStringField
      FieldName = 'CampoNome'
      Size = 100
    end
    object QryTipoDadosCampoTipo: TIntegerField
      FieldName = 'CampoTipo'
    end
  end
end
