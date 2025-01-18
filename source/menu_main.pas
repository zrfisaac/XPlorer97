// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_main;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  Menus,
  ComCtrls,
  model_form;

type

  { TMenuMain }

  TMenuMain = class(TForm)
    miConfig: TMenuItem;
    miAbout: TMenuItem;
    miHelp: TMenuItem;
    miMenu: TMainMenu;
    pnBack: TPanel;
    sbFooter: TStatusBar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMenu: TModelForm;
  public
    procedure Clean;
    procedure Clean(AClass: TComponentClass; var AReference); overload;
    procedure Clean(var AReference; AClass: TComponentClass); overload;
    procedure Menu(AClass: TComponentClass; var AReference); overload;
    procedure Menu(var AReference; AClass: TComponentClass); overload;
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  menu_explorer;

{$R *.lfm}

{ TMenuMain }

procedure TMenuMain.FormShow(Sender: TObject);
begin
  Self.Menu(TMenuExplorer, MenuExplorer);
end;

procedure TMenuMain.Clean;
begin
  if (Assigned(FMenu)) then
    TModelForm(FMenu).pnBack.Parent := TWinControl(TModelForm(FMenu).pnBack.Owner);
  Self.FMenu := nil;
end;

procedure TMenuMain.Clean(AClass: TComponentClass; var AReference);
begin
  if (Assigned(TModelForm(AReference))) then
  begin
    TModelForm(AReference).Close;
    TModelForm(AReference) := Nil;
  end;
end;

procedure TMenuMain.Clean(var AReference; AClass: TComponentClass);
begin
  Self.Clean(AClass, AReference);
end;

procedure TMenuMain.Menu(AClass: TComponentClass; var AReference);
var
  AInstance: TModelForm;
begin
  if (AClass.InheritsFrom(TModelForm)) then
  begin
    if not(Assigned(TModelForm(AReference))) then
    begin
      AInstance := TModelForm(AClass.NewInstance);
      TModelForm(AReference) := AInstance;
      AInstance.Create(Application);
    end;
    AInstance := TModelForm(AReference);
    FMenu := AInstance;
    FMenu.pnBack.Parent := Self.pnBack;
  end;
end;

procedure TMenuMain.Menu(var AReference; AClass: TComponentClass);
begin
  Self.Menu(AClass, AReference);
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  Self.Caption := Application.Title;
end;

procedure TMenuMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Self.Clean;
  Self.Clean(TMenuExplorer, MenuExplorer);
end;

end.

