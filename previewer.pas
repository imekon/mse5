unit previewer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TPreviewer = class
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

implementation

constructor TPreviewer.Create;
begin

end;

destructor TPreviewer.Destroy;
begin
  inherited;
end;

end.

