object FrmMaster: TFrmMaster
  Left = 0
  Top = 0
  Caption = 'FrmMaster'
  ClientHeight = 481
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGeral: TAdvSmoothPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 481
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
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 691
    ExplicitHeight = 419
    TMSStyle = 4
    object PnlHeader: TAdvSmoothPanel
      Left = 0
      Top = 0
      Width = 710
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
      TabOrder = 0
      TMSStyle = 4
      object lblTitulo: TLabel
        Left = 8
        Top = 26
        Width = 87
        Height = 25
        Caption = 'MASTER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
    object PnlCentral: TAdvSmoothPanel
      Left = 0
      Top = 57
      Width = 710
      Height = 424
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
      TabOrder = 1
      ExplicitTop = 87
      ExplicitHeight = 380
      TMSStyle = 4
      object PnlFooter: TAdvSmoothPanel
        Left = 0
        Top = 367
        Width = 710
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
        TabOrder = 0
        ExplicitTop = 343
        TMSStyle = 4
      end
    end
  end
end
