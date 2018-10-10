program APSI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Udtbibit in 'Udtbibit.pas' {fdtbibit: TUniForm},
  Utransaksibibit in 'Utransaksibibit.pas' {ftransaksi: TUniForm},
  Ukdtransaksi in 'Ukdtransaksi.pas' {fkdtransaksi: TUniForm},
  Udtpupuk in 'Udtpupuk.pas' {fdtpupuk: TUniForm},
  Utransaksipupuk in 'Utransaksipupuk.pas' {ftransaksip: TUniForm},
  Udtbtani in 'Udtbtani.pas' {fdtbtani: TUniForm},
  Ulogin in 'Ulogin.pas' {flogin: TUniLoginForm},
  Uregistrasi in 'Uregistrasi.pas' {fregistrasi: TUniForm},
  Ubookingbtani in 'Ubookingbtani.pas' {fbookbtani: TUniForm},
  Umainpengepul in 'Umainpengepul.pas' {MainPengepul: TUniForm};

{$R *.res}

begin
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
