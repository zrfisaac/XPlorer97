// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit model_form;

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
  ExtCtrls;

type

  { TModelForm }

  TModelForm = class(TForm)
    pnBack: TPanel;
  end;

var
  ModelForm: TModelForm;

implementation

{$R *.lfm}

end.

