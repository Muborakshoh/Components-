library Project2;

uses
  SysUtils,Classes;
//перестановка эл-в
procedure Shuffle(var arr:array of Integer;size:Integer);
var i,temp,minIndex,maxIndex:Integer;
begin
minIndex:=0;
maxIndex:=0;
for i:=0 to High(arr) do
begin
if arr[i] < arr[minIndex] then
 minIndex:=i;
if arr[i] > arr[maxIndex] then
 maxIndex:=i;
end;
for i:=0 to High(arr) do
begin
if  arr[i] < 0 then
 arr[i]:=-arr[i];
end;
for i:=0 to High(arr) do
begin
temp:=arr[minIndex];
arr[minIndex]:=arr[maxIndex];
arr[maxIndex]:=arr[minIndex];
arr[maxIndex]:=temp;
end;
end;
//сортировка
procedure Sort(var arr:array of Integer;size:Integer);
var i,j,k:Integer;
begin
i:=1;
while (i<>0) do
begin
i:=0;
for j:=0 to size-2 do
if (arr[j]>arr[j+1]) then
begin
k:=arr[j];
arr[j]:=arr[j+1];
arr[j+1]:=k;
i:=1;
end;
end;
end;
//инвертирование
procedure Reverse(var arr:array of Integer;size:Integer);
var i:Integer;
begin
for i:=0 to size do
begin
arr[i]:=-arr[i];
end;
end;
//смена порядка
procedure Swap(var arr:array of Integer;size:Integer);
var i,temp:Integer;
begin
for i:=0 to (Length(arr)div 2) do
begin
temp:=arr[i];
arr[i]:=arr[Length(arr)-i-1];
arr[Length(arr)-i-1]:=temp;
end;
end;
//замена
procedure Replace(var arr:array of Integer;size:Integer;old_val:Integer;new_val:Integer);
var i:Integer;
begin
for i:=0 to size - 1 do
begin
if arr[i] = old_val then
begin
arr[i]:=new_val;
end;
end;
end;
exports
  Shuffle,
  Reverse,
  Sort,
  Swap,
  Replace;

begin
end.
