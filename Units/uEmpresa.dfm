object FrmEmpresas: TFrmEmpresas
  Left = 0
  Top = 0
  Caption = 'FrmEmpresas'
  ClientHeight = 466
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanelGeral: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 466
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.BackgroundColor = clMenuHighlight
    Caption.BackgroundColorTo = clMenuHighlight
    Caption.ColorStart = 10921638
    Caption.ColorEnd = 10921638
    Caption.LineColor = 4473924
    Fill.Color = clGradientActiveCaption
    Fill.ColorTo = clGradientActiveCaption
    Fill.ColorMirror = clGradientActiveCaption
    Fill.ColorMirrorTo = clMenuHighlight
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = clGradientActiveCaption
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Version = '1.5.2.1'
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 383
    TMSStyle = 23
    object AdvSmoothPanel1: TAdvSmoothPanel
      Left = 0
      Top = 57
      Width = 339
      Height = 352
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
      Fill.ShadowColor = clHighlight
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Version = '1.5.2.1'
      Align = alClient
      TabOrder = 0
      ExplicitTop = 120
      ExplicitWidth = 383
      ExplicitHeight = 57
      TMSStyle = 4
      object GridEmpresa: TcxGrid
        Left = 0
        Top = 0
        Width = 339
        Height = 352
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 32
        ExplicitTop = 40
        ExplicitWidth = 250
        ExplicitHeight = 200
        object GridEmpresaDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object GridEmpresaLevel1: TcxGridLevel
          GridView = GridEmpresaDBTableView1
        end
      end
    end
    object PnlFooter: TAdvSmoothPanel
      Left = 0
      Top = 409
      Width = 339
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
      TabOrder = 1
      ExplicitTop = 0
      ExplicitWidth = 383
      TMSStyle = 4
      object BtnSelecionar: TAdvGlowButton
        Left = 106
        Top = 8
        Width = 126
        Height = 42
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
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000000473424954080808087C086488000000097048597300000EC400000E
          C401952B0E1B0000013B494441545885ED953D4BC35018469F272D1644AC4A16
          B1B8A40D2E2E529C146C67FF97FF480B4A9AA176BAE8D025ADBA944E52144A04
          1592D7A1B884B49AE62683E6ACB9700E6FEE07505050F01FD8B9B9DFDBBA52A7
          71DF8C3CE40802D7203BD58E6AE51AF02D275827B15E062FA26BCA79C8014004
          83CF8A9C47D7314779DB6F35A7990724916B0F482AD71AB08A5C5BC0AA7260C1
          316CF487C78DDEF0AEDE1B5959CA81980958FD872343428764554426223C7B3C
          B19FB29003311328AD0563006300205923C58D9BC4F6B5DA4F2B8F0D18350FA6
          AC485B44068B22362F958500B769E5C0924D682BCF940F3A240FE792F9EF789E
          CD5032E01A642DAD7C69406C44184EA6BE0F5DF21F03A211A1085E7D1FBAE4C0
          2F5EC3E89ED02907125C44B6F2CCF01DCE8BFF065DF2C4EC763D73A3ABCCDCC5
          05057F9A2F663602AA2D99BC420000000049454E44AE426082}
        TabOrder = 0
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorDisabled = clBackground
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 7915518
        Appearance.ColorCheckedTo = 11918331
        Appearance.ColorDisabled = clBackground
        Appearance.ColorDisabledTo = clBackground
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
        Appearance.ColorMirrorDisabled = clBackground
        Appearance.ColorMirrorDisabledTo = clBackground
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
    end
    object PnlHeader: TAdvSmoothPanel
      Left = 0
      Top = 0
      Width = 339
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
      TabOrder = 2
      ExplicitTop = -6
      TMSStyle = 4
      object lblTitulo: TLabel
        Left = 9
        Top = 13
        Width = 130
        Height = 29
        Caption = 'EMPRESAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
