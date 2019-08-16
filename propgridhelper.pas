unit propgridhelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Grids, props, shape;

type
  TPropertyGridHelper = class
  private
    _grid: TDrawGrid;
    _selected: TShape;
    function GetSelected: TShape;
    procedure SetSelected(shape: TShape);
  public
    constructor Create(grid: TDrawGrid);
    destructor Destroy; override;
    procedure DrawGridCell(aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    property Selected: TShape read GetSelected write SetSelected;
  end;

implementation

constructor TPropertyGridHelper.Create(grid: TDrawGrid);
begin
  _grid := grid;
  _selected := nil;
end;

destructor TPropertyGridHelper.Destroy;
begin
  inherited;
end;

function TPropertyGridHelper.GetSelected: TShape;
begin
  result := _selected;
end;

procedure TPropertyGridHelper.SetSelected(shape: TShape);
begin
  _selected := shape;

  if shape = nil then
  begin
    _grid.RowCount := 5;
    exit;
  end;

  _grid.RowCount := shape.PropertyCount + 1;
end;

procedure TPropertyGridHelper.DrawGridCell(aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  prop: TProperty;

begin
  with _grid.Canvas do
  begin
    if aRow > 0 then
    begin
      if _selected = nil then exit;

      prop := _selected.GetProperty(aRow - 1);

      case aCol of
        0: TextOut(aRect.Left + 5, aRect.Top + 2, prop.Name);
        1: TextOut(aRect.Left + 5, aRect.Top + 2, 'XXX');
      end;
    end
    else
    begin
      case aCol of
        0: TextOut(aRect.Left + 5, aRect.Top + 2, 'Name');
        1: TextOut(aRect.Left + 5, aRect.Top + 2, 'Value');
      end;
    end;
  end;
end;

end.

