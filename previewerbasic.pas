unit previewerbasic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, ExtCtrls, previewer;

type
  TPreviewerBasic = class(TPreviewer)
  public
    constructor Create(paintBox: TPaintBox); override;
    destructor Destroy; override;

    procedure Paint; override;
  end;

implementation

constructor TPreviewerBasic.Create(paintBox: TPaintBox);
begin
  inherited Create(paintBox);
end;

destructor TPreviewerBasic.Destroy;
begin
  inherited;
end;

procedure TPreviewerBasic.Paint;
begin
  _paintBox.Canvas.TextOut(10, 10, TPreviewer.GetViewDescription(_view));
end;

end.

