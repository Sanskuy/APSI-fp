unit Udtpupuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniBasicGrid, uniDBGrid, uniEdit, uniLabel, uniCheckBox;

type
  Tfdtpupuk = class(TUniForm)
    UniImage1: TUniImage;
    UniImage4: TUniImage;
    UniImage3: TUniImage;
    UniDBGrid1: TUniDBGrid;
    UniImage2: TUniImage;
    UniImage5: TUniImage;
    lbfind: TUniLabel;
    imgfind: TUniImage;
    edtfind: TUniEdit;
    btncari: TUniImage;
    check: TUniCheckBox;
    UniImage6: TUniImage;
    procedure UniImage2Click(Sender: TObject);
    procedure imgfindClick(Sender: TObject);
    procedure btncariClick(Sender: TObject);
    procedure UniImage6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fdtpupuk: Tfdtpupuk;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Utransaksipupuk, Main;

function fdtpupuk: Tfdtpupuk;
begin
  Result := Tfdtpupuk(UniMainModule.GetFormInstance(Tfdtpupuk));
end;

procedure Tfdtpupuk.btncariClick(Sender: TObject);
begin
  with UniMainModule do
        begin
          UniPupuk.SQL.Clear;
          UniPupuk.SQL.Add('SELECT * FROM tdatapupuk WHERE');
          if (check.Checked = true) then
          begin
            UniPupuk.SQL.Add('nama LIKE :namaX');
            UniPupuk.Params[0].AsString := '%'+ edtfind.text+'%';
            end;

          UniConnection1.StartTransaction;
          try
            UniPupuk.ExecSQL;
            Uniconnection1.Commit;
            if (UniPupuk.RecordCount>0)then
            begin
              Showmessage('Data ditemukan!');
              lbfind.Visible:=false;
              edtfind.Visible:=false;
              btncari.Visible:=false;
              imgfind.Visible:=true;
              edtfind.Text:='';
            end
            else begin
              Showmessage('Data tidak ditemukan!');
            end;
            except
            uniconnection1.Rollback;
          end;
        end;
end;

procedure Tfdtpupuk.imgfindClick(Sender: TObject);
begin
lbfind.Visible:=true;
edtfind.Visible:=true;
btncari.Visible:=true;
imgfind.Visible:=false;
end;

procedure Tfdtpupuk.UniImage2Click(Sender: TObject);
begin
with UniMainModule do
  begin
      with ftransaksip do
      begin
        lbkdp.Text      := UniPupuk.FieldByName('kd').AsString;
        lbnamap.Text    := UniPupuk.FieldByName('nama').AsString;
        lbjenisp.Text   := UniPupuk.FieldByName('jenis').AsString;
        lbberatp.Text   := UniPupuk.FieldByName('berat').AsString;
        lbhrgap.Text    := UniPupuk.FieldByName('harga').AsString;
        Show;
      end;
      fdtpupuk.Hide;
  end;
end;

procedure Tfdtpupuk.UniImage6Click(Sender: TObject);
begin
mainform.Show();
fdtpupuk.Hide;
//================
lbfind.Visible:=false;
edtfind.Visible:=false;
btncari.Visible:=false;
imgfind.Visible:=true;
end;

end.
