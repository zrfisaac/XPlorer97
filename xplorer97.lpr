program xplorer97;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, menu_main, model_form, menu_explorer
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='XPlorer97';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.

