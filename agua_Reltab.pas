unit agua_Reltab; //agua_RelTa

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
 System.Bindings.Outputs,  Data.Bind.Grid,   Data.Bind.DBScope, FMX.DialogService;

type
  Tagua_RelTa = class(TForm)
    Layout_cabecalho: TLayout;
    Rectangle2: TRectangle;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    Label4: TLabel;
    ListView1: TListView;
    Image3: TImage;
    Label2: TLabel;
    Layout_central: TLayout;
    Label3: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image15: TImage;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure addcategoria(var1, var2, var3, var4, var5: string );
    procedure Image14Click(Sender: TObject);
    procedure volta;
    procedure Label2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image3Click(Sender: TObject);

  private
    procedure carrega;
    procedure roda;
    procedure grava;
    procedure roda2;
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
                 x             : integer;
                 z1            : string;
                 ff            :string;
                     vdados1 : string;
                     vdados2 : string;
                     vdados3 : string;
                     vdados4 : string;


  end;

var
  agua_RelTa: Tagua_RelTa;

implementation

{$R *.fmx}

uses agua1_DM, agua_login, agua1_menu;



procedure Tagua_RelTa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
//       FormCreate(Sender);
volta;
end;



procedure Tagua_RelTa.FormCreate(Sender: TObject);
begin
   Label6.Text:= agua1_login.transp_nome;
        x:=0; // vai servir para controlar as imagens na lista
        agua_DM.RESTRequest5.Execute;
        while Not agua_DM.FDMemTable5.Eof  do
         begin
//              if agua_DM.FDMemTable5statusx.value <> '' then
              if agua_DM.FDMemTable5unidade.value = 'agua' then

             begin
                addcategoria(
                agua_DM.FDMemTable5.FieldByName('dados1').AsString,
                agua_DM.FDMemTable5.FieldByName('dados2').AsString,
                agua_DM.FDMemTable5.FieldByName('dados3').AsString,
                agua_DM.FDMemTable5.FieldByName('dados4').AsString,
                agua_DM.FDMemTable5.FieldByName('id').AsString);
             end;
                agua_DM.FDMemTable5.Next;
         end ;
end;


procedure Tagua_RelTa.FormKeyUp(Sender: TObject; var Key: Word;
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
            else
                 key :=0;
                 volta;
         end;
      end;
{$ENDIF}
end;

procedure Tagua_RelTa.FormShow(Sender: TObject);
begin
       ListView1.Items.Clear;
       FormCreate(Sender);
       end;

procedure Tagua_RelTa.Image14Click(Sender: TObject);
begin
  volta;
end;

procedure Tagua_RelTa.Image1Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_RelTa.Image3Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_RelTa.Label2Click(Sender: TObject);
begin
volta;
end;



procedure Tagua_RelTa.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
 begin
  ff:=Aitem.TagString; // armazena o valor de N quando a reserva já esta confirmada
end;



procedure Tagua_RelTa.ListView1ItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
y   : TListItemObjectClass;
cc  : string;
x   : string;
txt: TListItemText;
begin

      if (ItemObject.Name = 'Image6')  then
      begin
           TDialogService.MessageDialog('Obrigado pela escolha',   // FMX.DialogService   =>  TDialogService.MessageDialog('Confirma exclusão do lançamento?',
           TMsgDlgType.mtConfirmation,
           [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
           TMsgDlgBtn.mbNo,
           0,
              procedure(const AResult: TModalResult )
              var
              erro: string;
              begin
                   if AResult = mrYes then
                   begin

                      try
                         grava;
                      finally
                          end;

                   end;
              end);

      end else
      begin
 //       showmessage( 'clique no carrinho' );
      end;

end;


//________________________________________________________________________________________________________________________________________ADDCATEGORIA__________________//
procedure Tagua_RelTa.addcategoria(var1, var2, var3, var4, var5: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
 begin

    with  ListView1.items.Add do
        begin
           tagstring:=var5;
           TlistItemText(objects.FindDrawable('Text1')).Text := var1 ;
           TlistItemText(objects.FindDrawable('Text2')).Text := var2 ;
           TlistItemText(objects.FindDrawable('Text3')).Text := var3 ;
           TlistItemText(objects.FindDrawable('Text7')).Text := var4 ;
           TlistItemText(objects.FindDrawable('Text8')).Text := var5 ;
           TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image15.Bitmap ;

           if x=0 then
           begin
             TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image4.Bitmap ;
             x:=x+1;  // garrafa derramando no mar  - reg 10 - primeiro  ( repetido com o terceiro )
           end
           else
           if x=1 then
           begin
            TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image5.Bitmap ;
             x:=x+1; // duas garrafas e um copo = reg 12 = segundo
            end
           else
           if x=2 then
           begin
            TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image6.Bitmap ;
             x:=x+1;  // garrafa derramando no mar  - reg 13 - terceiro ( repetido com primeiro )
            end
           else
           if x=3 then
           begin
            TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image7.Bitmap ;
             x:=x+1; // trez galoes de 5 litros - reg 14 - quarto
            end
            else
           if x=4 then
           begin
            TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image8.Bitmap ;
             x:=x+1; // agua caindo no copo - reg 15
            end
            else
           if x=5 then
           begin
            TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image9.Bitmap ;
             x:=x+1; // garrafa caida 1 copo - reg 16
            end
            else
           if x=6 then
           begin
             TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image10.Bitmap ;
             x:=0;      // galao 5 l   reg 17
           end;
        end;
 end;



//////////////////////////
///     R O D A
///////////////////////////
procedure Tagua_RelTa.roda;
var
    z: integer;  // esta é a variavel para controlar o registros ... ficou publica a variavel   z1
begin
    z:=0;
    agua_DM.RESTRequest4.Execute;
    while not agua_DM.FDMemTable4.Eof do    // faça enquanto nao for o fim do arquivo
    begin
        agua_DM.FDMemTable3statusx.Tag := z;
        z:=z+1;                    // acrescente um contador
        z1:=IntToStr(z);
        agua_DM.FDMemTable4.Next;
     end;
    if StrToInt(z1) < z then z1:=IntToStr(z+1);
end;



//----------------
// vamos gravar
//----------------
procedure Tagua_RelTa.grava;
var
cc:string;
xx:string;
dd:string;
jj:string;
yy:string;
uu:string;
minha_api:string;

 begin  // SALVA - POT //

  dd:=DateToStr(now);
  jj:='Solicitei a tabela de ';
  yy:='número [ '+ff+' ] ' ;
//  uu:='e a reserva [ '+ FrmPrincipal.confirma_falso+' ]';     ........................// la //

  roda2;  // buscou os valores de vdados1 2.3...
  roda;  // faz o sistema rodar o numero de registro ..
  agua_DM.RESTClient4.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_falecomigo/cod_falecomigo/'+z1+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
  agua_DM.RESTRequest4.Method := TRESTRequestMethod.rmPATCH;
  agua_DM.RESTRequest4.Params.Clear;                                                       // limpa o RESTRequest1
  agua_DM.RESTRequest4.Params.AddItem;                                                     // adiciona item
  agua_DM.RESTRequest4.Params.Items[0].name  := 'param';                                   // item = param
  cc:= '{"assuntoa":"'+jj+'","assuntob":"'+vdados1+'","assuntoc":"'+vdados2+'","datax":"'+dd+'","aptx":"9999","statusx":"s","id":"'+z1+'","nome":"'+label6.Text+'"}';                     // cc é uma string composta de um Json feito na mao
  agua_DM.RESTRequest4.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
  agua_DM.RESTRequest4.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
  agua_DM.RESTRequest4.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
  agua_DM.RESTRequest4.Execute;
  showmessage('menssagem enviada');

   //////// doido de mais
// la //  if FrmPrincipal.pula_pula='ok' then  .................// la //
   begin
// la //     FrmPrincipal.pula_pula:='  ' ;  ................. // la //
// la //      xx:=FrmPrincipal.confirma_falso;  // confirma_falso é uma variavel publica que recebe o valor da tag_string da FD_MAMTABLE3
      agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
      agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmPATCH;
      agua_DM.RESTRequest3.Params.Clear;                                                       // limpa o RESTRequest1
      agua_DM.RESTRequest3.Params.AddItem;                                                     // adiciona item
      agua_DM.RESTRequest3.Params.Items[0].name  := 'param';                                   // item = param
      cc:= '{"descri":"'+vdados1+'","marca":"'+vdados2+'","valor":"'+vdados3+'"}';                     // cc é uma string composta de um Json feito na mao
      agua_DM.RESTRequest3.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
      agua_DM.RESTRequest3.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
      agua_DM.RESTRequest3.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
      agua_DM.RESTRequest3.Execute;

      // ================================== enviando mensagem pelo WHATSAPP ======================================================================

      minha_api:='https://api.whatsapp.com/Send?phone=553399906951&text=' + '*' + 'Acabei fazer um agendamento : ' + '*' + '         ' + vdados1 +'        '+ vdados2+'       ' + vdados3;

 //      OpenURL('https://api.whatsapp.com/Send?phone=553391970817 84047669&text=TESTANDO 123');

// lau //       OpenURL(minha_api);

   end;
   carrega;
   volta;
 end;



procedure Tagua_RelTa.roda2;  // carrega dentro de variáveis globais VDADOS1 ... o conteudo da tabela5 tabela_preço
 begin
   agua_DM.RESTRequest5.Execute;
   while Not agua_DM.FDMemTable5.Eof  do
         begin
          if ff = agua_DM.FDMemTable5id.value then   //  o ff foi capturado no clique on X, e tem o registro
            begin
            vdados1 := agua_DM.FDMemTable5.FieldByName('dados1').AsString;
            vdados2 := agua_DM.FDMemTable5.FieldByName('dados2').AsString;
            vdados3 := agua_DM.FDMemTable5.FieldByName('dados3').AsString;
            vdados4 := agua_DM.FDMemTable5.FieldByName('dados4').AsString;

          end;
         agua_DM.FDMemTable5.Next;
   end ;
 end;

procedure Tagua_RelTa.carrega;
begin
     agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest3.Execute;

     agua_DM.RESTClient4.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_falecomigo/cod_falecomigo/.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest4.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest4.Execute;

     agua_DM.RESTClient5.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela/cod_tabela.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest5.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest5.Execute;

 end;

procedure Tagua_RelTa.volta;
begin
        ListView1.Items.Clear;
        carrega;
   Label6.Text:= agua1_login.transp_nome;
        x:=0; // vai servir para controlar as imagens na lista
        agua_DM.RESTRequest5.Execute;
        while Not agua_DM.FDMemTable5.Eof  do
         begin
//              if agua_DM.FDMemTable5statusx.value <> '' then
              if agua_DM.FDMemTable5unidade.value = 'agua' then

             begin
                addcategoria(
                agua_DM.FDMemTable5.FieldByName('dados1').AsString,
                agua_DM.FDMemTable5.FieldByName('dados2').AsString,
                agua_DM.FDMemTable5.FieldByName('dados3').AsString,
                agua_DM.FDMemTable5.FieldByName('dados4').AsString,
                agua_DM.FDMemTable5.FieldByName('id').AsString);
             end;
                agua_DM.FDMemTable5.Next;
         end ;


 if Not Assigned(agua_menu) then
        Application.CreateForm(Tagua_menu, agua_menu);
        Application.MainForm := agua_menu;
        agua_menu.Show;
        agua_RelTa.Close;
 end;

end.
