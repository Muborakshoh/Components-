unit Unit0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
type arr = array of Integer;
   TSort = procedure(var arr:array of Integer;size:Integer);
var a:arr;
    i,size:Integer;
    _dll:THandle;
    SOrt:TSort;
begin
size:=memo1.Lines.Count;
SetLength(a,size);
for i:=0 to size-1 do
  a[i]:=StrToInt(memo1.Lines[i]);
  _dll:=LoadLibrary('Project2.dll');
  Sort:=GetProcAddress(_dll,'Sort');
  Sort(a,size);
  memo2.Clear;
  for i:=0 to size-1 do
  memo2.Lines.Add(IntToStr(a[i]));
  FreeLibrary(_dll);
  SetLength(a,0);
end;


procedure TForm1.Button2Click(Sender: TObject);
type arr = array of Integer;
   TShuffle = procedure(var arr:array of Integer;size:Integer);
var a:arr;
    i,size:Integer;
    _dll:THandle;
    Shuffle:TShuffle;
begin
size:=memo1.Lines.Count;
SetLength(a,size);
for i:=0 to size-1 do
  a[i]:=StrToInt(memo1.Lines[i]);
  _dll:=LoadLibrary('Project2.dll');
  Shuffle:=GetProcAddress(_dll,'Shuffle');
  Shuffle(a,size);
  memo3.Clear;
  for i:=0 to size-1 do
  memo3.Lines.Add(IntToStr(a[i]));
  FreeLibrary(_dll);
  SetLength(a,0);
end;

procedure TForm1.Button3Click(Sender: TObject);
type arr = array of Integer;
   TReverse = procedure(var arr:array of Integer;size:Integer);
var a:arr;
    i,size:Integer;
    _dll:THandle;
    Reverse:TReverse;
begin
size:=memo1.Lines.Count;
SetLength(a,size);
for i:=0 to size-1 do
  a[i]:=StrToInt(memo1.Lines[i]);
  _dll:=LoadLibrary('Project2.dll');
  Reverse:=GetProcAddress(_dll,'Reverse');
  Reverse(a,size);
  memo4.Clear;
  for i:=0 to size-1 do
  memo4.Lines.Add(IntToStr(a[i]));
  FreeLibrary(_dll);
  SetLength(a,0);
end;
procedure TForm1.Button4Click(Sender: TObject);
type arr = array of Integer;
   TSwap = procedure(var arr:array of Integer;size:Integer);
var a:arr;
    i,size:Integer;
    _dll:THandle;
    Swap:TSwap;
begin
size:=memo1.Lines.Count;
SetLength(a,size);
for i:=0 to size-1 do
  a[i]:=StrToInt(memo1.Lines[i]);
  _dll:=LoadLibrary('Project2.dll');
  Swap:=GetProcAddress(_dll,'Swap');
  Swap(a,size);
  memo5.Clear;
  for i:=0 to size-1 do
  memo5.Lines.Add(IntToStr(a[i]));
  FreeLibrary(_dll);
  SetLength(a,0);
end;

procedure TForm1.Button5Click(Sender: TObject);
type arr = array of Integer;
   TReplace = procedure(var arr:array of Integer;size:Integer;old_val:Integer;new_val:Integer);
var a:arr;
    o_val:Integer;
    n_val:Integer;
    i,size:Integer;
    _dll:THandle;
    Replace:TReplace;
begin
size:=memo1.Lines.Count;
o_val:=StrToInt(edit1.Text);
n_val:=StrToInt(edit2.Text);
SetLength(a,size);
for i:=0 to size-1 do
  a[i]:=StrToInt(memo1.Lines[i]);
  _dll:=LoadLibrary('Project2.dll');
  Replace:=GetProcAddress(_dll,'Replace');
  Replace(a,size,o_val,n_val);
  memo6.Clear;
  for i:=0 to size-1 do
  memo6.Lines.Add(IntToStr(a[i]));
  FreeLibrary(_dll);
  SetLength(a,0);
  
end;
end.
