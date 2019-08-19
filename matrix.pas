unit matrix;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TMatrix = class
  private
    _data: array[0..3, 0..3] of single;
  public
    constructor Create;

    class function MakeIdentity: TMatrix; static;
  end;

implementation

constructor TMatrix.Create;
var
  x, y: integer;

begin
  for y := 0 to 3 do
    for x := 0 to 3 do
      _data[x, y] := 0.0;
end;

class function TMatrix.MakeIdentity: TMatrix;
begin
  result := TMatrix.Create;
  result._data[0, 0] := 1.0;
  result._data[1, 1] := 1.0;
  result._data[2, 2] := 1.0;
  result._data[3, 3] := 1.0;
end;

end.

