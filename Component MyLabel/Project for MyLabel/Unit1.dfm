object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -29
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  TextHeight = 32
  object M: TMuborakshoLabel
    Tag = 5
    Left = 136
    Top = 144
    Width = 321
    Height = 73
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = '05.05.2023 13:08:06'
    Color = clHighlight
    EllipsisPosition = epPathEllipsis
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    RunningLineTime = 10
    ThreeDimensionalityMode = True
    CaptionTextType = bsDateTime
  end
  object Edit1: TEdit
    Left = 328
    Top = 272
    Width = 121
    Height = 40
    TabOrder = 0
    Text = 'Edit1'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 200
    Top = 312
  end
end
