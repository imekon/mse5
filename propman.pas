unit propman;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, props;

type
  TPropertyManager = class
  private
    _properties: TProperties;
    function GetDirty: boolean;
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    function FindProperty(name: string): TProperty;
    procedure AddProperty(name: string; prop: TProperty);

    property IsDirty: boolean read GetDirty;
    property Count: integer read GetCount;
  end;

implementation

constructor TPropertyManager.Create;
begin
  _properties := TProperties.Create;
end;

destructor TPropertyManager.Destroy;
begin
  inherited;
  _properties.Free;
end;

function TPropertyManager.GetDirty: boolean;
var
  i: integer;
  prop: TProperty;

begin
  result := false;
  for i := 0 to _properties.Count do
  begin
    prop := TProperty(_properties.Items[i]);
    if prop.IsDirty then
    begin
       result := true;
       exit;
    end;
  end;
end;

function TPropertyManager.GetCount: integer;
begin
  result := _properties.Count;
end;

function TPropertyManager.FindProperty(name: string): TProperty;
begin
  result := _properties[name];
end;

procedure TPropertyManager.AddProperty(name: string; prop: TProperty);
begin
  _properties[name] := prop;
end;

end.

