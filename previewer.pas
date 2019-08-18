unit previewer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, ExtCtrls;

type
  TPreviewerView = (pvCamera, pvTop, pvBottom, pvFront, pvBack, pvLeft, pvRight);

  TPreviewer = class
  protected
    _view: TPreviewerView;
    _paintBox: TPaintBox;
    procedure SetView(aView: TPreviewerView);
  public
    constructor Create(paintBox: TPaintBox); virtual;
    destructor Destroy; override;

    procedure Paint; virtual; abstract;

    class function GetViewDescription(view: TPreviewerView): string; static;

    property View: TPreviewerView read _view write SetView;
  end;

implementation

constructor TPreviewer.Create(paintBox: TPaintBox);
begin
  _view := pvFront;
  _paintBox := paintBox;
end;

destructor TPreviewer.Destroy;
begin
  inherited;
end;

procedure TPreviewer.SetView(aView: TPreviewerView);
begin
  _view := aView;
  _paintBox.Refresh;
end;

class function TPreviewer.GetViewDescription(view: TPreviewerView): string;
begin
  case view of
    pvCamera:   result := 'Camera';
    pvFront:    result := 'Front';
    pvBack:     result := 'Back';
    pvLeft:     result := 'Left';
    pvRight:    result := 'Right';
    pvTop:      result := 'Top';
    pvBottom:   result := 'Bottom';
  end;
end;

end.

