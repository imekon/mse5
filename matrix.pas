unit matrix;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  generic TMatrix<T> = class
  protected
    _data: array [0..3, 0..3] of T;
    function GetData(x, y: integer): T;
  public
    constructor Create;
    class function Identity: TMatrix; static;
    class function Translate(x, y, z: T): TMatrix; static;
    class function Scale(scaling: T): TMatrix; static;
    class function RotateX(angle: T): TMatrix; static;
    class function RotateY(angle: T): TMatrix; static;
    class function RotateZ(angle: T): TMatrix; static;

    property Data[x, y: integer]: T read GetData;
  end;

  TSingleMatrix = specialize TMatrix<single>;
  TDoubleMatrix = specialize TMatrix<double>;

implementation

constructor TMatrix.Create;
var
  x, y: integer;

begin
  for y := 0 to 3 do
    for x := 0 to 3 do
      _data[x, y] := 0;
end;

function TMatrix.GetData(x, y: integer): T;
begin
  result := _data[x, y];
end;

class function TMatrix.Identity: TMatrix;
begin
  result := TMatrix.Create;
  result._data[0, 0] := 1;
  result._data[1, 1] := 1;
  result._data[2, 2] := 1;
  result._data[3, 3] := 1;
end;

class function TMatrix.Translate(x, y, z: T): TMatrix;
begin
  result := TMatrix.Identity;

  result._data[3, 0] := x;
  result._data[3, 1] := y;
  result._data[3, 2] := z;
end;

class function TMatrix.Scale(scaling: T): TMatrix;
begin
  result := TMatrix.Create;
  result._data[0, 0] := scaling;
  result._data[1, 1] := scaling;
  result._data[2, 2] := scaling;
  result._data[3, 3] := 1;
end;

class function TMatrix.RotateX(angle: T): TMatrix;
begin

end;

class function TMatrix.RotateY(angle: T): TMatrix;
begin

end;

class function TMatrix.RotateZ(angle: T): TMatrix;
begin

end;

end.
