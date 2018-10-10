unit Ubookingbtani;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniLabel;

type
  Tfbookbtani = class(TUniForm)
    UniImage1: TUniImage;
    UniImage3: TUniImage;
    UniImage14: TUniImage;
    UniImage13: TUniImage;
    UniImage6: TUniImage;
    UniImage15: TUniImage;
    UniLabel2: TUniLabel;
    lbnik: TUniLabel;
    bar1: TUniImage;
    UniLabel3: TUniLabel;
    lbnama: TUniLabel;
    bar2: TUniImage;
    UniLabel1: TUniLabel;
    lbttl: TUniLabel;
    bar3: TUniImage;
    UniLabel4: TUniLabel;
    lbjk: TUniLabel;
    bar4: TUniImage;
    UniLabel5: TUniLabel;
    lbalamat: TUniLabel;
    bar5: TUniImage;
    UniLabel6: TUniLabel;
    lbbio: TUniLabel;
    bar6: TUniImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fbookbtani: Tfbookbtani;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Udtbtani;

function fbookbtani: Tfbookbtani;
begin
  Result := Tfbookbtani(UniMainModule.GetFormInstance(Tfbookbtani));
end;

end.
