unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ComCtrls, Vcl.ExtCtrls, MMSystem,Inifiles,
  Vcl.StdCtrls, Registry ;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    OpenDialog1: TOpenDialog;
    Animate1: TAnimate;
    MediaPlayer1: TMediaPlayer;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    Label1: TLabel;
    Button1: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
//------------------------------------------------------------------
type
   TVolumeRec = record
     case Integer of
       0: (LongVolume: Longint) ;
       1: (LeftVolume, RightVolume : Word) ;
     end;

const DeviceIndex=5;

procedure SetVolume(aVolume: Byte) ;
var
  Vol: TVolumeRec;
begin
   Vol.LeftVolume := aVolume shl 8;
   Vol.RightVolume:= Vol.LeftVolume;
   auxSetVolume(UINT(DeviceIndex), Vol.LongVolume) ;
end;
//------------------------------------------------------------------
procedure TForm2.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
   if OpenDialog1.FileName<>'' then
     begin
       ListBox1.Items.Add(OpenDialog1.FileName);
     end;

end;

procedure TForm2.Button2Click(Sender: TObject);
var REG:TRegistry;
begin
    REG:=TRegistry.Create;
    try
      REG.RootKey:= HKEY_USERS;
      REG.CreateKey('Software\MyProg');
    finally
       Reg.Free;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var INI, Ini_file:TINIFILE;
    text:String;
    d:Tdate;
begin
  Ini_file:=TIniFile.Create(extractfilepath(paramstr(0))+'Setting.ini');
  label3.Caption:=IntToStr(Ini_file.ReadInteger('Time', 'sec', 0));
  d:=StrToDAte(Ini_file.ReadString('Time', 'data', ''));
  if date-d>=0 then
    label3.Caption:='30';
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'MyIni.ini');
  Width:=Ini.ReadInteger('Size','Width',100);
  Height:=Ini.ReadInteger('Size','Height',100);
  Left:=Ini.ReadInteger('Position','X',10);
  Top:=Ini.ReadInteger('Position','Y',10);
  TrackBAr1.Position:=Ini.ReadInteger('Option', 'sound', 10);
  text:= Ini.ReadString('Option', 'musik', '');
  MediaPlayer1.FileName:=text;
  MediaPlayer1.Open;
  MediaPlayer1.AutoOpen:=true;
  ListBox1.Items.Text:=text;
  Label1.Caption:= copy(text,LastDelimiter('\',text)+1,Length(text)-LastDelimiter('\',text));
  Ini.Free;
end;

procedure TForm2.FormDestroy(Sender: TObject);
var INI, Ini_file:TINIFILE;
begin
   Ini_file:=TIniFile.Create(extractfilepath(paramstr(0))+'Setting.ini');
   ini_File.WriteInteger('Time','sec', StrToInt(label3.Caption));
   INI := TIniFile.Create(ExtractFilePath(ParamStr(0))+'MyIniFile.ini');
   INI.WriteInteger('Size', 'Width', width);
   Ini.WriteInteger('Size', 'Height', height);
   Ini.WriteInteger('Position', 'X', left);
   Ini.WriteInteger('Position', 'Y', top);
   INI.WriteInteger('Option', 'sound', TrackBAr1.Position);
   if ListBox1.ItemIndex<>-1 then  Ini.WriteString('Option', 'musik', Listbox1.Items[ListBox1.ItemIndex]);
   Ini.Free;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
   MediaPlayer1.FileName:=ListBox1.Items[ListBox1.ItemIndex];
   MediaPlayer1.Open;
   MediaPlayer1.AutoOpen:=true;
   LAbel1.Caption:=copy(ListBox1.Items[ListBox1.ItemIndex],LastDelimiter('\',ListBox1.Items[ListBox1.ItemIndex])+1,length(ListBox1.Items[ListBox1.ItemIndex])-LastDelimiter('/',ListBox1.Items[ListBox1.ItemIndex]));
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var text:String;

begin
 text:=Label1.Caption;
 LAbel1.Caption:=copy(text,2,Length(text)-1)+copy(text,1,1);
end;

procedure TForm2.Timer2Timer(Sender: TObject);
var INi_File:TINiFile;
begin
  if strToInt(label3.Caption)<=0 then
  begin

    Timer2.Interval:=0;
    Ini_file:=TIniFile.Create(extractfilepath(paramstr(0))+'Setting.ini');

    Ini_file.WriteString('Time','data',DAteToStr(date));

    ShowMessage('The program has expired, please try aggain in 24 hours!');

    Application.Terminate;
  end;
  Label3.Caption:= intToStr(strToint(Label3.Caption)-1);
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
var value, LValue,RValue:dWord;
    volume:DWord;
    HWO: HWAVEOUT;
    WF: TWAVEFORMATEX;
    V: DWORD;
begin
  FillChar(WF,SizeOf(WF),0);
  WaveOutOpen(@HWO,WAVE_MAPPER,@WF,0,0,0);
  V:=TrackBar1.Position+TrackBar1.Position shl 16;
  WaveOutSetVolume(HWO,V);
  WaveOutClose(HWO);
end;

end.
