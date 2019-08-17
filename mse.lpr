program mse;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, previewer, previewerwin, props, propman, shape, propgridhelper,
  proj, vector, projtreehelper, colour
  { you can add units after this };

{$R *.res}

begin
  Application.Scaled:=True;
  Application.Title:='Model Scene Editor';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

