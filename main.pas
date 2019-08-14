unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ActnList, ExtCtrls, Grids,

  propgridhelper, proj,

{$IFDEF WINDOWS}
  previewerwin, Types;
{$ENDIF}

type

  { TMainForm }

  TMainForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnPropertyGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
  private
{$IFDEF WINDOWS}
    _previewer: TPreviewerWindows;
{$ENDIF}
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
  _propertyGridHelper := TPropertyGridHelper.Create(PropertyGrid);
  _project := TProject.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  _previewer.Free;
  _propertyGridHelper.Free;
  _project.Free;
end;

procedure TMainForm.OnPropertyGridDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
begin
  _propertyGridHelper.DrawGridCell(aCol, aRow, aRect, aState);
end;

end.

