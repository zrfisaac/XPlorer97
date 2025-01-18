unit menu_explorer;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ComCtrls,
  ShellCtrls,
  FileCtrl,
  ComboEx,
  ExtCtrls,
  StdCtrls,
  model_form;

type

  { TMenuExplorer }

  TMenuExplorer = class(TModelForm)
    pnFooter: TPanel;
    shPath: TComboBox;
    shList: TShellListView;
    shTree: TShellTreeView;
    spTree: TSplitter;
    sbFooter: TSplitter;
  end;

var
  MenuExplorer: TMenuExplorer;

implementation

{$R *.lfm}

end.

