unit graphic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FGL, vector;

type
  TTriangle = class
  private
    _pt1, _pt2, _pt3: TVector;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetPoints(points: array of single);

    property PT1: TVector read _pt1;
    property PT2: TVector read _pt2;
    property PT3: TVector read _pt3;
  end;

  TTriangleList = specialize TFPGObjectList<TTriangle>;

  TGraphic = class
  private
    _triangles: TTriangleList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddTriangles(points: array of single);
  end;

implementation

constructor TTriangle.Create;
begin
  _pt1 := TVector.Create;
  _pt2 := TVector.Create;
  _pt3 := TVector.Create;
end;

destructor TTriangle.Destroy;
begin
  _pt1.Free;
  _pt2.free;
  _pt3.Free;
end;

procedure TTriangle.SetPoints(points: array of single);
begin
  if Length(points) <> 9 then exit;

  _pt1.x := points[0];
  _pt1.y := points[1];
  _pt1.z := points[2];

  _pt2.x := points[3];
  _pt2.y := points[4];
  _pt2.z := points[5];

  _pt3.x := points[6];
  _pt3.y := points[7];
  _pt3.z := points[8];
end;

constructor TGraphic.Create;
begin
  _triangles := TTriangleList.Create;
end;

destructor TGraphic.Destroy;
begin
  _triangles.Free;
end;

procedure TGraphic.AddTriangles(points: array of single);
var
  i: integer;
  triangle: TTriangle;

begin
  i := 0;
  while i < Length(points) - 1 do
  begin
    triangle := TTriangle.Create;
    triangle.SetPoints(Slice(points, 9));

    inc(i, 9)
  end;
end;

end.

