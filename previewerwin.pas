unit previewerwin;

{$mode objfpc}{$H+}

interface

{$IFDEF WINDOWS}
uses
  Classes, SysUtils, previewer;

type
  TPreviewerWindows = class(TPreviewer)
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

{$ENDIF}

implementation

{$IFDEF WINDOWS}
constructor TPreviewerWindows.Create;
begin

end;

destructor TPreviewerWindows.Destroy;
begin
  inherited;
end;
{$ENDIF}

end.

