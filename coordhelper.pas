unit coordhelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, previewer, vector;

type
  TCoordinateViewHelper = class
  public
    class function Map(vector: TVector; view: TPreviewerView): TPoint; static;
  end;

implementation

class function TCoordinateViewHelper.Map(vector: TVector; view: TPreviewerView): TPoint;
var
  point: TPoint;

begin
  case view of
    pvFront:
      begin
        point.X := integer(vector.X);
        point.Y := integer(vector.Y);
      end;
    pvBack:
      begin
        point.X := -integer(vector.X);
        point.Y := integer(vector.Y);
      end;
    pvTop:
      begin
        point.X := integer(vector.X);
        point.Y := integer(vector.Z);
      end;
    pvBottom:
      begin
        point.X := -integer(vector.X);
        point.Y := integer(vector.Z);
      end;
    pvLeft:
      begin
        point.X := integer(vector.Z);
        point.Y := integer(vector.Y);
      end;
    pvRight:
      begin
        point.X := -integer(vector.Z);
        point.Y := integer(vector.Y);
      end;
  end;

  result := point;
end;

end.

