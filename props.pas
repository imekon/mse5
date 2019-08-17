unit props;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FGL;

type
  TProperty = class
  protected
    _name: string;
    _dirty: boolean;
    function GetDirty: boolean;
    function GetName: string;
  public
    constructor Create(const aName: string); virtual;
    destructor Destroy; override;
    property IsDirty: boolean read GetDirty;
    property Name: string read GetName;
  end;

  generic TReadOnlyProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
  public
    constructor Create(const aName: string; const value: T); virtual;
    property Value: T read GetValue;
  end;

  generic TValueProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
    procedure SetValue(value: T); virtual;
  public
    property Value: T read GetValue write SetValue;
  end;

  TProperties = specialize TFPGMap<string, TProperty>;

  TIntegerProperty = specialize TValueProperty<integer>;
  TFloatProperty = specialize TValueProperty<single>;
  TDoubleProperty = specialize TValueProperty<double>;
  TStringProperty = specialize TValueProperty<string>;

implementation

constructor TProperty.Create(const aName: string);
begin
  _name := aName;
  _dirty := false;
end;

destructor TProperty.Destroy;
begin
  inherited;
end;

function TProperty.GetDirty: boolean;
begin
  result := _dirty;
end;

function TProperty.GetName: string;
begin
  result := _name;
end;

constructor TReadOnlyProperty.Create(const aName: string; const value: T);
begin
  inherited Create(aName);
  _value := value;
end;

function TReadOnlyProperty.GetValue: T;
begin
  result := _value;
end;

function TValueProperty.GetValue: T;
begin
  result := _value;
end;

procedure TValueProperty.SetValue(value: T);
begin
  _value := value;
  _dirty := true;
end;

end.

