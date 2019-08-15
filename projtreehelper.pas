unit projtreehelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ComCtrls, proj;

type
  TProjectTreeHelper = class
  private
    _project: TProject;
    _treeView: TTreeView;
  public
    constructor Create(treeView: TTreeView; project: TProject);
    destructor Destroy; override;

    procedure BuildTree;
  end;

implementation

uses
  shape, props;

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
end;

end.

