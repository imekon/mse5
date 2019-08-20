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
var
  w, h: integer;

begin
  w := _paintBox.Width;
  h := _paintBox.Height;

  _paintBox.Canvas.TextOut(10, 10, TPreviewer.GetViewDescription(_view));

  with _paintBox.Canvas do
  begin
    Pen.Color := clGray;

    MoveTo(0, h div 2);
    LineTo(w, h div 2);

    MoveTo(w div 2, 0);
    LineTo(w div 2, h);
  end;
end;

end.

