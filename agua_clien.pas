unit agua_clien;

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
    FMX.DialogService;

type
  Tagua_cliente = class(TForm)
    Layout_cabecalho: TLayout;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Image11: TImage;
    Label2: TLabel;
    Layout_caixa_central: TLayout;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    Label3: TLabel;
    ListView1: TListView;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    GradientAnimation1: TGradientAnimation;
    procedure FormCreate(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListView1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image14Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure addcategoria(var1, var2, var3, var4, var5, var6, var7: string);
    procedure fecha;
    { Private declarations }
  public
    { Public declarations }
                 xvar1         : String;
                 xvar2         : String;
                 xvar3         : String;   // controla as variaveis do relatorio
                 xvar4         : String;   // controla as variaveis do relatorio
                 xvar5         : String;
                 xvar6         : String;
                 xvar7         : String;
                 unha_data     : String;
                 unha2_hora    : String;
                 unha3_servico : String;
                 unha7_nome    : String;
                 xtag          : integer;
                 x_OnClik      : Integer;
                 so_para_zero  : integer;



  end;

var
  agua_cliente: Tagua_cliente;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu;



procedure Tagua_cliente.FormCreate(Sender: TObject);
begin
      // x:=0; // vai servir para controlar as imagens na lista

        agua_DM.RESTRequest2.Execute;
        while Not agua_DM.FDMemTable2.Eof  do
         begin
              if agua_DM.FDMemTable2aptx.value = '8888' then
             begin
                addcategoria(
                agua_DM.FDMemTable2.FieldByName('nomex').AsString,
                agua_DM.FDMemTable2.FieldByName('email').AsString,
                agua_DM.FDMemTable2.FieldByName('senha').AsString,
                agua_DM.FDMemTable2.FieldByName('campo1').AsString,
                agua_DM.FDMemTable2.FieldByName('campo2').AsString,
                agua_DM.FDMemTable2.FieldByName('campo3').AsString,
                agua_DM.FDMemTable2.FieldByName('campo4').AsString);
             end;
                agua_DM.FDMemTable2.Next;
         end ;
end;


procedure Tagua_cliente.FormKeyUp(Sender: TObject; var Key: Word;
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


procedure Tagua_cliente.Image11Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_cliente.Image14Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_cliente.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
//showmessage('este é o registro '+ Aitem.Index.ToString);
end;

procedure Tagua_cliente.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 item : TListViewItem;                                                           // estou criando uma variável  Item ( sem o 's' de items ) do timpo TListViewItem ( dentro dela vai ter vários items )

  begin
    if ItemObject <> nil then                                                    // se foi clicado em um lucar nao determinado (objeto), ele evita que vem para ca
       if ItemObject.Name = 'Image11' then                                        // testa se o item (objeto) clicado e nossa image7
          begin
            item := ListView1.Items[ItemIndex];                                 // capturei o item da listiviw que foi clicado
            if item.Tag =  0 then                                                // a tag está no TListView/Properties/Object Inspector ( vamos coloar o valor de 0 ou 1 )
               item.Tag := 1                                                     // tag do meu item // estou guardando 0 ou 1
            else
               item.Tag := 0;
               ListView1.Resize;                                                 // ele chama minha PROCEDURE  UpdateObjects ( nela meu formulario abre e fecha de acordo com a tag )
          end;

end;

procedure Tagua_cliente.ListView1UpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin

     if  AItem.Tag     = 0  then                                                 // a variável AItem faz parte da procedure .... observe const AItem: TListViewItem...
         begin                                                                   // se a tag igual a zero tela fechada
         AItem.Height := 40;                                                     // tamanho da janela 80 cm
         TlistItemText(Aitem.Objects.FindDrawable('Text2')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text3')).visible := false;    // escondendo o objeto
         TListItemImage(Aitem.Objects.FindDrawable('Image4')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image5')).visible := false; ;

         TlistItemText(Aitem.Objects.FindDrawable('Text7')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text8')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text9')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text10')).visible := false;    // escondendo o objeto

         TListItemImage(Aitem.Objects.FindDrawable('Image12')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image13')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image14')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image15')).visible := false; ;




     end
     else
     begin
         Aitem.Height := 250;                                                    // caso contrario a janela abre 180 cmm
         TlistItemText(Aitem.Objects.FindDrawable('Text1')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text2')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text3')).visible := true;     // tornando o objeto visivel

         TlistItemText(Aitem.Objects.FindDrawable('Text7')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text8')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text9')).visible := true;
         TlistItemText(Aitem.Objects.FindDrawable('Text10')).visible := true;

         TListItemImage(Aitem.Objects.FindDrawable('Image4')).visible := true;
         TListItemImage(Aitem.Objects.FindDrawable('Image5')).visible := true;



         TListItemImage(Aitem.Objects.FindDrawable('Image12')).visible := true;
         TListItemImage(Aitem.Objects.FindDrawable('Image13')).visible := true;
         TListItemImage(Aitem.Objects.FindDrawable('Image14')).visible := true;
         TListItemImage(Aitem.Objects.FindDrawable('Image15')).visible := true;




//
//         TListItemImage(Aitem.Objects.FindDrawable('Image6')).Bitmap := Image3.Bitmap ;
//         TListItemImage(Aitem.Objects.FindDrawable('Image5')).Bitmap := Image4.Bitmap ;
//         TListItemImage(Aitem.Objects.FindDrawable('Image4')).Bitmap := Image1.Bitmap ;
//         TListItemImage(Aitem.Objects.FindDrawable('Image11')).Bitmap := Image5.Bitmap ;

     end;

end;

//________________________________________________________________________________________________________________________________________ADDCATEGORIA__________________//
procedure Tagua_cliente.addcategoria(var1, var2, var3, var4, var5, var6, var7: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
 begin
    with  ListView1.items.Add do
        begin
           TlistItemText(objects.FindDrawable('Text1')).Text := (xvar1 + var1) ;
           TlistItemText(objects.FindDrawable('Text2')).Text := (xvar2 + var2) ;
           TlistItemText(objects.FindDrawable('Text3')).Text := (xvar3 + var3) ;

           TlistItemText(objects.FindDrawable('Text7')).Text := (xvar4 + var4) ;
           TlistItemText(objects.FindDrawable('Text8')).Text := (xvar5 + var5) ;
           TlistItemText(objects.FindDrawable('Text9')).Text := (xvar6 + var6) ;
           TlistItemText(objects.FindDrawable('Text10')).Text :=(xvar7 + var7) ;

           TListItemImage(Objects.FindDrawable('Image6')).Bitmap := Image7.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image9.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image1.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image11')).Bitmap := Image3.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image12')).Bitmap := Image6.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image13')).Bitmap := Image8.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image14')).Bitmap := Image4.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image15')).Bitmap := Image5.Bitmap ;




        end;
 end;


procedure Tagua_cliente.fecha;
begin
   if Not Assigned(agua_menu) then
           Application.CreateForm(Tagua_menu, agua_menu);
           Application.MainForm := agua_menu;
           agua_menu.Show;
           agua_cliente.Close;
end;


end.
