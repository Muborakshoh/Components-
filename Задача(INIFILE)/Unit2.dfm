object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 556
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 26
    Width = 377
    Height = 14
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 161
    Top = 8
    Width = 16
    Height = 19
    Caption = '30'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 2
    Top = 8
    Width = 143
    Height = 19
    AutoSize = False
    Caption = 'Term of the program:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 48
    Width = 851
    Height = 329
    Caption = 'Panel1'
    TabOrder = 0
    object Animate1: TAnimate
      Left = 8
      Top = 16
      Width = 825
      Height = 289
    end
  end
  object TrackBar1: TTrackBar
    Left = 48
    Top = 427
    Width = 811
    Height = 23
    Max = 65535
    TabOrder = 1
    OnChange = TrackBar1Change
  end
  object MediaPlayer1: TMediaPlayer
    Left = 8
    Top = 383
    Width = 847
    Height = 30
    AutoOpen = True
    DoubleBuffered = True
    Display = Animate1
    FileName = 'D:\'#1051#1080#1095#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\'#1052#1091#1079#1099#1082#1080'\ahi-anta-h-urrun-nashid-ahi.mp3'
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 424
    Width = 56
    Height = 26
    Caption = 'Sound'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 8
    Top = 464
    Width = 851
    Height = 61
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ItemHeight = 15
    ParentFont = False
    TabOrder = 4
    OnClick = ListBox1Click
  end
  object Button1: TButton
    Left = 0
    Top = 531
    Width = 867
    Height = 25
    Align = alBottom
    Caption = 'Download multimedia'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 200
  end
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 384
    Top = 408
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 424
    Top = 408
  end
end
