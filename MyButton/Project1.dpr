program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Project for MyButton\Unit1.pas' {Form1},
  MyButton in 'MyButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
