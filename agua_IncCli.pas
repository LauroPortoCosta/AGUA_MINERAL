unit agua_IncCli;

interface

uses
System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Controls,  FMX.Forms,  FMX.Graphics,  FMX.Dialogs,  FMX.Controls.Presentation,
 FMX.Edit,  FMX.Objects,  FMX.Layouts,  FMX.StdCtrls,  FMX.Ani,   FMX.ScrollBox,
 FMX.Memo,  FMX.TabControl,  FMX.Grid,  FMX.ListView.Types,  FMX.ListView.Appearances,
 FMX.ListView.Adapters.Base,  FMX.ListView,  FMX.VirtualKeyboard,  FMX.Platform, System.Actions,
 FMX.ActnList,  Fmx.Bind.Editors,  REST.Types,  FireDAC.Stan.Intf,  FireDAC.Stan.Option,
 FireDAC.Stan.Param,  FireDAC.Stan.Error,  FireDAC.DatS,  FireDAC.Phys.Intf,  FireDAC.DApt.Intf,


    REST.Client,
    REST.Authenticator.Basic,
    REST.Response.Adapter,

    Data.DB,
    Data.Bind.Components,
    Data.Bind.ObjectScope,
    Data.Bind.EngExt,
    Data.Bind.Grid,
    Data.Bind.DBScope,

    FireDAC.Comp.DataSet,
    FireDAC.Comp.Client,

    System.Json.Types,
    System.Json.Readers,
    System.Json.Writers,
    System.Json,
    System.Rtti,
    System.Bindings.Outputs,

    FMX.Grid.Style,
    Fmx.Bind.DBEngExt,
    Fmx.Bind.Grid,
    FMX.DialogService, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D;

type
  Tagua_Inc_cli = class(TForm)
    Lay_cabecalho: TLayout;
    Lay_rodape: TLayout;
    Lay_central: TLayout;
    Lay__central1: TLayout;
    Lay__central2: TLayout;
    ListView1: TListView;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    BufferLayer3D1: TBufferLayer3D;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Image14: TImage;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure addcategoria(var1, var2, var3, var4, var5, var6, var7: string);
    procedure grava;
    procedure carrega;
    procedure fecha;
    { Private declarations }
  public
    { Public declarations }
  xx:string;
  end;

var
  agua_Inc_cli: Tagua_Inc_cli;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu;


procedure Tagua_Inc_cli.Edit11Change(Sender: TObject); // RETIRA DA TEBELA E JOGA NOS EDITs
begin

     if Edit11.Text <> '' then
     begin
     xx:= Edit11.Text;
     agua_DM.RESTClient2.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_usuario/cod_usuario/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest2.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest2.Execute;
       Edit1.Text :=  agua_DM.FDMemTable2.FieldByName('campo1').AsString;
       Edit2.Text :=  agua_DM.FDMemTable2.FieldByName('campo2').AsString ;
       Edit3.Text :=  agua_DM.FDMemTable2.FieldByName('campo3').AsString   ;
       Edit4.Text :=  agua_DM.FDMemTable2.FieldByName('campo4').AsString ;
       Edit5.Text :=  agua_DM.FDMemTable2.FieldByName('email').AsString;
       Edit6.Text :=  agua_DM.FDMemTable2.FieldByName('id').AsString ;
       Edit7.Text :=  agua_DM.FDMemTable2.FieldByName('nivel').AsString   ;
       Edit8.Text :=  agua_DM.FDMemTable2.FieldByName('nomex').AsString ;
       Edit9.Text :=  agua_DM.FDMemTable2.FieldByName('senha').AsString   ;
       Edit10.Text :=  agua_DM.FDMemTable2.FieldByName('aptx').AsString   ;
     end;
 end;



procedure Tagua_Inc_cli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=TCloseAction.caFree;
agua_Inc_cli:=nil;
carrega;

end;

procedure Tagua_Inc_cli.FormCreate(Sender: TObject); // um loop na tabela para carregar addcategoria
begin
        agua_DM.RESTRequest2.Execute;
        while Not agua_DM.FDMemTable2.Eof  do
         begin
              if agua_DM.FDMemTable2aptx.value = '8888' then
             begin
                addcategoria(
                agua_DM.FDMemTable2.FieldByName('id').AsString,
                agua_DM.FDMemTable2.FieldByName('nomex').AsString,
                agua_DM.FDMemTable2.FieldByName('senha').AsString,
                agua_DM.FDMemTable2.FieldByName('campo1').AsString,
                agua_DM.FDMemTable2.FieldByName('campo2').AsString,
                agua_DM.FDMemTable2.FieldByName('campo3').AsString,
                agua_DM.FDMemTable2.FieldByName('campo4').AsString);
             end;
                agua_DM.FDMemTable2.Next;
         end ;

end;

procedure Tagua_Inc_cli.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure Tagua_Inc_cli.Image14Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_Inc_cli.Image1Click(Sender: TObject);
begin
if Edit11.Text= '' then Edit4.Text:='0';
grava;
end;



procedure Tagua_Inc_cli.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
x2:string;

begin
x2:=Aitem.TagString;
Edit11.Text :=x2;
end;




procedure Tagua_Inc_cli.addcategoria(var1, var2, var3, var4, var5, var6, var7: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
 begin
    with  ListView1.items.Add do
        begin
           TlistItemText(objects.FindDrawable('Text1')).Text :=var1;
           TlistItemText(objects.FindDrawable('Text2')).Text :=var2;
           tagstring:=var1;
        end;
 end;


procedure Tagua_Inc_cli.grava; // GRAVA ALTERACAO
var
cc:string;
begin
//showmessage( 'o valor de xx é => '+ xx );


if xx <> '' then
begin
  agua_DM.RESTClient2.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_usuario/cod_usuario/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
  agua_DM.RESTRequest2.Method := TRESTRequestMethod.rmPATCH;
  agua_DM.RESTRequest2.Params.Clear;                                                       // limpa o RESTRequest1
  agua_DM.RESTRequest2.Params.AddItem;                                                     // adiciona item
  agua_DM.RESTRequest2.Params.Items[0].name  := 'param';                                   // item = param
  cc:= '{"campo1":"'+Edit1.Text+'","campo2":"'+Edit2.Text+'","campo3":"'+Edit3.Text+'","campo4":"'+Edit4.Text+'","email":"'+Edit5.Text+'","nivel":"'+Edit7.Text+'","nomex":"'+Edit8.Text+'","senha":"'+Edit9.Text+'","aptx":"'+Edit10.Text+'","statusx":"s","id":"'+xx+'"}';                     // cc é uma string composta de um Json feito na mao
  agua_DM.RESTRequest2.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
  agua_DM.RESTRequest2.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
  agua_DM.RESTRequest2.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
  agua_DM.RESTRequest2.Execute;
  showmessage('alteração efetuada');
end;
       Edit1.Text :='';
       Edit2.Text :='';
       Edit3.Text :='';
       Edit4.Text :='';
       Edit5.Text :='';
       Edit6.Text :='';
       Edit7.Text :='';
       Edit8.Text :='';
       Edit9.Text :='';
       Edit10.Text :='';
       Edit11.Text :='';

end;


procedure Tagua_Inc_cli.carrega;
begin
    agua_DM.RESTClient2.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_usuario/cod_usuario.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
    agua_DM.RESTRequest2.Method := TRESTRequestMethod.rmGET;
    agua_DM.RESTRequest2.Execute;
end;


procedure Tagua_Inc_cli.fecha;
begin
   if Not Assigned(agua_menu) then
      Application.CreateForm(Tagua_menu, agua_menu);
      Application.MainForm := agua_menu;
      agua_menu.Show;
      agua_Inc_cli.Close;
end;



end.
