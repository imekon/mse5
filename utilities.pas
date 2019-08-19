unit utilities;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TSingleArray = array of single;

function Copy(Const A: Array of Single; aStart: Integer; ACount: Integer = 1): TSingleArray;
function Deg2Rad(degrees: single): single;
function Rad2Deg(radians: single): single;

implementation

function Copy(Const A:Array of Single; aStart: Integer; ACount: Integer = 1): TSingleArray;
var
  I:Integer;

Begin
  SetLength(result, 0);
  If (Not AStart in [0..High(A)])or(Acount <= 0) then Exit;
  If ACount+AStart > Length(A) Then ACount := Length(A)-AStart;
  SetLength(Result, ACount);
  For I:= 0 To ACount - 1 do Result[I] := A[AStart + I];
End;

function Deg2Rad(degrees: single): single;
begin
  result := Pi * degrees / 180.0;
end;

function Rad2Deg(radians: single): single;
begin
  result := 180.0 / pi / radians;
end;

end.

