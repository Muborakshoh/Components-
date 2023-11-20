unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Memo3: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Edit5: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  TMatrix = array of array of Real;

procedure PrintMatrix(matrix: TMatrix;n:Integer;m:Integer; Memo:Tmemo);
var i,j:Integer;
    line:String;
begin
  Memo.Clear;
   for i := 0 to (n-1) do
   begin
     line := '';
     for j := 0 to (m-1) do
       line := line + FloatToStrF(matrix[i,j],ffFixed,3,1) + ' ';

       Memo.Lines.Add(Trim(line));
   end;
end;

procedure Triangle(var Matrix:TMatrix; n:integer; m:integer);
var i,j,k:Integer;
    temp,x:extended;
begin
  for i := 0 to (n-2) do
    begin
      if (Matrix[i,i] = 0) then
      begin
        ShowMessage('Error!!!!');
        j:=0;
        for k := i+1 to (n-1) do
          if (Matrix[k,i] <> 0) then
          begin
            j:=k;
            break;
          end;

        for k := 0 to (m-1) do
          begin
            x:=Matrix[j,k];
            Matrix[j,k] := Matrix[0,k];
            Matrix[0,k] := x;
          end;

          for k := 0 to (n-1) do
            for j := 0 to (m-1) do
              Matrix[k,j] := Matrix[k,j] * (-1);
      end;
      if (Matrix[i,i] <> 0.0) then
      for j := i+1 to (n-1) do
        begin
          temp:=Matrix[j,i] / matrix[i,i];
          for k := i to (m-1) do
            Matrix[j,k] := Matrix[j,k] - temp * Matrix[i,k];
        end;
    end;
end;

procedure TriangleTop(var Matrix:TMatrix;n:Integer;m:integer);
var i,j,k: integer;
    temp,x:extended;
begin
   for i := n-1 downto 1 do
     begin
       for j := i-1 downto 0 do
       begin
         temp := Matrix[j,i] / Matrix[i,i];
         for k := i to (m-1) do
           Matrix[j,k] := Matrix[j,k] - temp * Matrix[i,k];
     end;
end;
end;

function FDeterminant(Matrix:TMatrix;n:Integer;m:Integer):Real;
var i:Integer;
    Det:Real;
begin
  if (n <> m) then
  begin
    ShowMessage('!Determinant is calculated only for square matrix!');
    Result:=0.0;
  end else
  begin
    Triangle(Matrix,n,m);
    Det := 1.0;
    for i := 0 to (n - 1) do
      Det := Det * Matrix[i,i];

      Result := Det;
  end;
end;

function FRang(Matrix:TMatrix;n:Integer;m:Integer):Integer;
var i, j, counter: integer;
  isZero: Boolean;
begin
  Triangle(Matrix, n, m);
  counter := n;
  for i := 0 to (n-1) do
  begin
    isZero := True;
    for j := 0 to (m-1) do
    begin
      if(matrix[i, j] <> 0.0) then
      begin
        isZero := False;
        break;
      end;
    end;
    if isZero then
      counter := counter - 1;
  end;

  Result := counter;
end;

procedure InvertMatrix(var Matrix:TMatrix;n:Integer;m:Integer);
var i,j:Integer;
begin
  for i := 0 to (n-1) do
    for j :=0 to (m-1) do
      Matrix[i,j] := Matrix[i,j] * (-1);
end;

function TranspositionMatrix(var Matrix:TMatrix; n:Integer;m:Integer):TMatrix;
var i,j:Integer;
    temp: TMatrix;
begin
    SetLength(temp, m, n);

  for i := 0 to (n-1) do
  begin
    for j := 0 to (m-1) do
    begin
      temp[j, i] := Matrix[i, j];
    end;
  end;

  Result := temp;

end;

procedure InverseMatrix(var Matrix: TMatrix; n:Integer;m:Integer);
var i,j:Integer;
    temp:real;
    FullMatrix: TMatrix;
begin
  SetLength(FullMatrix, n, m + n);

  for i := 0 to (n-1) do
    begin
      for j := 0 to (m-1) do
        begin
          FullMatrix[i,j] := Matrix[i,j];

          if (i = j) then
          temp := 1
          else
          temp := 0;

          FullMatrix[i,j+m] := temp;
        end;
    end;
    Triangle(FullMatrix,n,m+m);
    TriangleTop(FullMatrix,n,m+m);

    for i := 0 to (n-1) do
  begin
    temp := FullMatrix[i, i];
    for j := i to (m+m-1) do
      FullMatrix[i, j] := FullMatrix[i, j] / temp;
  end;

  Matrix := FullMatrix;
end;

function MultWithMatrix(a:TMatrix;b:TMatrix;n:Integer;m:Integer;mb:Integer):TMatrix;
var
  i, j, k: Integer;
  sum: real;
  c: TMatrix;
  vector: array of extended;
begin
  SetLength(vector, mb);
  SetLength(c, n, mb);
  for i := 0 to (n-1) do
  begin
    for j := 0 to (mb-1) do
    begin
      sum := 0.0;
      for k := 0 to (m-1) do
        sum := sum + (a[i, k] * b[k, j]);
      vector[j] := sum;
    end;
    for k := 0 to (mb-1) do
      c[i, k] := vector[k];
  end;

  Result := c;
end;

procedure SumMatrix(var A: TMatrix; B: TMatrix; n,m: Integer);
var i, j: Integer;
begin
  for i := 0 to (n-1) do
    for j := 0 to (m-1) do
      A[i, j] := A[i, j] + B[i, j];
end;

procedure SubsMatrix(var A: TMatrix; B: TMatrix; n,m: Integer);
var i, j: Integer;
begin
  for i := 0 to (n-1) do
    for j := 0 to (m-1) do
      A[i, j] := A[i, j] - B[i, j];
end;

procedure SOLAE(var matrix: TMatrix; n, m: Integer);
var i, j: Integer;
begin
  triangle(matrix, n, m);
  for i := n-1 downTo 0 do
  begin
    for j := i + 1 to (m-2) do
      matrix[i, m-1] := matrix[i, m-1] - (matrix[j, m-1] * matrix[i, j]);

    matrix[i, m-1] := matrix[i, m-1] / matrix[i, i];
  end;
end;


{$R *.dfm}
procedure multipleNumber(var matrix: TMatrix; n: integer; m: integer; number: real);
var i, j: integer;
begin
  i := 0;
  j := 0;
  for i:= 0 to (n-1) do
    for j := 0 to (m-1) do
      matrix[i, j] := matrix[i, j] * number;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
Panel1.Enabled := false;
Panel2.Enabled:= false;
Edit6.Enabled:=false;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  //Edit3.Enabled := false;
  //Edit4.Enabled := false;
  case radiogroup1.ItemIndex of
    0, 1, 2, 3, 4, 5, 10: begin
      Panel2.Enabled := false;


      Panel1.Enabled := false;
    end;
    6: begin
      Panel1.Enabled := false;

      Panel2.Enabled := true;

    end;
    7: begin
      Panel2.Enabled := false;


      Panel1.Enabled := true;


      Edit5.Enabled := true;
    end;
    else begin
      Panel2.Enabled := false;


      Panel1.Enabled := true;

    end;
  end;
end;



procedure TForm1.BitBtn1Click(Sender: TObject);
var
  m, n, nb, mb, i, j, k,w: Integer;
  matrix, secMatrix: TMatrix;
  item: Real;
  s, s1: String;
begin
  Memo2.Clear;

  n:=StrToInt(Edit1.Text);
  m:=StrToInt(Edit2.Text);

  case radiogroup1.ItemIndex of
    10: m := m + 1;
  end;

  SetLength(matrix, n, m);

  for i:=0 to n-1 do
  begin
    s:=Memo1.Lines.Strings[i];
    for j:=0 to m-2 do
    begin
      s1:=copy(s,1,pos(' ',s)-1);
      matrix[i,j]:=StrToFloat(s1);
      delete(s,1,pos(' ',s));
    end;
    s1:=copy(s,1,length(s));
    matrix[i, m-1]:=StrToFloat(s1);
  end;

  case radiogroup1.ItemIndex of
  0:begin
    Edit6.Enabled:=true;
    w := StrToInt(Edit6.Text);//.Memo1.Lines.Strings[n];
    val(IntToStr(w), item ,k);
    if(k=0) then
    begin
      multipleNumber(matrix, n, m, item);
      printMatrix(matrix, n, m, Memo2);
    end else
      ShowMessage('!Enter number,Please!');
  end;
  1:begin
    Memo2.Lines.Add(FloatToStr(FDeterminant(matrix, n, m)));
  end;
  2:begin
    Memo2.Lines.Add(IntToStr(FRang(matrix, n, m)));
  end;
  3:begin
     invertMatrix(matrix, n, m);
     printMatrix(matrix, n, m, Memo2);
  end;
  4:begin
    printMatrix(TranspositionMatrix(matrix, n, m), m, n, Memo2);
  end;
  5:begin
    InverseMatrix(matrix, n, m);

    Memo2.Clear;

    for i:=0 to (n-1) do
    begin
      s := '';
      for j:=m to (m+m-1) do
        s := s + FloatToStrF(matrix[i, j], ffFixed, 5, 5) + ' ';

      Memo2.Lines.Add(Trim(s));
    end;
  end;
  6:begin
    SetLength(secMatrix, m, 1);

    s:=Edit5.Text;
    for j:=0 to (m-2) do
    begin
      s1:=copy(s,1,pos(' ',s)-1);
      secMatrix[j,0]:=StrToFloat(s1);
      delete(s,1,pos(' ',s));
    end;
    s1:=copy(s,1,length(s));
    secMatrix[m-1, 0]:=StrToFloat(s1);

    printMatrix(multWithMatrix(matrix, secmatrix, n, m, 1), n, 1, Memo2);
  end;
  7: begin
     mb := StrToInt(Edit4.Text);
     SetLength(secMatrix, n, mb);

     for i:=0 to n-1 do
     begin
      s:=Memo3.Lines.Strings[i];
      for j:=0 to mb-2 do
      begin
        s1:=copy(s,1,pos(' ',s)-1);
        secMatrix[i,j]:=StrToFloat(s1);
        delete(s,1,pos(' ',s));
      end;
      s1:=copy(s,1,length(s));
      secMatrix[i, mb-1]:=StrToFloat(s1);
     end;

     printMatrix(multWithMatrix(matrix, secMatrix, n, m, mb), n, mb, Memo2);
    end;
    8: begin // Matrix1 + Matrix2
      nb := StrToInt(Edit3.Text);
      mb := StrToInt(Edit4.Text);
      SetLength(secMatrix, nb, mb);

     for i:=0 to nb-1 do
     begin
      s:=Memo3.Lines.Strings[i];
      for j:=0 to mb-2 do
      begin
        s1:=copy(s,1,pos(' ',s)-1);
        secMatrix[i,j]:=StrToFloat(s1);
        delete(s,1,pos(' ',s));
      end;
      s1:=copy(s,1,length(s));
      secMatrix[i, mb-1]:=StrToFloat(s1);
     end;

     sumMatrix(matrix, secMatrix, nb, m);
     printMatrix(matrix, n, m, Memo2);
    end;
    9: begin // Matrix1 - Matrix2
      nb := StrToInt(Edit3.Text);
      mb := StrToInt(Edit4.Text);
      SetLength(secMatrix, nb, mb);

     for i:=0 to nb-1 do
     begin
      s:=Memo3.Lines.Strings[i];
      for j:=0 to mb-2 do
      begin
        s1:=copy(s,1,pos(' ',s)-1);
        secMatrix[i,j]:=StrToFloat(s1);
        delete(s,1,pos(' ',s));
      end;
      s1:=copy(s,1,length(s));
      secMatrix[i, mb-1]:=StrToFloat(s1);
     end;

     subsMatrix(matrix, secMatrix, nb, m);
     printMatrix(matrix, n, m, Memo2);
    end;
    10: begin // Disided SOLAE
      SOLAE(matrix, n, m);

      for i := 0 to (n-1) do
        Memo2.Lines.Add('x' + IntToStr(i+1) + ' = ' + FloatToStrF(matrix[i, m-1], ffFixed, 10, 10));
    end;
  end;

 end;
end.
