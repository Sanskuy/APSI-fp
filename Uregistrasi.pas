unit Uregistrasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniEdit, uniMultiItem, uniComboBox, uniLabel, uniRadioButton,
  uniDateTimePicker, uniMemo, uniCheckBox;

type
  Tfregistrasi = class(TUniForm)
    UniImage1: TUniImage;
    UniImage2: TUniImage;
    edtuser: TUniEdit;
    cmbakses: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    edtnik: TUniEdit;
    edtnama: TUniEdit;
    UniLabel3: TUniLabel;
    datettl: TUniDateTimePicker;
    UniLabel4: TUniLabel;
    alamat: TUniMemo;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    edtpw: TUniEdit;
    UniImage3: TUniImage;
    UniImage4: TUniImage;
    edtbio: TUniEdit;
    UniImage5: TUniImage;
    cekpw: TUniCheckBox;
    cmbjk: TUniComboBox;
    UniImage6: TUniImage;
    procedure cekpwClick(Sender: TObject);
    procedure UniImage3Click(Sender: TObject);
    procedure UniImage4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fregistrasi: Tfregistrasi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function fregistrasi: Tfregistrasi;
begin
  Result := Tfregistrasi(UniMainModule.GetFormInstance(Tfregistrasi));
end;

procedure Tfregistrasi.cekpwClick(Sender: TObject);
begin
if (cekpw.Checked=true) then
    edtpw.PasswordChar := #0 else
    edtpw.PasswordChar := '*';
end;

procedure Tfregistrasi.UniImage3Click(Sender: TObject);
begin
if (edtuser.Text='') then
  begin
    ShowMessage('Silahkan isi Username anda!');
    edtuser.SetFocus;
  end else
if (cmbakses.Text='Pilih Jenis Akun') then
  begin
    ShowMessage('Silahkan pilih jenis Akun anda!');
    cmbakses.SetFocus;
  end else
if (edtnik.Text='') then
  begin
    ShowMessage('Silahkan isi N.I.K anda!');
    edtnik.SetFocus;
  end else
if (edtnama.Text='') then
  begin
    ShowMessage('Silahkan isi Nama Lengkap anda!');
    edtnama.SetFocus;
  end else
if (cmbjk.Text='Pilih Jenis Kelamin') then
  begin
    ShowMessage('Silahkan pilih Jenis Kelamin anda!');
    cmbjk.SetFocus;
  end else
if (alamat.Text='') then
  begin
    ShowMessage('Silahkan isi Alamat anda!');
    alamat.SetFocus;
  end else
if (edtpw.Text='') then
  begin
    ShowMessage('Silahkan isi Password anda!');
    edtpw.SetFocus;
  end else
if (edtbio.Text='') then
  begin
    ShowMessage('Silahkan isi Bio anda!');
    edtbio.SetFocus;
  end else
//==========================================================
begin
if (cmbakses.ItemIndex=0) then
 begin
  with UniMainModule do
    begin
      qpetani.SQL.Clear;
      qpetani.SQL.Add('INSERT INTO tdatapetani (nik,nama,ttl,jk,alamat,bio) VALUES(:nik,:nama,:ttl,:jk,:alamat,:bio)');

      qpetani.Params[0].AsString := edtnik.Text;
      qpetani.Params[1].AsString := edtnama.Text;
      qpetani.Params[2].AsString := datettl.Text;
      qpetani.Params[3].AsString := cmbjk.Text;
      qpetani.Params[4].AsString := alamat.Text;
      qpetani.Params[5].AsString := edtbio.Text;

      UniConnection1.StartTransaction;
      try
        qpetani.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniPetani.Close;
            UniPetani.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
  //REGISTRASI====================================================
 begin
  with UniMainModule do
    begin
      qregis.SQL.Clear;
      qregis.SQL.Add('INSERT INTO tdataregis (nik,user,nama,pass,akses) VALUES(:nik,:user,:nama,:pass,:akses)');

      qregis.Params[0].AsString := edtnik.Text;
      qregis.Params[1].AsString := edtuser.Text;
      qregis.Params[2].AsString := edtnama.Text;
      qregis.Params[3].AsString := edtpw.Text;
      qregis.Params[4].AsString := cmbakses.Text;

      UniConnection1.StartTransaction;
      try
        qregis.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniRegis.Close;
            UniRegis.Open;
            //qtampil.Close;
            //qtampil.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
   end;
  end else

begin
if (cmbakses.ItemIndex=1) then
 begin
  with UniMainModule do
    begin
      qbtani.SQL.Clear;
      qbtani.SQL.Add('INSERT INTO tdatabtani (nik,nama,ttl,jk,alamat,bio) VALUES(:nik,:nama,:ttl,:jk,:alamat,:bio)');

      qbtani.Params[0].AsString := edtnik.Text;
      qbtani.Params[1].AsString := edtnama.Text;
      qbtani.Params[2].AsString := datettl.Text;
      qbtani.Params[3].AsString := cmbjk.Text;
      qbtani.Params[4].AsString := alamat.Text;
      qbtani.Params[5].AsString := edtbio.Text;

      UniConnection1.StartTransaction;
      try
        qbtani.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniTani.Close;
            UniTani.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
  //REGISTRASI=====================================================
 begin
  with UniMainModule do
    begin
      qregis.SQL.Clear;
      qregis.SQL.Add('INSERT INTO tdataregis (nik,user,nama,pass,akses) VALUES(:nik,:user,:nama,:pass,:akses)');

      qregis.Params[0].AsString := edtnik.Text;
      qregis.Params[1].AsString := edtuser.Text;
      qregis.Params[2].AsString := edtnama.Text;
      qregis.Params[3].AsString := edtpw.Text;
      qregis.Params[4].AsString := cmbakses.Text;

      UniConnection1.StartTransaction;
      try
        qregis.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniRegis.Close;
            UniRegis.Open;
            //qtampil.Close;
            //qtampil.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
   end;
  end else

begin
if (cmbakses.ItemIndex=2) then
 begin
  with UniMainModule do
    begin
      qpeng.SQL.Clear;
      qpeng.SQL.Add('INSERT INTO tdatapengepul (nik,nama,ttl,jk,alamat,bio) VALUES(:nik,:nama,:ttl,:jk,:alamat,:bio)');

      qpeng.Params[0].AsString := edtnik.Text;
      qpeng.Params[1].AsString := edtnama.Text;
      qpeng.Params[2].AsString := datettl.Text;
      qpeng.Params[3].AsString := cmbjk.Text;
      qpeng.Params[4].AsString := alamat.Text;
      qpeng.Params[5].AsString := edtbio.Text;

      UniConnection1.StartTransaction;
      try
        qpeng.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniPeng.Close;
            UniPeng.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
  //REGISTRASI=====================================================
 begin
  with UniMainModule do
    begin
      qregis.SQL.Clear;
      qregis.SQL.Add('INSERT INTO tdataregis (nik,user,nama,pass,akses) VALUES(:nik,:user,:nama,:pass,:akses)');

      qregis.Params[0].AsString := edtnik.Text;
      qregis.Params[1].AsString := edtuser.Text;
      qregis.Params[2].AsString := edtnama.Text;
      qregis.Params[3].AsString := edtpw.Text;
      qregis.Params[4].AsString := cmbakses.Text;

      UniConnection1.StartTransaction;
      try
        qregis.ExecSQL;
        UniConnection1.Commit;
        ShowMessage('Registrasi Data Berhasil !');
        close;
          with UniMainModule do
          begin
            UniRegis.Close;
            UniRegis.Open;
            //qtampil.Close;
            //qtampil.Open;
          end;
      except
        UniConnection1.Rollback;
        ShowMessage('Registrasi Data Gagal !');
      end;
    end;
   end;
 end;
end;
end;
end;
end;

procedure Tfregistrasi.UniImage4Click(Sender: TObject);
begin
close;
end;

end.
