unit Udtbtani;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniEdit, uniLabel, uniBasicGrid, uniDBGrid, uniCheckBox;

type
  Tfdtbtani = class(TUniForm)
    UniImage1: TUniImage;
    UniImage4: TUniImage;
    UniImage3: TUniImage;
    UniImage6: TUniImage;
    UniImage5: TUniImage;
    UniDBGrid1: TUniDBGrid;
    UniImage2: TUniImage;
    imgfind: TUniImage;
    lbfind: TUniLabel;
    edtfind: TUniEdit;
    imgbtncari: TUniImage;
    check: TUniCheckBox;
    procedure imgfindClick(Sender: TObject);
    procedure UniImage6Click(Sender: TObject);
    procedure imgbtncariClick(Sender: TObject);
    procedure UniImage2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fdtbtani: Tfdtbtani;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, Ubookingbtani;

function fdtbtani: Tfdtbtani;
begin
  Result := Tfdtbtani(UniMainModule.GetFormInstance(Tfdtbtani));
end;

procedure Tfdtbtani.imgbtncariClick(Sender: TObject);
begin
  with UniMainModule do
        begin
          UniTani.SQL.Clear;
          UniTani.SQL.Add('SELECT * FROM tdatabtani WHERE');
          if (check.Checked = true) then
          begin
            UniTani.SQL.Add('nama=:namaX');
            UniTani.Params[0].AsString := '%'+ edtfind.text+'%';
            end;

          UniConnection1.StartTransaction;
          try
            UniTani.ExecSQL;
            Uniconnection1.Commit;
            if (UniTani.RecordCount>0)then
            begin
              Showmessage('Data ditemukan!');
              lbfind.Visible:=false;
              edtfind.Visible:=false;
              imgbtncari.Visible:=false;
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

procedure Tfdtbtani.imgfindClick(Sender: TObject);
begin
lbfind.Visible:=true;
edtfind.Visible:=true;
imgbtncari.Visible:=true;
imgfind.Visible:=false;
end;

procedure Tfdtbtani.UniImage2Click(Sender: TObject);
begin
with UniMainModule do
  begin
      with fbookbtani do
      begin
        lbnik.Text     := UniTani.FieldByName('nik').AsString;
        lbnama.Text    := UniTani.FieldByName('nama').AsString;
        lbttl.Text     := UniTani.FieldByName('ttl').AsString;
        lbjk.Text      := UniTani.FieldByName('jk').AsString;
        lbalamat.Text  := UniTani.FieldByName('alamat').AsString;
        lbbio.Text     := UniTani.FieldByName('bio').AsString;
        Show;
      end;
      fdtbtani.Hide;
  end;
end;

procedure Tfdtbtani.UniImage6Click(Sender: TObject);
begin
mainform.Show();
fdtbtani.Hide;
//===============
lbfind.Visible:=false;
edtfind.Visible:=false;
imgbtncari.Visible:=false;
imgfind.Visible:=true;
end;

end.
