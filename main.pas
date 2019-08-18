unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ActnList, ExtCtrls, Grids,

  projtreehelper, propgridhelper, proj,

{$IFDEF WINDOWS}
  previewerbasic, Types;
{$ENDIF}

type

  { TMainForm }

  TMainForm = class(TForm)
    BottomViewAction: TAction;
    TopViewAction: TAction;
    RightViewAction: TAction;
    LeftViewAction: TAction;
    BackViewAction: TAction;
    FrontViewAction: TAction;
    CameraViewAction: TAction;
    FileExitAction: TAction;
    FileSaveAsAction: TAction;
    FileSaveAction: TAction;
    FileOpenAction: TAction;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N1: TMenuItem;
    PreviewBox: TPaintBox;
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
    procedure OnBackView(Sender: TObject);
    procedure OnBottomView(Sender: TObject);
    procedure OnCameraView(Sender: TObject);
    procedure OnFileExit(Sender: TObject);
    procedure OnFileNew(Sender: TObject);
    procedure OnFileOpen(Sender: TObject);
    procedure OnFileSave(Sender: TObject);
    procedure OnFileSaveAs(Sender: TObject);
    procedure OnFrontView(Sender: TObject);
    procedure OnLeftView(Sender: TObject);
    procedure OnPreviewerPaint(Sender: TObject);
    procedure OnProjectSelectionChanged(Sender: TObject);
    procedure OnPropertyGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure OnRightView(Sender: TObject);
    procedure OnTopView(Sender: TObject);
  private
{$IFDEF WINDOWS}
    _previewer: TPreviewerBasic;
{$ENDIF}

    _projectTreeHelper: TProjectTreeHelper;
    _propertyGridHelper: TPropertyGridHelper;

    _project: TProject;
  public

  end;

var
  MainForm: TMainForm;

implementation

uses
  previewer;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF WINDOWS}
  _previewer := TPreviewerBasic.Create(PreviewBox);
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

procedure TMainForm.OnBackView(Sender: TObject);
begin
  _previewer.View := pvBack;
end;

procedure TMainForm.OnBottomView(Sender: TObject);
begin
  _previewer.View := pvBottom;
end;

procedure TMainForm.OnCameraView(Sender: TObject);
begin
  _previewer.View := pvCamera;
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

procedure TMainForm.OnFrontView(Sender: TObject);
begin
  _previewer.View := pvFront;
end;

procedure TMainForm.OnLeftView(Sender: TObject);
begin
  _previewer.View := pvLeft;
end;

procedure TMainForm.OnPreviewerPaint(Sender: TObject);
begin
  _previewer.Paint;
end;

procedure TMainForm.OnRightView(Sender: TObject);
begin
  _previewer.View := pvRight;
end;

procedure TMainForm.OnTopView(Sender: TObject);
begin
  _previewer.View := pvTop;
end;

procedure TMainForm.OnProjectSelectionChanged(Sender: TObject);
begin
  _projectTreeHelper.SelectionChanged;
  _propertyGridHelper.Selected := _projectTreeHelper.Selected;
end;

procedure TMainForm.OnPropertyGridDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
begin
  _propertyGridHelper.DrawGridCell(aCol, aRow, aRect, aState);
end;

end.

