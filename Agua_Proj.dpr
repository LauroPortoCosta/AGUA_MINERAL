program Agua_Proj;

uses
  System.StartUpCopy,
  FMX.Forms,
  agua_login in 'agua_login.pas' {agua1_login},
  agua1_menu in 'agua1_menu.pas' {agua_menu},
  agua_tabela in 'agua_tabela.pas' {agua_tabel},
  agua_Reltab in 'agua_Reltab.pas' {agua_RelTa},
  agua_recad in 'agua_recad.pas' {agua_rec},
  agua1_livre in 'agua1_livre.pas' {agua_livre},
  agua_clien in 'agua_clien.pas' {agua_cliente},
  agua_IncCli in 'agua_IncCli.pas' {agua_Inc_cli},
  agua_RelReca in 'agua_RelReca.pas' {agua_RelRec},
  FMX.BitmapHelper in 'Units\FMX.BitmapHelper.pas',
  AnonThread in 'Units\AnonThread.pas',
  OpenViewUrl in 'Units\OpenViewUrl.pas',
  agua_Relserv in 'agua_Relserv.pas' {agua_Rel},
  agua_reser_ve in 'agua_reser_ve.pas' {agua_reservave},
  agua1_DM in 'agua1_DM.pas' {agua_DM: TDataModule},
  agua_localizacao in 'agua_localizacao.pas' {agua_localiz};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tagua1_login, agua1_login);
  Application.CreateForm(Tagua_DM, agua_DM);
  Application.Run;
end.
