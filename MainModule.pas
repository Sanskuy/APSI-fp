unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, UniProvider, MySQLUniProvider, DBAccess,
  UniDacVcl, Data.DB, Uni, MemDS;

type
  TUniMainModule = class(TUniGUIMainModule)
    UniConnection1: TUniConnection;
    UniConnectDialog1: TUniConnectDialog;
    MySQLUniProvider1: TMySQLUniProvider;
    UniPetani: TUniQuery;
    UniBibit: TUniQuery;
    UniDBPetani: TUniDataSource;
    UniDBBibit: TUniDataSource;
    qtampil: TUniQuery;
    UniPupuk: TUniQuery;
    UniDBPupuk: TUniDataSource;
    qrefresh: TUniQuery;
    UniTani: TUniQuery;
    UniDBTani: TUniDataSource;
    qbtani: TUniQuery;
    qregis: TUniQuery;
    UniRegis: TUniQuery;
    UniDBRegis: TUniDataSource;
    qpetani: TUniQuery;
    UniPeng: TUniQuery;
    UniDBPeng: TUniDataSource;
    qpeng: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    LoggedUser : string;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
