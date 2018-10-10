unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, Vcl.Imaging.pngimage,
  uniGUIBaseClasses, uniImage, uniLabel, uniEdit, uniCheckBox;

type
  Tflogin = class(TUniLoginForm)
    UniImage1: TUniImage;
    btnlog: TUniImage;
    UniLabel1: TUniLabel;
    btndaftar: TUniImage;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    edtuser: TUniEdit;
    edtpw: TUniEdit;
    login: TUniImage;
    checklogin: TUniCheckBox;
    procedure btndaftarClick(Sender: TObject);
    procedure btnlogClick(Sender: TObject);
    procedure UniImage4Click(Sender: TObject);
    procedure loginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function flogin: Tflogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Main, Uregistrasi, Umainpengepul;

function flogin: Tflogin;
begin
  Result := Tflogin(UniMainModule.GetFormInstance(Tflogin));
end;

procedure Tflogin.btnlogClick(Sender: TObject);
begin
//ModalResult := mrOK;
edtuser.Visible:=true;
edtpw.Visible:=true;
btnlog.Visible:=false;
btndaftar.Visible:=false;
login.Visible:=true;
end;

procedure Tflogin.loginClick(Sender: TObject);
begin
if (edtuser.Text='') then
  begin
   ShowMessage('Username silahkan diisi!');
   edtuser.SetFocus;
  end else
if (edtpw.Text='') then
  begin
    ShowMessage('Password silahkan diisi!');
    edtpw.SetFocus;
  end else
begin
  with UniMainModule do
    begin
          UniRegis.SQL.Clear;
          UniRegis.SQL.Add('SELECT * FROM tdataregis WHERE');
          if (checklogin.Checked = true) then
          begin
            UniRegis.SQL.Add('user=:userX and pass=:passX');
            UniRegis.Params[0].AsString := edtuser.text;
            UniRegis.Params[1].AsString := edtpw.text;
            end;

          uniconnection1.StartTransaction;
          try
            UniRegis.ExecSQL;
            Uniconnection1.Commit;
            if (UniRegis.RecordCount>0) AND (UniRegis.FieldByName('akses').Value = 'Petani') then
            begin
              UniMainModule.LoggedUser := UniRegis.FieldByName('nama').AsString;
              ModalResult := mrOK;
            end else
            if (UniRegis.FieldByName('akses').Value = 'Pengepul') then
            begin
              UniMainModule.LoggedUser := UniRegis.FieldByName('nama').AsString;
              MainPengepul.Show;
              flogin.Hide;
            end else
            begin
              Showmessage('Silahkan Cek Username dan Password Anda!');
            end;
            except
            uniconnection1.Rollback;
          end;
        end;
      end;
end;

procedure Tflogin.btndaftarClick(Sender: TObject);
begin
fregistrasi.Show();
end;

procedure Tflogin.UniImage4Click(Sender: TObject);
begin
edtuser.Visible:=false;
edtpw.Visible:=false;
login.Visible:=false;
btnlog.Visible:=true;
btndaftar.Visible:=true;
end;

initialization
  RegisterAppFormClass(Tflogin);

end.
