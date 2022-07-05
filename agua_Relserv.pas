unit agua_Relserv;

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
  Tagua_Rel = class(TForm)
    Layout_cabecalho: TLayout;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Image2: TImage;
    Layout_caixa_central: TLayout;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    ListView1: TListView;
    Image7: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image8: TImage;
    Image5: TImage;
    Image9: TImage;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Label6: TLabel;
    DateEdit1: TDateEdit;
    CheckBox1: TCheckBox;
    Image13: TImage;
    ActionList1: TActionList;
    Image15: TImage;
    Image12: TImage;
    Image16: TImage;
    procedure Image14Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure ListView1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private
    procedure addcategoria(var1, var2, var3, var4, var5, var6, var7, var8: string);
    procedure volta;
    procedure carrega;
    procedure reverte;
    { Private declarations }
  public
    { Public declarations }

                 unha_data     : String;
                 unha2_hora    : String;
                 unha3_servico : String;
                 unha7_nome    : String;
                 xtag          : integer;
                 x_OnClik      : Integer;
                 so_para_zero  : integer;
                 valor_de_s    : string;  // serve para indicar todos ou so as reservas
                 xy            : string; // armazena data do dia
                 item_consultado2:string;
  end;

var
  agua_Rel: Tagua_Rel;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu, agua_reser_ve;


procedure Tagua_Rel.FormCreate(Sender: TObject);
begin
        ListView1.items.Clear; // tentativa de ficar duplicando o list view
        agua_DM.RESTRequest3.Execute;
        while Not agua_DM.FDMemTable3.Eof  do
         begin
                addcategoria(
                agua_DM.FDMemTable3.FieldByName('datax').AsString,
                agua_DM.FDMemTable3.FieldByName('descri').AsString,
                agua_DM.FDMemTable3.FieldByName('marca').AsString,
                agua_DM.FDMemTable3.FieldByName('nomex').AsString,
                agua_DM.FDMemTable3.FieldByName('id').AsString,
                agua_DM.FDMemTable3.FieldByName('qt').AsString,
                agua_DM.FDMemTable3.FieldByName('statusx').AsString,
                agua_DM.FDMemTable3.FieldByName('valor').AsString
                );
                agua_DM.FDMemTable3.Next;
         end ;

end;

procedure Tagua_Rel.FormKeyUp(Sender: TObject; var Key: Word;
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
                volta;
            end
            else if  not Assigned(agua_menu) then   // executo no relatorio e vou para o menu
            begin
                Key := 0;
                volta;
            end
            else if  not Assigned(agua_menu) then
                 key :=0;
                 volta;
         end;
      end;
{$ENDIF}
end;



procedure Tagua_Rel.FormShow(Sender: TObject);  //_________________________________________________________________________________________ FORM SHOW
begin
//showmessage('entrando no on show ');
  //---------------------------------------- trabalhando ...
 FormCreate(Sender);
end;

procedure Tagua_Rel.Image11Click(Sender: TObject);
begin
ListView1.Items.Clear;
volta;
end;

procedure Tagua_Rel.Image14Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_Rel.Image1Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_Rel.Label2Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_Rel.ListView1ItemClick(const Sender: TObject;
const AItem: TListViewItem);

begin
//      item_consultado2:=IntToStr(AItem.Index) ;  // armazena o valor de N tipo string
      item_consultado2:=(AItem.TagString);  // armazena o valor de N tipo string

end;


procedure Tagua_Rel.ListView1ItemClickEx(const Sender: TObject; //_________________________________________________________________________ ON CLIK EX
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 item : TListViewItem;                                                           // estou criando uma variável  Item ( sem o 's' de items ) do timpo TListViewItem ( dentro dela vai ter vários items )

  begin

    if ItemObject <> nil then  // se foi clicado em um lucar nao determinado (objeto), ele evita que vem para ca
       begin
          if ItemObject.Name = 'Image13' then                                        // testa se o item (objeto) clicado e nossa image7
          begin
            item := ListView1.Items[ItemIndex];                                 // capturei o item da listiviw que foi clicado
            if item.Tag =  0 then                                                // a tag está no TListView/Properties/Object Inspector ( vamos coloar o valor de 0 ou 1 )
               item.Tag := 1                                                     // tag do meu item // estou guardando 0 ou 1
            else
               item.Tag := 0;
               ListView1.Resize;                                                 // ele chama minha PROCEDURE  UpdateObjects ( nela meu formulario abre e fecha de acordo com a tag )
          end else
          if ItemObject.Name = 'Image12' then                                        // testa se o item (objeto) clicado e nossa image7
          begin
             reverte;
          end else
    if    ItemObject.Name = 'Image20' then                                        // testa se o item (objeto) clicado e nossa image7
          begin
            ListView1.Items.Clear;
               Application.CreateForm(Tagua_reservave, agua_reservave);
               Application.MainForm := agua_reservave;
               agua_reservave.Show;
          end
          else
          begin
           // showmessage('click sobre o icone a direita ');
          end;
    end;
  end;


procedure Tagua_Rel.ListView1UpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
 begin                                                                          // OnUpdateObjects => qualquer modificaçao que faço no objeto , ele vem parar aqui .... mudei a tela , cliquei no item etc...

     if  AItem.Tag     = 0  then                                                 // a variável AItem faz parte da procedure .... observe const AItem: TListViewItem...
         begin                                                                   // se a tag igual a zero tela fechada
         AItem.Height := 50;                                                     // tamanho da janela 80 cm
         TlistItemText(Aitem.Objects.FindDrawable('Text1')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text2')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text15')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text16')).visible := false;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text5')).visible := false;    // escondendo o objeto

         TListItemImage(Aitem.Objects.FindDrawable('Image7')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image10')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image17')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image18')).visible := false; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image20')).visible := false; ;

     end
     else
     begin
         Aitem.Height := 200;                                                    // caso contrario a janela abre 180 cmm
         TlistItemText(Aitem.Objects.FindDrawable('Text1')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text3')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text2')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text4')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text5')).visible := true;     // tornando o objeto visivel
         TlistItemText(Aitem.Objects.FindDrawable('Text6')).visible := true;
         TlistItemText(Aitem.Objects.FindDrawable('Text15')).visible := true;    // escondendo o objeto
         TlistItemText(Aitem.Objects.FindDrawable('Text16')).visible := true;    // escondendo o objeto

         TListItemImage(Aitem.Objects.FindDrawable('Image7')).visible := true; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image10')).visible := true; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image17')).visible := true; ;
         TListItemImage(Aitem.Objects.FindDrawable('Image20')).visible := true; ;
     end;
end;

//________________________________________________________________________________________________________________________________________ADDCATEGORIA__________________//
procedure Tagua_Rel.addcategoria(var1, var2, var3, var4, var5, var6, var7, var8: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
var
    variavel    : string;
    quantidade  : string;
     resultado  : string;
     resultado2 : string;
        x  : integer;
        x2 : integer;
        x3 : integer;
        I  : Integer;
 begin

   resultado:= '';
   variavel:= var8;
   quantidade :=IntToStr(length(var8));


      if ( agua_DM.FDMemTable3statusx.value <> valor_de_s)  then
       begin
          with  ListView1.items.Add do
          begin
             TagString := var5; // manicure_DM.FDMemTable3.FieldByName('id').AsString,
             TlistItemText(objects.FindDrawable('Text1')).Text :=  var1 ;
             TlistItemText(objects.FindDrawable('Text3')).Text :=  var2 ;
             TlistItemText(objects.FindDrawable('Text2')).Text :=  var3 ;
             TlistItemText(objects.FindDrawable('Text4')).Text :=  var4 ;
//*****************************************************************************
   for I := 1 to  StrToInt(quantidade) do
   begin
         if variavel[I] = '0' then
            begin
               resultado := resultado + variavel[I];
            end else

         if variavel[I] = '1' then
            begin
               resultado := resultado + variavel[I];
            end else

         if variavel[I] = '2' then
            begin
               resultado := resultado + variavel[I];
            end else

         if variavel[I] = '3' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '4' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '5' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '6' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '7' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '8' then
            begin
               resultado := resultado + variavel[I];
            end else
         if variavel[I] = '9' then
            begin
               resultado := resultado + variavel[I];
            end;
   end;
 //****************************************************************************
           if resultado = ''  then  resultado := '0';

             x2:= StrToInt(resultado) * StrToInt(var6);
             resultado2:=IntToStr(x2);

             TlistItemText(objects.FindDrawable('Text5')).Text :=  resultado2;
             TlistItemText(objects.FindDrawable('Text6')).Text :=  var6 ;
             TlistItemText(objects.FindDrawable('Text15')).Text:=  var8 ;
             TListItemImage(Objects.FindDrawable('Image7')).Bitmap := Image3.Bitmap ;   // data  3
             TListItemImage(Objects.FindDrawable('Image8')).Bitmap := Image7.Bitmap ;   //cara  1
             TListItemImage(Objects.FindDrawable('Image9')).Bitmap := Image4.Bitmap ;   // relog 1a
             TListItemImage(Objects.FindDrawable('Image10')).Bitmap := Image6.Bitmap ;
             TListItemImage(Objects.FindDrawable('Image13')).Bitmap := Image10.Bitmap ;
             TListItemImage(Objects.FindDrawable('Image17')).Bitmap := Image13.Bitmap ;
             TListItemImage(Objects.FindDrawable('Image20')).Bitmap := Image15.Bitmap ;
             TListItemImage(Objects.FindDrawable('Image18')).Bitmap := Image16.Bitmap ;

         //  if var7='s' then TListItemImage(Objects.FindDrawable('Image12')).Bitmap := Image5.Bitmap ;
             if var7='n' then TListItemImage(Objects.FindDrawable('Image12')).Bitmap := Image9.Bitmap ;

          end;

       end;

 end;



 procedure Tagua_Rel.CheckBox1Change(Sender: TObject);
begin
if CheckBox1.IsChecked=true then
   begin
     valor_de_s := 'n' ;
     ListView1.Items.Clear;
     carrega; // atualiza o list view com uma URL
     FormCreate(Sender);
   end;

end;

procedure Tagua_Rel.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.IsChecked=true then
   begin
     valor_de_s := 's' ;
     ListView1.Items.Clear;
     carrega; // atualiza o list view com uma URL
     FormCreate(Sender);

   end;
end;


procedure Tagua_Rel.carrega;
begin
     agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest3.Execute;
end;


procedure Tagua_Rel.volta;
begin
   if Not Assigned(agua_menu) then
      Application.CreateForm(Tagua_menu, agua_menu);
      Application.MainForm := agua_menu;
      agua_menu.Show;
      agua_Rel.Close;
end;


procedure Tagua_Rel.reverte;
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
  cc:= '{"statusx":"s"}';
  agua_DM.RESTRequest3.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest3 o conteudo de cc
  agua_DM.RESTRequest3.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
  agua_DM.RESTRequest3.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
  agua_DM.RESTRequest3.Execute;
  showmessage('salvo com sucesso');
  carrega;
  end;




 end.
