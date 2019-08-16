unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ActnList, ExtCtrls, Grids,

  projtreehelper, propgridhelper, proj,

{$IFDEF WINDOWS}
  previewerwin, Types;
{$ENDIF}

type

  { TMainForm }

  TMainForm = class(TForm)
    FileExitAction: TAction;
    FileSaveAsAction: TAction;
    FileSaveAction: TAction;
    FileOpenAction: TAction;
    PropertyGrid: TDrawGrid;
    FileNewAction: TAction;
    ActionList: TActionList;
    ImageList: TImageList;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    ProjectPanel: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ProjectTree: TTreeView;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnFileExit(Sender: TObject);
    procedure OnFileNew(Sender: TObject);
    procedure OnFileOpen(Sender: TObject);
    procedure OnFileSave(Sender: TObject);
    procedure OnFileSaveAs(Sender: TObject);
    procedure OnProjectSelectionChanged(Sender: TObject);
    procedure OnPropertyGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
  private
{$IFDEF WINDOWS}
    _previewer: TPreviewerWindows;
{$ENDIF}

    _projectTreeHelper: TProjectTreeHelper;
    _propertyGridHelper: TPropertyGridHelper;

    _project: TProject;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF WINDOWS}
  _previewer := TPreviewerWindows.Create;
{$ENDIF}

  _project := TProject.Create;
  _projectTreeHelper := TProjectTreeHelper.Create(ProjectTree, _project);
  _propertyGridHelper := TPropertyGridHelper.Create(PropertyGrid);

  _projectTreeHelper.BuildTree;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  _previewer.Free;
  _propertyGridHelper.Free;
  _projectTreeHelper.Free;
  _project.Free;
end;

procedure TMainForm.OnFileExit(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.OnFileNew(Sender: TObject);
begin
  //
end;

procedure TMainForm.OnFileOpen(Sender: TObject);
begin
  //
end;

procedure TMainForm.OnFileSave(Sender: TObject);
begin
  //
end;

procedure TMainForm.OnFileSaveAs(Sender: TObject);
begin
  //
end;

procedure TMainForm.OnProjectSelectionChanged(Sender: TObject);
begin
  _projectTreeHelper.SelectionChanged;
  _propertyGridHelper.Selected := _projectTreeHelper.Selected;
  _project.Dump;
end;

procedure TMainForm.OnPropertyGridDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
begin
  _propertyGridHelper.DrawGridCell(aCol, aRow, aRect, aState);
end;

end.

