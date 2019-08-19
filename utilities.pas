unit utilities;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TSingleArray = array of single;

function Copy(Const A:Array of Single; aStart: Integer; ACount: Integer = 1): TSingleArray;

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

end.

