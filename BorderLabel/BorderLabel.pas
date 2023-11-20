unit BorderLabel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls,winapi.Windows,winapi.Messages,vcl.Graphics;

type
  TBorderLabel = class(TLabel)
  private
    FBorderColor:TColor;
    FBorderWidth: Integer;
    procedure SetBorderColor(const value: TColor);
    procedure SetBorderWidth(const value: Integer);
  protected
    procedure Paint;override;
  public
    { Public declarations }
  published
    property BorderColor: TColor read FBorderColor write SetBorderColor default clBlack;
    property BorderWidth: Integer read FBorderWidth write SetBorderWidth default 1;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TBorderLabel]);
end;

procedure TBorderLabel.Paint;
var Rect: TRect;
begin
  inherited;
  if FBorderWidth > 0 then
  begin
    canvas.Pen.Color := FBorderColor;
    canvas.Pen.Width := FBorderWidth;
    Rect := GetClientRect;
    Canvas.Rectangle(Rect.Left,Rect.Top,Rect.Right,rect.Bottom)
  end;
end;

procedure TBorderLabel.SetBorderColor(const value: TColor);
begin
  if FBorderColor <> value then
  begin
    FBorderColor := value;
    Invalidate;
  end;
end;

procedure TBorderLabel.SetBorderWidth(const value: Integer);
begin
  if FBorderWidth <> value then
  begin
    FBorderWidth := value;
    Invalidate;
  end;
end;

end.
