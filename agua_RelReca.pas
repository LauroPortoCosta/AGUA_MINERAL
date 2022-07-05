unit agua_RelReca;

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
  Tagua_RelRec = class(TForm)
    Layout_cabecalho: TLayout;
    Rectangle2: TRectangle;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image1: TImage;
    Label2: TLabel;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    Label4: TLabel;
    ListView1: TListView;
    DateEdit1: TDateEdit;
    Lay_centro: TLayout;
    Label3: TLabel;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Image6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure addcategoria(var1, var2, var3, var4, var5: string);
    procedure fecha;
    procedure carrega;
    { Private declarations }
  public
    { Public declarations }

                 xvar1         : String;
                 xvar2         : String;
                 xvar3         : String;   // controla as variaveis do relatorio
                 xvar4         : String;   // controla as variaveis do relatorio
                 xvar5         : String;
                 xvar6         : String;
                 unha_data     : String;
                 unha2_hora    : String;
                 unha3_servico : String;
                 unha7_nome    : String;
                 xtag          : integer;
                 x_OnClik      : Integer;
                 so_para_zero  : integer;
                 x:integer;

  end;

var
  agua_RelRec: Tagua_RelRec;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu;


procedure Tagua_RelRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
agua_RelRec.DisposeOf;

end;

procedure Tagua_RelRec.FormCreate(Sender: TObject);
begin
//ListView1.Items.Clear;
DateEdit1Change(Sender);
end;


procedure Tagua_RelRec.FormKeyUp(Sender: TObject; var Key: Word;
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
            if  not Assigned(agua_menu) then
            begin
                Key := 0;
                fecha;
            end
            else if  not Assigned(agua_menu) then   // executo no relatorio e vou para o menu
            begin
                Key := 0;
                fecha;
            end
            else if  not Assigned(agua_menu) then
                 key :=0;
                 fecha;
         end;
      end;
{$ENDIF}
end;

procedure Tagua_RelRec.Image14Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_RelRec.Image1Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_RelRec.Image6Click(Sender: TObject);
begin
carrega;
DateEdit1Change(Sender);

end;

procedure Tagua_RelRec.addcategoria(var1, var2, var3, var4, var5: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
 begin

    with  ListView1.items.Add do
        begin
           TlistItemText(objects.FindDrawable('Text1')).Text := (xvar1 + var1) ;
           TlistItemText(objects.FindDrawable('Text2')).Text := (xvar2 + var2) ;
           TlistItemText(objects.FindDrawable('Text3')).Text := (xvar3 + var3) ;
           TlistItemText(objects.FindDrawable('Text7')).Text := (xvar4 + var4) ;
           TlistItemText(objects.FindDrawable('Text8')).Text := (var5) ;

           if x=0 then
           begin
             TListItemImage(Objects.FindDrawable('Image6')).Bitmap := Image3.Bitmap ;
             x:=x+1;
           end
           else
           if x=1 then
           begin
            TListItemImage(Objects.FindDrawable('Image6')).Bitmap := Image4.Bitmap ;
             x:=x+1;
            end
            else
           if x=2 then
           begin
             TListItemImage(Objects.FindDrawable('Image6')).Bitmap := Image5.Bitmap ;
             x:=0;
           end;
        end;
 end;


procedure Tagua_RelRec.DateEdit1Change(Sender: TObject);
var
y:integer;
z:string;
begin
    ListView1.Items.Clear;
    x:=0; // vai servir para controlar as imagens na lista
    z:= DateEdit1.Text ;
    agua_DM.RESTRequest4.Execute;
    while Not agua_DM.FDMemTable4.Eof  do
          begin
            if agua_DM.FDMemTable4datax.value =  DateEdit1.Text  then
               begin
                 addcategoria(
                 agua_DM.FDMemTable4.FieldByName('assuntoa').AsString,
                 agua_DM.FDMemTable4.FieldByName('assuntob').AsString,
                 agua_DM.FDMemTable4.FieldByName('assuntoc').AsString,
                 agua_DM.FDMemTable4.FieldByName('datax').AsString,
                 agua_DM.FDMemTable4.FieldByName('nome').AsString);
               end;
                agua_DM.FDMemTable4.Next;
         end ;

         y := ListView1.ItemCount;
         if y < 1 then
         begin
//             showmessage('não há recados neste dia');
             DateEdit1.Date:=date;
         end;

end;

procedure Tagua_RelRec.fecha;
begin
    if Not Assigned(agua_menu) then
           Application.CreateForm(Tagua_menu, agua_menu);
           Application.MainForm := agua_menu;
           agua_menu.Show;
           agua_RelRec.Close;
end;

procedure Tagua_RelRec.carrega;
begin

    agua_DM.RESTClient4.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_falecomigo/cod_falecomigo.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
    agua_DM.RESTRequest4.Method := TRESTRequestMethod.rmGET;
    agua_DM.RESTRequest4.Execute;

end;


end.

