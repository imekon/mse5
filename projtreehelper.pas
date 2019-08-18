unit projtreehelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ComCtrls, proj, shape;

type
  TProjectTreeHelper = class
  private
    _project: TProject;
    _treeView: TTreeView;
    _selected: TShape;
  public
    constructor Create(treeView: TTreeView; project: TProject);
    destructor Destroy; override;

    procedure BuildTree;
    procedure SelectionChanged;

    property Selected: TShape read _selected;
  end;

implementation

uses
  props;

constructor TProjectTreeHelper.Create(treeView: TTreeView; project: TProject);
begin
  _treeView := treeView;
  _project := project;
end;

destructor TProjectTreeHelper.Destroy;
begin

end;

procedure TProjectTreeHelper.BuildTree;
var
  i: integer;
  shape: TShape;
  root, node: TTreeNode;
  nameProperty: TStringProperty;

begin
  _treeView.Items.Clear;
  root := _treeView.Items.Add(nil, 'Project');
  root.Data := nil;

  for i := 0 to _project.ShapeCount - 1 do
  begin
    shape := _project.Shapes[i];
    nameProperty := shape.GetProperty('Name') as TStringProperty;
    node := _treeView.Items.AddChild(root, nameProperty.Value);
    node.Data := shape;
  end;

  root.Expand(true);
end;

procedure TProjectTreeHelper.SelectionChanged;
begin
  _selected := TShape(_treeView.Selected.Data);
end;

end.

