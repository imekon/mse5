unit proj;

{$DEFINE ENABLE_LOGGING}

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LazLoggerBase, props, shape;

type
  TProject = class
  private
    {$IFDEF ENABLE_LOGGING}
    _logging: TextFile;
    {$ENDIF}

    _shapes: TShapeList;
    _camera: TShape;
    _light: TShape;

    function GetShapeCount: integer;
    function GetShape(index: integer): TShape;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Dump;

    property ShapeCount: integer read GetShapeCount;
    property Shapes[index: integer]: TShape read GetShape;
  end;

implementation

constructor TProject.Create;
begin
  {$IFDEF ENABLE_LOGGING}
  Assign(_logging, 'output.log');
  Rewrite(_logging);
  WriteLn(_logging, 'MSE LOGGING');
  {$ENDIF}

  _shapes := TShapeList.Create;

  _camera := TShape.MakeCamera('camera');
  _shapes.Add(_camera);

  _light := TShape.MakePointLight('light');
  _shapes.Add(_light);

  Dump;
end;

destructor TProject.Destroy;
begin
  inherited;
  _shapes.Free;

  {$IFDEF ENABLE_LOGGING}
  Close(_logging);
  {$ENDIF}
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

procedure TProject.Dump;
{$IFDEF ENABLE_LOGGING}
var
  i: integer;
  shape: TShape;
  nameProperty: TStringProperty;
{$ENDIF}

begin
  {$IFDEF ENABLE_LOGGING}
  for i := 0 to _shapes.Count - 1 do
  begin
    shape := _shapes[i];
    nameProperty := shape.GetProperty('Name') as TStringProperty;
    WriteLn(_logging, nameProperty.Value);
  end;
  {$ENDIF}
end;

end.

