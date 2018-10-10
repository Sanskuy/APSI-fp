unit Ukdtransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, Vcl.Imaging.pngimage, uniGUIBaseClasses,
  uniImage;

type
  Tfkdtransaksi = class(TUniForm)
    UniImage1: TUniImage;
    UniImage3: TUniImage;
    UniImage2: TUniImage;
    UniLabel1: TUniLabel;
    UniImage4: TUniImage;
    lbkd: TUniLabel;
    UniLabel2: TUniLabel;
    UniImage5: TUniImage;
    UniImage6: TUniImage;
    UniImage7: TUniImage;
    UniImage8: TUniImage;
    UniImage9: TUniImage;
    procedure UniImage6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fkdtransaksi: Tfkdtransaksi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main;

function fkdtransaksi: Tfkdtransaksi;
begin
  Result := Tfkdtransaksi(UniMainModule.GetFormInstance(Tfkdtransaksi));
end;

procedure Tfkdtransaksi.UniImage6Click(Sender: TObject);
begin
mainform.Show();
close;
end;

end.
