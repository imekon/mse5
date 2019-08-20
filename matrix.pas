unit matrix;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TMatrix }

  generic TMatrix<T> = class
  private
  protected
    _data: array [0..3, 0..3] of T;
    function GetData(x, y: integer): T;
    procedure SetData(x, y: integer; AValue: T);
  public
    constructor Create;
    class function Identity: TMatrix; static;
    class function Translate(x, y, z: T): TMatrix; static;
    class function Scale(scaling: T): TMatrix; static;
    class function RotateX(angle: T): TMatrix; static;
    class function RotateY(angle: T): TMatrix; static;
    class function RotateZ(angle: T): TMatrix; static;

    class function Multiply(a, b: TMatrix): TMatrix; static;

    property Data[x, y: integer]: T read GetData write SetData;
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

procedure TMatrix.SetData(x, y: integer; AValue: T);
begin
  _data[x, y] := avalue;
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
var
  sinA, cosA: single;

begin
  sinA := sin(angle);
  cosA := cos(angle);

  result := TMatrix.Identity;
  result._data[1, 1] := cosA;
  result._data[2, 1] := -sinA;
  result._data[1, 2] := sinA;
  result._data[2, 2] := cosA;
end;

class function TMatrix.RotateY(angle: T): TMatrix;
var
  sinA, cosA: single;

begin
  sinA := sin(angle);
  cosA := cos(angle);

  result := TMatrix.Identity;
  result._data[0, 0] := cosA;
  result._data[2, 0] := sinA;
  result._data[0, 2] := -sinA;
  result._data[2, 2] := cosA;
end;

class function TMatrix.RotateZ(angle: T): TMatrix;
var
  sinA, cosA: single;

begin
  sinA := sin(angle);
  cosA := cos(angle);

  result := TMatrix.Identity;
  result._data[0, 0] := cosA;
  result._data[1, 0] := -sinA;
  result._data[0, 1] := sinA;
  result._data[1, 1] := cosA;
end;

class function TMatrix.Multiply(a, b: TMatrix): TMatrix;
var
  i, j, k: integer;
  sum: single;

begin
  result := TMatrix.Identity;

  for i := 0 to 3 do
  begin
    for j := 0 to 3 do
    begin
      sum := 0;
      for k := 0 to 3 do
      begin
        sum := sum + a.Data[i, k] + b.Data[j, k];
      end;
      result.Data[i, j] := sum;
    end;
  end;

end;

end.
