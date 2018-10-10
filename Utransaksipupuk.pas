unit Utransaksipupuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniLabel, uniCheckBox, uniMultiItem, uniComboBox, uniEdit;

type
  Tftransaksip = class(TUniForm)
    UniImage3: TUniImage;
    UniImage14: TUniImage;
    UniImage13: TUniImage;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    bar1: TUniImage;
    lbkdp: TUniLabel;
    UniLabel2: TUniLabel;
    bar2: TUniImage;
    lbnamap: TUniLabel;
    UniLabel3: TUniLabel;
    lbjenisp: TUniLabel;
    bar3: TUniImage;
    UniLabel4: TUniLabel;
    lbberatp: TUniLabel;
    bar4: TUniImage;
    UniLabel5: TUniLabel;
    bar5: TUniImage;
    lbhrgap: TUniLabel;
    UniLabel6: TUniLabel;
    edtjmlp: TUniEdit;
    UniImage12: TUniImage;
    edttotalp: TUniEdit;
    UniLabel7: TUniLabel;
    cmbpayp: TUniComboBox;
    cekp: TUniCheckBox;
    captcha: TUniImage;
    edtcaptcha: TUniEdit;
    btnpay: TUniImage;
    UniImage15: TUniImage;
    UniImage6: TUniImage;
    procedure cmbpaypChange(Sender: TObject);
    procedure cekpClick(Sender: TObject);
    procedure edtcaptchaChange(Sender: TObject);
    procedure UniImage6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ftransaksip: Tftransaksip;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Udtpupuk;

function ftransaksip: Tftransaksip;
begin
  Result := Tftransaksip(UniMainModule.GetFormInstance(Tftransaksip));
end;

procedure Tftransaksip.cekpClick(Sender: TObject);
begin
if (cekp.Checked=true) then
  begin
    captcha.Visible:=true;
    edtcaptcha.Visible:=true;
    edtcaptcha.Text:='';
  end else
  begin
    captcha.Visible:=false;
    edtcaptcha.Visible:=false;
  end;
end;

procedure Tftransaksip.cmbpaypChange(Sender: TObject);
var ket : integer;
begin
if (edtjmlp.Text='') then
  begin
   ShowMessage('Silahkan isi jumlah pembelian!');
   cmbpayp.Text:='Pilih Cara Pembayaran';
  end else
//===================================================
if (cmbpayp.itemindex=0) OR (cmbpayp.itemindex=1) OR (cmbpayp.itemindex=2) OR
   (cmbpayp.itemindex=3) OR (cmbpayp.itemindex=4) then
    begin
      cekp.Enabled:=true;
      ket := strtoint(lbhrgap.Text)*strtoint(edtjmlp.Text);
      edttotalp.Text:=inttostr(ket);
    end;
end;

procedure Tftransaksip.edtcaptchaChange(Sender: TObject);
begin
if (edtcaptcha.Text='613KZ') then
  begin
    btnpay.Enabled:=true;
  end;
if (captcha.Visible=true) then
  begin
    edtcaptcha.Visible:=true;
  end;
end;

procedure Tftransaksip.UniImage6Click(Sender: TObject);
begin
fdtpupuk.Show();
ftransaksip.Hide;
edtjmlp.Text:='';
edttotalp.Text:='';
cmbpayp.Text:='Pilih Cara Pembayaran';
cekp.Checked:=false;
cekp.Enabled:=false;
captcha.Visible:=false;
edtcaptcha.Visible:=false;
btnpay.Enabled:=false;
end;

end.
