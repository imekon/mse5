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
    constructor Create(const aName: string); virtual;
    destructor Destroy; override;
    function ToString: string; override;
    property IsDirty: boolean read GetDirty;
    property Name: string read _name;
  end;

  generic TReadOnlyProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
  public
    constructor Create(const aName: string; value: T); virtual;
    function ToString: string; override;
    property Value: T read GetValue;
  end;

  generic TValueProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
    procedure SetValue(value: T); virtual;
  public
    function ToString: string; override;
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

function TProperty.ToString: string;
begin
  result := 'BASE';
end;

constructor TReadOnlyProperty.Create(const aName: string; value: T);
begin
  inherited Create(aName);
  _value := value;
end;

function TReadOnlyProperty.GetValue: T;
begin
  result := _value;
end;

function TReadOnlyProperty.ToString: string;
begin
  result := 'READ ONLY';
end;

function TValueProperty.GetValue: T;
begin
  result := _value;
end;

function TValueProperty.ToString: string;
begin
  result := 'VALUE';
end;

procedure TValueProperty.SetValue(value: T);
begin
  _value := value;
  _dirty := true;
end;

end.

