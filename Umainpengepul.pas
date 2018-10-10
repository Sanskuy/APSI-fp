unit Umainpengepul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, Vcl.Imaging.pngimage, uniGUIBaseClasses,
  uniImage;

type
  TMainPengepul = class(TUniForm)
    UniImage1: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    UniImage5: TUniImage;
    UniImage12: TUniImage;
    UniImage2: TUniImage;
    UniImage13: TUniImage;
    lbuser: TUniLabel;
    UniImage15: TUniImage;
    UniImage14: TUniImage;
    UniImage6: TUniImage;
    UniImage9: TUniImage;
    UniImage7: TUniImage;
    UniImage10: TUniImage;
    UniImage8: TUniImage;
    UniImage11: TUniImage;
    UniLabel1: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniImage14Click(Sender: TObject);
    procedure UniImage13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainPengepul: TMainPengepul;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function MainPengepul: TMainPengepul;
begin
  Result := TMainPengepul(UniMainModule.GetFormInstance(TMainPengepul));
end;

procedure TMainPengepul.UniFormShow(Sender: TObject);
begin
lbuser.Caption := UniMainModule.LoggedUser;
end;

procedure TMainPengepul.UniImage13Click(Sender: TObject);
begin
close;
end;

procedure TMainPengepul.UniImage14Click(Sender: TObject);
begin
  UniApplication.Cookies.SetCookie('_user','',Date-1);
	UniApplication.Cookies.SetCookie('_pass','',Date-1);
	UniApplication.Restart;
end;

end.
