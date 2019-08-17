unit vector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, props;

type
  TVector = class
  private
    _x, _y, _z: single;
  public
    constructor Create; overload;
    constructor Create(x, y, z: single); overload;
    destructor Destroy; override;

    class function GetDescription(vector: TVector): string;

    property X: single read _x write _x;
    property Y: single read _y write _y;
    property Z: single read _z write _z;
  end;

  TVectorProperty = specialize TValueProperty<TVector>;

implementation

constructor TVector.Create;
begin
  _x := 0.0;
  _y := 0.0;
  _z := 0.0;
end;

constructor TVector.Create(x, y, z: single);
begin
 _x := x;
 _y := y;
 _z := z;
end;

destructor TVector.Destroy;
begin
  inherited;
end;

class function TVector.GetDescription(vector: TVector): string;
begin
  result := Format('%1.2f %1.2f %1.2f', [vector.X, vector.Y, vector.Z]);
end;

end.

