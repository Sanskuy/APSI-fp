unit Udtbibit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage,
  uniBasicGrid, uniDBGrid, uniEdit, uniLabel, uniCheckBox;

type
  Tfdtbibit = class(TUniForm)
    UniImage1: TUniImage;
    UniImage3: TUniImage;
    UniDBGrid1: TUniDBGrid;
    UniImage2: TUniImage;
    imgfind: TUniImage;
    UniImage4: TUniImage;
    lbfind: TUniLabel;
    edtfind: TUniEdit;
    imgbtncari: TUniImage;
    check: TUniCheckBox;
    UniImage5: TUniImage;
    btnref: TUniImage;
    UniImage6: TUniImage;
    procedure UniImage2Click(Sender: TObject);
    procedure imgfindClick(Sender: TObject);
    procedure imgbtncariClick(Sender: TObject);
    procedure UniImage6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fdtbibit: Tfdtbibit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Utransaksibibit, Main;

function fdtbibit: Tfdtbibit;
begin
  Result := Tfdtbibit(UniMainModule.GetFormInstance(Tfdtbibit));
end;

procedure Tfdtbibit.imgbtncariClick(Sender: TObject);
begin
  with UniMainModule do
        begin
          UniBibit.SQL.Clear;
          UniBibit.SQL.Add('SELECT * FROM tdatabibit WHERE');
          if (check.Checked = true) then
          begin
            UniBibit.SQL.Add('nama=:namaX');
            UniBibit.Params[0].AsString := '%'+ edtfind.text+'%';
            end;

          UniConnection1.StartTransaction;
          try
            UniBibit.ExecSQL;
            Uniconnection1.Commit;
            if (UniBibit.RecordCount>0)then
            begin
              Showmessage('Data ditemukan!');
              lbfind.Visible:=false;
              edtfind.Visible:=false;
              imgbtncari.Visible:=false;
              btnref.Visible:=false;
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

procedure Tfdtbibit.imgfindClick(Sender: TObject);
begin
lbfind.Visible:=true;
edtfind.Visible:=true;
imgbtncari.Visible:=true;
//btnref.Visible:=true;
imgfind.Visible:=false;
end;

procedure Tfdtbibit.UniImage2Click(Sender: TObject);
begin
with UniMainModule do
  begin
      with ftransaksi do
      begin
        lbkd.Text       := UniBibit.FieldByName('kd').AsString;
        lbnm.Text       := UniBibit.FieldByName('nama').AsString;
        lbjenis.Text    := UniBibit.FieldByName('jenis').AsString;
        lbmasa.Text     := UniBibit.FieldByName('masa').AsString;
        lbukuran.Text   := UniBibit.FieldByName('ukuran').AsString;
        lbharga.Text    := UniBibit.FieldByName('harga').AsString;
        Show;
      end;
      fdtbibit.Hide;
  end;
end;

procedure Tfdtbibit.UniImage6Click(Sender: TObject);
begin
mainform.Show();
fdtbibit.Hide;
//================
lbfind.Visible:=false;
edtfind.Visible:=false;
imgbtncari.Visible:=false;
//btnref.Visible:=false;
imgfind.Visible:=true;
end;

end.
