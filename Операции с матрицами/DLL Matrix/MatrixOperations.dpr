library MatrixOperations;


uses
  System.SysUtils,
  System.Classes;

{$R *.res}

type
   TMatrix = array of array of Real;

procedure MultNumber(var matrix:TMatrix;n:Integer;m:Integer;number:Real);stdcall;
var i,j:Integer;
begin
  i:=0;
  j:=0;
  for i := 0 to (n-1) do
    for j := 0 to (m-1) do
      matrix[i,j] := matrix[i,j] * number;
end;

exports
  MultNumber;
begin
end.
