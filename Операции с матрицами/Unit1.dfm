object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 514
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  OnCreate = FormCreate
  TextHeight = 19
  object Label1: TLabel
    Left = 736
    Top = 8
    Width = 192
    Height = 42
    Caption = 'R E S U L T'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 88
    Top = 8
    Width = 98
    Height = 19
    Caption = 'MATRIX "A"'
  end
  object Label4: TLabel
    Left = 8
    Top = 36
    Width = 16
    Height = 19
    Caption = 'M'
  end
  object Label5: TLabel
    Left = 144
    Top = 36
    Width = 12
    Height = 19
    Caption = 'N'
  end
  object Label8: TLabel
    Left = 584
    Top = 78
    Width = 54
    Height = 19
    Caption = 'Number'
  end
  object Memo1: TMemo
    Left = 8
    Top = 66
    Width = 273
    Height = 480
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 678
    Top = 56
    Width = 315
    Height = 267
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 287
    Top = 8
    Width = 273
    Height = 296
    Color = clCream
    ParentBackground = False
    TabOrder = 2
    object Label3: TLabel
      Left = 80
      Top = 22
      Width = 98
      Height = 19
      Caption = 'MATRIX "B"'
    end
    object Label6: TLabel
      Left = 8
      Top = 48
      Width = 16
      Height = 19
      Caption = 'M'
    end
    object Label7: TLabel
      Left = 136
      Top = 47
      Width = 12
      Height = 19
      Caption = 'N'
    end
    object Memo3: TMemo
      Left = 8
      Top = 80
      Width = 257
      Height = 209
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 30
      Top = 47
      Width = 99
      Height = 27
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 154
      Top = 47
      Width = 97
      Height = 27
      TabOrder = 2
    end
  end
  object Edit1: TEdit
    Left = 30
    Top = 33
    Width = 97
    Height = 27
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 162
    Top = 33
    Width = 97
    Height = 27
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 303
    Width = 664
    Height = 386
    Cursor = crHandPoint
    Caption = 'Matrix Operations'
    Columns = 3
    Items.Strings = (
      'Matrix * Number'
      'Determinant'
      'Rang'
      'Inverted'
      'Transpose'
      'Inverse Matrix'
      'Matrix * Vector'
      'Matrix * Matrix'
      'Matrix + Matrix'
      'Matrix - Matrix'
      'Decided SOLAE')
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object BitBtn1: TBitBtn
    Left = 678
    Top = 336
    Width = 315
    Height = 170
    Cursor = crHandPoint
    Caption = 'EXECUTE'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object Panel2: TPanel
    Left = 552
    Top = 136
    Width = 129
    Height = 161
    Caption = 'VECTOR'
    TabOrder = 7
    object Edit5: TEdit
      Left = 0
      Top = 0
      Width = 265
      Height = 27
      TabOrder = 0
    end
  end
  object Edit6: TEdit
    Left = 556
    Top = 103
    Width = 121
    Height = 27
    TabOrder = 8
  end
end
