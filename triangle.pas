unit triangle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, vector;

type

  { TTriangle }

  TTriangle = class
  private
    _pt1, _pt2, _pt3: TVector;
  public
    constructor Create(pts: array of single);
    destructor Destroy; override;
  end;

implementation

{ TTriangle }

constructor TTriangle.Create(pts: array of single);
begin
  _pt1 := TVector.Create(pts[0], pts[1], pts[2]);
  _pt2 := TVector.Create(pts[3], pts[4], pts[5]);
  _pt3 := TVector.Create(pts[6], pts[7], pts[8]);
end;

destructor TTriangle.Destroy;
begin
  _pt1.Free;
  _pt2.Free;
  _pt3.Free;
  inherited Destroy;
end;

end.

