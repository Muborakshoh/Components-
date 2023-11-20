unit MyButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Graphics, System.Types,Winapi.Windows,System.Math,Vcl.Dialogs;

type
  TButtonShape = (bsRectangle, bsRoundRect,bsEllipse,bsPolygon);
  TPolygonType = (bsTriangle,bsRect,bsFive,bsSix,bsStar);
  TAngles = (bs0,bs90,bs180,bs270);

  TMuborakshoButton = class(TSpeedButton)
  private
    FButtonShape: TButtonShape;
    FCornerRadius: Integer;
    FPolygonType: TPolygonType;
    FBackColor:TColor;
    FHeaderFont:TFont;
    FAngles:TAngles;
    FHeader:string;
    FDepth: Integer;
    FShadowColor:TColor;
    FHighLightColor: TColor;
    procedure SetButtonShape(const value: TButtonShape);
    procedure SetCornerRadius(const value: Integer);
    procedure SetPolygonType(const value: TPolygonType);
    procedure SetBackColor(const value: TColor);
    procedure SetHeaderFont(const value: TFont);
    procedure SetHeader(const value:string);
    procedure SetHeaderRotationAngle(const value:TAngles);
  protected
    procedure Paint;override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  published
    property ButtonShape: TButtonShape read FButtonShape write SetButtonShape default bsRectangle;
    property CornerRadius: Integer read FCornerRadius write SetCornerRadius default 0;
    property PolygonType: TPolygonType read FPolygonType write SetPolygonType default bsRect;
    property BackgroundColor: TColor read FBackColor write SetBackColor default clBtnFace;
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont;
    property Header: string read FHeader write SetHeader;
    property HeaderRotationAngle: TAngles read FAngles write SetHeaderRotationAngle default bs0;
  end;

procedure Register;

implementation

procedure RotateText(Canvas: TCanvas;const Text:string; X,Y,Angle:Integer);
var LogFont: TLogFont;
    FontHandle,OldFontHandle: HFONT;
    GraphicsMode,OldGraphicsMode:Integer;
    WorldTransform:TXForm;
    TextWidth, TextHeight:Integer;
    RotatedX,RotatedY:Integer;
begin
  OldGraphicsMode:=SetGraphicsMode(Canvas.Handle,GM_ADVANCED);

  GetWorldTransform(Canvas.Handle,WorldTransform);

  GetObject(Canvas.Font.Handle,SizeOf(TLogFont),@LogFont);
  FontHandle := CreateFontIndirect(LogFont);

  OldFontHandle := SelectObject(Canvas.Handle,FontHandle);

  TextWidth := Canvas.TextWidth(Text);
  TextHeight := Canvas.TextHeight(Text);

  case Angle of
    0:
    begin
      RotatedX := X - TextWidth div 2;
      RotatedY := Y - TextHeight div 2;
    end;
    90:
    begin
      RotatedX := X + TextHeight div 2;
      RotatedY := Y - TextWidth div 2;
    end;
    180:
    begin
      RotatedX := X + TextWidth div 2;
      RotatedY := Y + TextHeight div 2;
    end;
    270:
    begin
      RotatedX := X - TextHeight div 2;
      RotatedY := Y + TextWidth div 2;
    end;
    else
    begin
      RotatedX := X - TextWidth div 2;
      RotatedY := Y - TextHeight div 2
    end;
  end;

  WorldTransform.eM11 := Cos(DegToRad(Angle));
  WorldTransform.eM12 := Sin(DegToRad(Angle));
  WorldTransform.eM21 := -Sin(DegToRad(Angle));
  WorldTransform.eM22 := Cos(DegToRad(Angle));
  WorldTransform.eDx := RotatedX;
  WorldTransform.eDy := RotatedY;
  SetWorldTransform(Canvas.Handle,WorldTransform);

  Canvas.TextOut(0,0,Text);

  SetWorldTransform(Canvas.Handle,WorldTransform);
  SelectObject(Canvas.Handle,OldFontHandle);
  DeleteObject(FontHandle);

  SetGraphicsMode(Canvas.Handle,OldGraphicsMode);
end;


procedure Register;
begin
  RegisterComponents('Standard', [TMuborakshoButton]);
end;

constructor TMuborakshoButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FButtonShape := bsRectangle;
  FCornerRadius := 0;
  FPolygonType := bsRect;
  FBackColor := clBtnFace;
  FHeaderFont := TFont.Create;
  FHeader := 'Muboraksho';
  FAngles := bs0;
  FHighLightColor := clBtnHighLight;
  FShadowColor := clBtnShadow;
  FDepth := 2;
end;

destructor TMuborakshoButton.Destroy;
begin
  FHeaderFont.Free;
  inherited Destroy;
end;

procedure TMuborakshoButton.SetButtonShape(const value: TButtonShape);
begin
  if FButtonShape <> value then
  begin
    FButtonShape := value;
    Invalidate;
  end;
end;

procedure TMuborakshoButton.SetCornerRadius(const value: Integer);
begin
  if FCornerRadius <> value then
  begin
    FCornerRadius := value;
    Invalidate;
  end;
end;

procedure TMuborakshoButton.SetPolygonType(const value: TPolygonType);
begin
  if FPolygonType <> value then
  begin
    FPolygonType := value;
    Invalidate;
  end;
end;

procedure TMuborakshoButton.SetBackColor(const value: TColor);
begin
  if FBackColor <> value then
  begin
     FBackColor := value;
     Invalidate;
  end;
end;

procedure TMuborakshoButton.SetHeaderFont(const value: TFont);
begin
 FHeaderFont.Assign(value);
 Invalidate;
end;

procedure TMuborakshoButton.SetHeader(const value: string);
begin
  FHeader := value;
  Invalidate;
end;

procedure TMuborakshoButton.SetHeaderRotationAngle(const value: TAngles);
begin
  if FAngles <> value then
  begin
    FAngles := value;
    Invalidate;
  end;
end;

procedure TMuborakshoButton.Paint;
var
   R: TRect;
   Points: array of TPoint;
   RotatedFont: HFONT;
   TextWidth,TextHeight: Integer;
   RotatedX, RotatedY, X, Y: Integer;
begin
  inherited Paint;

  R := ClientRect;

  Canvas.Brush.Color := FBackColor;

  case FButtonShape of
    bsRoundRect:
    begin
      if FCornerRadius > 0 then
      Canvas.RoundRect(R.Left,R.Top,R.Right,R.Bottom,FCornerRadius,FCornerRadius)
      else
      Canvas.Rectangle(R);
    end;
    bsRectangle:
    Canvas.Rectangle(R);
    bsEllipse:
    Canvas.Ellipse(R);
    bsPolygon:
    begin
      case FPolygonType of
      bsTriangle:
      begin
        SetLength(Points,3);
        Points[2] := Point(R.Left,R.Bottom);
        Points[1] := Point(R.Right,R.Bottom);
        Points[0] := Point((R.Left + R.Right) div 2,R.Top);


        Canvas.Polygon(Points);
      end;
      bsRect:
      begin
        Canvas.Rectangle(R);
      end;
      bsFive:
      begin
      SetLength(Points, 5);
      Points[4] := Point(R.Left,R.Top + (R.Bottom - R.Top) div 3);
      Points[3] := Point(R.Left + (R.Right - R.Left) div 2,R.Top);
      Points[2] := Point(R.Right,R.Top + (R.Bottom - R.Top) div 3);
      Points[1] := Point(R.Right - (R.Right - R.Left) div 3,R.Bottom);
      Points[0] := Point(R.Left + (R.Right - R.Left) div 3,R.Bottom);



      Canvas.Polygon(Points);
      end;
      bsSix:
          begin
            SetLength(Points, 6);
            Points[0] := Point(R.Left,R.Top + R.Height div 2);
            Points[1] := Point(R.Left + R.Width div 3,R.Top);
            Points[2] := Point(R.Left + R.Width * 2 div 3,R.Top);
            Points[3] := Point(R.Right,R.Top + R.Height div 2);
            Points[4] := Point(R.Left + R.Width * 2 div 3,R.Bottom);
            Points[5] := Point(R.Left + R.Width div 3,R.Bottom);


            Canvas.Polygon(Points);
          end;
      bsStar:
      begin
        SetLength(Points, 10);
        Points[0] := Point(R.Left + ((R.Right - R.Left) div 2), R.Top);
        Points[1] := Point(R.Left + ((R.Right - R.Left) div 3), R.Top + ((R.Bottom - R.Top) div 3));
        Points[2] := Point(R.Left, R.Top + ((R.Bottom - R.Top) div 2));
        Points[3] := Point(R.Left + ((R.Right - R.Left) div 3), R.Bottom - ((R.Bottom - R.Top) div 3));
        Points[4] := Point(R.Left + ((R.Right - R.Left) div 2), R.Bottom);
        Points[5] := Point(R.Right - ((R.Right - R.Left) div 2), R.Bottom);
        Points[6] := Point(R.Right - ((R.Right - R.Left) div 3), R.Bottom - ((R.Bottom - R.Top) div 3));
        Points[7] := Point(R.Right, R.Top + ((R.Bottom - R.Top) div 2));
        Points[8] := Point(R.Right - ((R.Right - R.Left) div 3), R.Top + ((R.Bottom - R.Top) div 3));
        Points[9] := Point(R.Right - ((R.Right - R.Left) div 2), R.Top);

        Canvas.Polygon(Points);
      end;
    end;
  end;
end;
Canvas.Font := FHeaderFont;

X := R.Left + (R.Right - R.Left) div 2;
Y := R.Top + (R.Bottom - R.Top) div 2;

RotateText(Canvas, FHeader, X, Y, Ord(FAngles)*90);
end;


end.
