unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ActnList,

{$IFDEF WINDOWS}
  previewerwin;
{$ENDIF}

type

  { TMainForm }

  TMainForm = class(TForm)
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
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
  private
{$IFDEF WINDOWS}
    _previewer: TPreviewerWindows;
{$ENDIF}
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

end.

