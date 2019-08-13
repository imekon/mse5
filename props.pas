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
  public
    constructor Create(name: string); virtual;
    destructor Destroy; override;
    property IsDirty: boolean read GetDirty;
  end;

  generic TReadOnlyProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
  public
    constructor Create(name: string; value: T); virtual;
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

constructor TProperty.Create(name: string);
begin
  _name := name;
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

constructor TReadOnlyProperty.Create(name: string; value: T);
begin
  inherited Create(name);
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

