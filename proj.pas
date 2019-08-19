unit proj;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LazLoggerBase, shape;

type
  TProject = class
  private
    _shapes: TShapeList;
    _camera: TShape;
    _light: TShape;

    function GetShapeCount: integer;
    function GetShape(index: integer): TShape;
  public
    constructor Create;
    destructor Destroy; override;

    property ShapeCount: integer read GetShapeCount;
    property Shapes[index: integer]: TShape read GetShape;
  end;

implementation

constructor TProject.Create;
var
  shape: TShape;

begin
  _shapes := TShapeList.Create;

  _camera := TShape.MakeCamera('camera');
  _shapes.Add(_camera);

  _light := TShape.MakePointLight('light');
  _shapes.Add(_light);

  shape := TShape.MakeGeneralShape('cube', stCube);
  _shapes.Add(shape);

  shape := TShape.MakeGeneralShape('plane', stPlane);
  _shapes.Add(shape);
end;

destructor TProject.Destroy;
begin
  inherited;
  _shapes.Free;
end;

function TProject.GetShapeCount: integer;
begin
  result := _shapes.Count;
end;

function TProject.GetShape(index: integer): TShape;
begin
  if (index < 0) or (index >= _shapes.Count) then
  begin
    result := nil;
    exit;
  end;

  result := _shapes[index];
end;

end.

