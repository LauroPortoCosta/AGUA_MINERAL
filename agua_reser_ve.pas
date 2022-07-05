unit agua_reser_ve;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Controls,  FMX.Forms,  FMX.Graphics,  FMX.Dialogs,  FMX.Controls.Presentation,
 FMX.Edit,  FMX.Objects,  FMX.Layouts,  FMX.StdCtrls,  FMX.Ani,   FMX.ScrollBox,
 FMX.Memo,  FMX.TabControl,  FMX.Grid,  FMX.ListView.Types,  FMX.ListView.Appearances,
 FMX.ListView.Adapters.Base,  FMX.ListView,  FMX.VirtualKeyboard,  FMX.Platform, System.Actions,
 FMX.ActnList,  Fmx.Bind.Editors,  REST.Types,  FireDAC.Stan.Intf,  FireDAC.Stan.Option,
 FireDAC.Stan.Param,  FireDAC.Stan.Error,  FireDAC.DatS,  FireDAC.Phys.Intf,  FireDAC.DApt.Intf,
 REST.Client,  REST.Authenticator.Basic,  Data.DB,  FireDAC.Comp.DataSet,  FireDAC.Comp.Client,
 REST.Response.Adapter,  Data.Bind.Components,  Data.Bind.ObjectScope,  System.Json.Types,
 System.Json.Readers,  System.Json.Writers,  System.Json,
 System.Rtti,   FMX.Grid.Style,  Data.Bind.EngExt,  Fmx.Bind.DBEngExt,  Fmx.Bind.Grid,
 System.Bindings.Outputs,  Data.Bind.Grid,   Data.Bind.DBScope, FMX.DialogService,
  FMX.DateTimeCtrls;

type
  Tagua_reservave = class(TForm)
    Layout_cabecalho: TLayout;
    Rectangle3: TRectangle;
    Label6: TLabel;
    Label4: TLabel;
    Image11: TImage;
    Layout_caixa_central: TLayout;
    Rectangle2: TRectangle;
    Layoutx10: TLayout;
    RoundRect5: TRoundRect;
    Edit4: TEdit;
    Layoutx11: TLayout;
    RoundRect6: TRoundRect;
    Edit2: TEdit;
    Layout7: TLayout;
    RoundRect2: TRoundRect;
    Layout8: TLayout;
    RoundRect3: TRoundRect;
    Edit3: TEdit;
    Layout9: TLayout;
    RoundRect4: TRoundRect;
    Edit1: TEdit;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    Label5: TLabel;
    FloatAnimation1: TFloatAnimation;
    Edit5: TEdit;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Edit7: TEdit;
    RoundRect7: TRoundRect;
    Edit8: TEdit;
    RoundRect8: TRoundRect;
    Edit9: TEdit;
    RoundRect9: TRoundRect;
    Edit10: TEdit;
    RoundRect10: TRoundRect;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image13: TImage;
    Image1: TImage;
    Image5: TImage;
    Image9: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure Image11Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure volta;
    procedure grava;
    procedure carrega;
    procedure RoundRect1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);

  private
    procedure mostra;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  agua_reservave: Tagua_reservave;

implementation

{$R *.fmx}

uses agua_Relserv, agua1_DM;

//uses manicure, manicureDM, manicure_Relserv;

procedure Tagua_reservave.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
carrega;
agua_reservave.Close;

end;

procedure Tagua_reservave.FormCreate(Sender: TObject);
begin
mostra;
end;

procedure Tagua_reservave.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
{$IFDEF ANDROID}
var
    FService : IFMXVirtualKeyboardService;
{$ENDIF}
begin
{$IFDEF ANDROID}
   if (Key = vkHardwareBack) then
      begin
       TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,IInterface(FService));
               if (FService <> nil) and
                   (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
                begin
                // botao back pressionado e teclado  visivel
                // apenas fecha o teclado
              end
               else
               begin
            if  not Assigned(agua_Rel) then
            begin
                Key := 0;
               Application.CreateForm(Tagua_Rel, agua_Rel);               // cria o formulario
               Application.MainForm := agua_Rel;                                // informa que o programa MENU se tornou o principal
               agua_Rel.Show;                                                   // abre o novo formulario MENU
            end
            else if  not Assigned(agua_Rel) then   // executo no relatorio e vou para o menu
            begin
                Key := 0;
                Application.CreateForm(Tagua_Rel, agua_Rel);               // cria o formulario
                Application.MainForm := agua_Rel;                                // informa que o programa MENU se tornou o principal
                agua_Rel.Show;                                                   // abre o novo formulario MENU
            end
            else if  not Assigned(agua_Rel) then
                 key :=0;
                Application.CreateForm(Tagua_Rel, agua_Rel);               // cria o formulario
                Application.MainForm := agua_Rel;                                // informa que o programa MENU se tornou o principal
                agua_Rel.Show;                                                   // abre o novo formulario MENU
         end;
      end;
{$ENDIF}

end;



procedure Tagua_reservave.FormShow(Sender: TObject);
begin
mostra;
end;

procedure Tagua_reservave.Image11Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_reservave.Image14Click(Sender: TObject);
begin
volta;
end;


procedure Tagua_reservave.Image2Click(Sender: TObject);
begin
edit2.Text:='n';
RoundRect1Click(Sender);
end;

procedure Tagua_reservave.RoundRect1Click(Sender: TObject);
begin

grava;
carrega;
volta;

end;

procedure Tagua_reservave.grava;
var
cc:string;
xx:string;

Begin

  xx:= agua_Rel.item_consultado2;

  agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
  agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmPATCH;
  agua_DM.RESTRequest3.Params.Clear;                                                       // limpa o RESTRequest3
  agua_DM.RESTRequest3.Params.AddItem;                                                     // adiciona item
  agua_DM.RESTRequest3.Params.Items[0].name  := 'param';
  cc:= '{"statusx":"n"}';
  agua_DM.RESTRequest3.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest3 o conteudo de cc
  agua_DM.RESTRequest3.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
  agua_DM.RESTRequest3.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
  agua_DM.RESTRequest3.Execute;
  showmessage('salvo com sucesso');
  carrega;
  end;




procedure Tagua_reservave.carrega;
begin
     agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest3.Execute;
end;




procedure Tagua_reservave.mostra;
var
xx:string;
begin
     xx:= agua_Rel.item_consultado2;
     agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest3.Execute;


        while Not agua_DM.FDMemTable3.Eof  do
         begin
                Edit1.Text :=agua_DM.FDMemTable3.FieldByName('id').AsString;
                Edit2.Text :=agua_DM.FDMemTable3.FieldByName('statusx').AsString;
                Edit3.Text := agua_DM.FDMemTable3.FieldByName('nomex').AsString;
                Edit4.Text :=agua_DM.FDMemTable3.FieldByName('datax').AsString;
                Edit5.Text :=agua_DM.FDMemTable3.FieldByName('marca').AsString;
                Edit7.Text :=agua_DM.FDMemTable3.FieldByName('descri').AsString;
                Edit8.Text :=agua_DM.FDMemTable3.FieldByName('valor').AsString;
                Edit9.Text :=agua_DM.FDMemTable3.FieldByName('qt').AsString;

                agua_DM.FDMemTable3.Next;
         end ;

end;

procedure Tagua_reservave.volta;
begin
   if Not Assigned(agua_Rel) then
      Application.CreateForm(Tagua_Rel, agua_Rel);
      Application.MainForm := agua_Rel;
      agua_Rel.Show;
      agua_reservave.Close;
end;


end.
