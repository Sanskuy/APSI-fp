unit Utransaksibibit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniLabel,
  Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage, uniCheckBox, uniEdit;

type
  Tftransaksi = class(TUniForm)
    UniImage1: TUniImage;
    UniImage3: TUniImage;
    UniLabel1: TUniLabel;
    UniImage2: TUniImage;
    UniLabel2: TUniLabel;
    UniImage4: TUniImage;
    UniLabel3: TUniLabel;
    UniImage5: TUniImage;
    UniImage6: TUniImage;
    UniImage7: TUniImage;
    UniImage8: TUniImage;
    UniImage9: TUniImage;
    UniImage10: TUniImage;
    UniImage11: TUniImage;
    UniLabel4: TUniLabel;
    cmbpay: TUniComboBox;
    lbkd: TUniLabel;
    lbnm: TUniLabel;
    lbjenis: TUniLabel;
    lbmasa: TUniLabel;
    lbukuran: TUniLabel;
    lbharga: TUniLabel;
    cek: TUniCheckBox;
    captcha: TUniImage;
    edtcaptcha: TUniEdit;
    btnpay: TUniImage;
    edtjml: TUniEdit;
    UniLabel5: TUniLabel;
    UniImage12: TUniImage;
    edttotal: TUniEdit;
    lbstatus: TUniLabel;
    UniImage13: TUniImage;
    UniImage14: TUniImage;
    UniImage15: TUniImage;
    UniImage16: TUniImage;
    procedure cekClick(Sender: TObject);
    procedure cmbpayChange(Sender: TObject);
    procedure edtcaptchaChange(Sender: TObject);
    procedure btnpayClick(Sender: TObject);
    procedure UniImage16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ftransaksi: Tftransaksi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Ukdtransaksi, Udtbibit;

function ftransaksi: Tftransaksi;
begin
  Result := Tftransaksi(UniMainModule.GetFormInstance(Tftransaksi));
end;

procedure Tftransaksi.btnpayClick(Sender: TObject);
begin
if (cmbpay.ItemIndex = 0) then
  begin
    if (lbjenis.Text='Unggul') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='SS-UEF';
      end else
    if (lbjenis.Text='Standar') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='ST-SEF';
      end;
  end else
if (cmbpay.ItemIndex = 1) then
  begin
    if (lbjenis.Text='Unggul') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='SS-UEF';
      end else
    if (lbjenis.Text='Standar') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='ST-SEF';
      end;
  end else
if (cmbpay.ItemIndex = 2) then
  begin
    if (lbjenis.Text='Unggul') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='SS-UEF';
      end else
    if (lbjenis.Text='Standar') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='ST-SEF';
      end;
  end else
if (cmbpay.ItemIndex = 3) then
  begin
    if (lbjenis.Text='Unggul') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='SS-UEF';
      end else
    if (lbjenis.Text='Standar') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='ST-SEF';
      end;
  end else
if (cmbpay.ItemIndex = 4) then
  begin
    if (lbjenis.Text='Unggul') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='SS-UEF';
      end else
    if (lbjenis.Text='Standar') then
      begin
        with fkdtransaksi do
        lbkd.Caption:='ST-SEF';
      end;
end;
fkdtransaksi.Show();
ftransaksi.Hide;
end;

procedure Tftransaksi.cekClick(Sender: TObject);
begin
if (cek.Checked=true) then
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

procedure Tftransaksi.cmbpayChange(Sender: TObject);
var ket : integer;
begin
if (edtjml.Text='') then
  begin
   ShowMessage('Silahkan isi jumlah pembelian!');
   cmbpay.Text:='Pilih Cara Pembayaran';
  end else
//===========================================================
if (cmbpay.itemindex=0) OR (cmbpay.itemindex=1) OR (cmbpay.itemindex=2) OR
   (cmbpay.itemindex=3) OR (cmbpay.itemindex=4) then
    begin
      cek.Enabled:=true;
      ket := strtoint(lbharga.Text)*strtoint(edtjml.Text);
      edttotal.Text:=inttostr(ket);
    end;
end;

procedure Tftransaksi.edtcaptchaChange(Sender: TObject);
begin
if (edtcaptcha.Text='8JKRS') then
  begin
    btnpay.Enabled:=true;
  end;
if (captcha.Visible=true) then
  begin
    edtcaptcha.Visible:=true;
  end;
end;

procedure Tftransaksi.UniImage16Click(Sender: TObject);
begin
fdtbibit.Show();
ftransaksi.Hide;
edtjml.Text:='';
edttotal.Text:='';
cmbpay.Text:='Pilih Cara Pembayaran';
cek.Checked:=false;
cek.Enabled:=false;
captcha.Visible:=false;
edtcaptcha.Visible:=false;
btnpay.Enabled:=false;
end;

end.
