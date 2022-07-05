unit agua1_logo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls;

type
  Tagua_logo = class(TForm)
    Label1: TLabel;
    FloatAnimation1: TFloatAnimation;
    Label2: TLabel;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    procedure Rectangle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  agua_logo: Tagua_logo;

implementation

{$R *.fmx}

uses agua_login;



procedure Tagua_logo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       Action     := TCloseAction.caFree;
       agua_logo := nil;

end;

procedure Tagua_logo.FormCreate(Sender: TObject);
begin
FloatAnimation1.Start;
end;

procedure Tagua_logo.Rectangle1Click(Sender: TObject);
begin
    if  NOT Assigned(agua1_login) then
        Application.CreateForm(Tagua1_login, agua1_login);
        Application.MainForm := agua1_login;
        agua1_login.Show;
end;

end.
