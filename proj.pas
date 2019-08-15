unit proj;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shape;

type
  TProject = class
  private
    _shapes: TShapeList;
    _camera: TShape;
    _light: TShape;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TProject.Create;
begin
  _shapes := TShapeList.Create;

  _camera := TShape.MakeCamera('camera');
  _shapes.Add(_camera);

  _light := TShape.MakePointLight('light');
  _shapes.Add(_light);
end;

destructor TProject.Destroy;
begin
  inherited;
  _shapes.Free;
end;

end.

