unit polygon;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, utilities, vector, triangle;

type

  { TPolygon }

  TPolygon = class
  private
    _triangles: array of TTriangle;
  public
    constructor Create(pts: array of single);
  end;

implementation

{ TPolygon }

constructor TPolygon.Create(pts: array of single);
var
  i, num: integer;

begin
  num := Length(pts) div 9;
  SetLength(_triangles, num);
  for i := 0 to num - 1 do
    _triangles[i] := TTriangle.Create(Copy(pts, i * 9, 9));
end;

end.

