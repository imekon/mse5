unit colour;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, props;

type
  TColour = class
  private
    _red, _green, _blue: single;
  public
    constructor Create;
    constructor Create(r, g, b: single);

    class function GetDescription(colour: TColour): string;

    property Red: single read _red write _red;
    property Green: single read _green write _green;
    property Blue: single read _blue write _blue;
  end;

  TColourProperty = specialize TValueProperty<TColour>;

implementation

constructor TColour.Create;
begin
  _red := 1.0;
  _green := 1.0;
  _blue := 1.0;
end;

constructor TColour.Create(r, g, b: single);
begin
  _red := r;
  _green := g;
  _blue := b;
end;

class function TColour.GetDescription(colour: TColour): string;
begin
  result := Format('%1.2f %1.2f %1.2f', [colour.Red, colour.Green, colour.Blue]);
end;

end.

