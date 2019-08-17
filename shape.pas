unit shape;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FGL, props, propman;

type
  TShapeType = (stCamera, stPointLight, stPlane, stCube, stCylinder, stSphere,
                stDoughnut, stLathe, stSOR, stCSG);

  TShape = class
  private
    _propertyManager: TPropertyManager;
    function GetDirty: boolean;
    function GetPropertyCount: integer;
  public
    constructor Create(stShape: TShapeType);
    destructor Destroy; override;
    function GetProperty(const name: string): TProperty;
    function GetProperty(index: integer): TProperty;

    class function MakeCamera(const name: string): TShape; static;
    class function MakePointLight(const name: string): TShape; static;

    property IsDirty: boolean read GetDirty;
    property PropertyCount: integer read GetPropertyCount;
  end;

  TShapeTypeProperty = specialize TReadOnlyProperty<TShapeType>;
  TShapeList = specialize TFPGObjectList<TShape>;

implementation

uses
  vector;

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

function TShape.GetPropertyCount: integer;
begin
  result := _propertyManager.Count;
end;

function TShape.GetProperty(const name: string): TProperty;
begin
  result := _propertyManager.FindProperty(name);
end;

function TShape.GetProperty(index: integer): TProperty;
begin
  result := _propertyManager.GetProperty(index);
end;

class function TShape.MakeCamera(const name: string): TShape;
var
  shape: TShape;
  nameProp: TStringProperty;
  vectorProp: TVectorProperty;

begin
  shape := TShape.Create(stCamera);

  nameProp := shape.GetProperty('Name') as TStringProperty;
  nameProp.Value := name;

  vectorProp := TVectorProperty.Create('Translation');
  vectorProp.Value := TVector.Create(0.0, 0.0, 0.0);
  shape._propertyManager.AddProperty('Translation', vectorProp);

  vectorProp := TVectorProperty.Create('LookAt');
  vectorProp.Value := TVector.Create(0.0, 0.0, -5.0);
  shape._propertyManager.AddProperty('LookAt', vectorProp);

  result := shape;
end;

class function TShape.MakePointLight(const name: string): TShape;
var
  shape: TShape;
  nameProp: TStringProperty;
  vectorProp: TVectorProperty;

begin
  shape := TShape.Create(stPointLight);

  nameProp := shape.GetProperty('Name') as TStringProperty;
  nameProp.Value := name;

  vectorProp := TVectorProperty.Create('Translation');
  vectorProp.Value := TVector.Create(0.0, 0.0, 0.0);
  shape._propertyManager.AddProperty('Translation', vectorProp);
  result := shape;
end;

end.

