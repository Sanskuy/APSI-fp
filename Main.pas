unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, Vcl.Imaging.pngimage,
  uniGUIBaseClasses, uniImage, uniLabel;

type
  TMainForm = class(TUniForm)
    UniImage1: TUniImage;
    UniImage2: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    UniImage5: TUniImage;
    btndtbibit: TUniImage;
    btndtpupuk: TUniImage;
    btndtburuh: TUniImage;
    icondtburuh: TUniImage;
    icondtpupuk: TUniImage;
    icondtbibit: TUniImage;
    UniImage12: TUniImage;
    UniLabel1: TUniLabel;
    UniImage13: TUniImage;
    UniImage14: TUniImage;
    UniImage15: TUniImage;
    lbuser: TUniLabel;
    procedure btndtbibitClick(Sender: TObject);
    procedure btndtpupukClick(Sender: TObject);
    procedure btndtburuhClick(Sender: TObject);
    procedure UniImage14Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniImage13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Udtbibit, Udtpupuk, Udtbtani;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
lbuser.Caption := UniMainModule.LoggedUser;
end;

procedure TMainForm.UniImage13Click(Sender: TObject);
begin
close;
end;

procedure TMainForm.UniImage14Click(Sender: TObject);
begin
  UniApplication.Cookies.SetCookie('_user','',Date-1);
	UniApplication.Cookies.SetCookie('_pass','',Date-1);
	UniApplication.Restart;
end;

procedure TMainForm.btndtbibitClick(Sender: TObject);
begin
fdtbibit.show();
mainform.Hide;
end;

procedure TMainForm.btndtpupukClick(Sender: TObject);
begin
fdtpupuk.Show();
mainform.Hide;
end;

procedure TMainForm.btndtburuhClick(Sender: TObject);
begin
fdtbtani.Show();
mainform.Hide;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
