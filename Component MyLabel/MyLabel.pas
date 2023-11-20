unit MyLabel;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, Vcl.ExtCtrls, System.Types;

type
  TCaptionType = (bsText, bsDate, bsTime, bsDateTime);

  TMuborakshoLabel = class(TLabel)
  private
    FCaption: string;
    FRunningLineTime: Integer;
    FThreeDimensionalityMode: Boolean;
    FBlinkMode: Integer;
    FCaptionTextType: TCaptionType;

    FTimer: TTimer;
    Foffset: Integer;

    FBlinkTimer: TTimer;
    FShowCaption: Boolean;

    FCompTimer: TTimer;

    procedure SetRunningLineTime(const value: Integer);
    procedure SetThreeDimensionalityMode(const value: Boolean);
    procedure SetBlinkMode(const value: Integer);
    procedure SetCaptionTextType(const value: TCaptionType);
    procedure SetCaption(const value: String);

    procedure TimerHandler(Sender: TObject);
    procedure BlankTimerHandler(Sender: TObject);
    procedure CompTimerTicker(Sender: TObject);

  protected
    procedure Paint;override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  published
    property RunningLineTime: Integer read FRunningLineTime write SetRunningLineTime default 0;
    property ThreeDimensionalityMode: Boolean read FThreeDimensionalityMode write SetThreeDimensionalityMode default false;
    property BlinkMode: Integer read FBlinkMode write SetBlinkMode default 0;
    property CaptionTextType: TCaptionType read FCaptionTextType write SetCaptionTextType default bsText;
    property Caption: String read FCaption write SetCaption;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TMuborakshoLabel]);
end;

procedure TMuborakshoLabel.SetRunningLineTime(const value: Integer);
begin
  if FRunningLineTime <> value then
  begin
    FRunningLineTime := value;
    FTimer.Interval := value;
    if Value = 0 then
      FTimer.Enabled := false
    else
      FTimer.Enabled := true;
    Foffset := 0;
    Invalidate;
  end;
end;

procedure TMuborakshoLabel.SetThreeDimensionalityMode(const value: Boolean);
begin
  if FThreeDimensionalityMode <> value then
  begin
    FThreeDimensionalityMode := value;
    Invalidate;
  end;
end;

procedure TMuborakshoLabel.SetBlinkMode(const value: Integer);
begin
  if FBlinkMode <> value then
  begin
    FBlinkMode := value;

    FBlinkTimer.Interval := value;
    if Value = 0 then
    begin
      FBlinkTimer.Enabled := false;
      FShowCaption := true;
    end else
    begin
      FShowCaption := false;
      FBlinkTimer.Enabled := true;
    end;
    Invalidate;
  end;
end;

procedure TMuborakshoLabel.SetCaptionTextType(const value: TCaptionType);
begin
  if FCaptionTextType <> value then
  begin
    FCaptionTextType := value;
    case Value of
      bsText: FCompTimer.Enabled := false;
      else FCompTimer.Enabled := true;
    end;
    Invalidate;
  end;
end;

procedure TMuborakshoLabel.SetCaption(const value: string);
begin
  FCaption := value;
  Invalidate;
end;

procedure TMuboraksholabel.TimerHandler(Sender: TObject);
begin
   FOffset := (FOffset + 1) mod (Canvas.TextWidth(FCaption) + Self.Width);
  Invalidate;
end;

procedure TMuborakshoLabel.BlankTimerHandler(Sender: TObject);
begin
  if FBlinkMode <> 0 then
    FShowCaption := (not FShowCaption)
  else
    FShowCaption := true;
  Invalidate;
end;

procedure TMuborakshoLabel.CompTimerTicker(Sender: TObject);
begin
 case FCaptionTextType of
    bsText: FCompTimer.Enabled := false;
    bsDate: FCaption := DateToStr(Now);
    bsTime: FCaption := TimeToStr(Now);
    bsDateTime: FCaption := DateTimeToStr(Now);
  end;
  Invalidate;
end;

constructor TMuborakshoLabel.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
  FRunningLineTime := 0;
  FBlinkMode := 0;
  FThreeDimensionalityMode := false;
  FCaptionTextType := bsText;
  FCaption := '';

  FTimer := TTimer.Create(self);
  FTimer.Interval := 0;
  FTimer.OnTimer := TimerHandler;
  FTimer.Enabled := false;
  Foffset := 0;

  FBlinkTimer := TTimer.Create(self);
  FBlinkTimer.Interval := 0;
  FBlinkTimer.OnTimer := BlankTimerHandler;
  FBlinkTimer.Enabled := false;
  FShowCaption := true;

  FCompTimer := TTimer.Create(self);
  FCompTimer.Interval := 1000;
  FCompTimer.OnTimer := CompTimerTicker;
  FCompTimer.Enabled := false;
end;

destructor TMuborakshoLabel.Destroy;
begin
  FTimer.Free;
  FBlinkTimer.Free;
  FCompTimer.Free;
  inherited Destroy;
end;

procedure TMuborakshoLabel.Paint;
var R: TRect;
    TextX: Integer;
begin
  inherited Paint;

  R := ClientRect;

  if FShowCaption then
  begin
    if FOffset < Canvas.TextWidth(FCaption) then
      TextX := -FOffset
    else
      TextX := Self.Width - (FOffset - Canvas.TextWidth(FCaption));

    if FThreeDimensionalityMode then
    begin
      Canvas.Brush.Style := bsClear;
      Canvas.Font := Self.Font;

      Canvas.Font.Color := clBtnHighlight;
      Canvas.TextOut(-2+TextX, -3, FCaption);

      Canvas.Font.Color := clBtnShadow;
      Canvas.TextOut(5+TextX, 6, FCaption);

      Canvas.Font.Color := Font.Color;
    end;

    Canvas.TextOut(TextX, 0, FCaption);
  end;

end;

end.
