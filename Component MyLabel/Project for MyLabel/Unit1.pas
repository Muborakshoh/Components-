unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MyLabel, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    M: TMuborakshoLabel;
    Timer1: TTimer;
    Edit1: TEdit;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
edit1.Text:=timetostr(time);
end;

end.
