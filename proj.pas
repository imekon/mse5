unit proj;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shape;

type
  TProject = class
  private
    _shapes: TShapeList;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TProject.Create;
begin
  _shapes := TShapeList.Create;
end;

destructor TProject.Destroy;
begin
  inherited;
  _shapes.Free;
end;

end.

