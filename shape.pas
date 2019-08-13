unit shape;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, props, propman;

type
  TShapeType = (stCamera, stPointLight, stPlane, stCube, stCylinder, stSphere,
                stDoughnut, stLathe, stSOR, stCSG);

  TShape = class
  private
    _propertyManager: TPropertyManager;
    function GetDirty: boolean;
  public
    constructor Create(stShape: TShapeType);
    destructor Destroy; override;
    property IsDirty: boolean read GetDirty;
  end;

  TShapeTypeProperty = specialize TReadOnlyProperty<TShapeType>;

implementation

constructor TShape.Create(stShape: TShapeType);
begin
  _propertyManager := TPropertyManager.Create;
  _propertyManager.AddProperty('Type', TShapeTypeProperty.Create('Type', stShape));
  _propertyManager.AddProperty('Name', TStringProperty.Create('Name'));
end;

destructor TShape.Destroy;
begin
  inherited;
  _propertyManager.Free;
end;

function TShape.GetDirty: boolean;
begin
  result := _propertyManager.IsDirty;
end;

end.

