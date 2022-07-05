unit agua_vendas;

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
 FMX.ListBox, System.ImageList, FMX.ImgList, FMX.ExtCtrls,
 FMX.BitmapHelper, System.Generics.Collections;

 // PARA A URL
//  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
//  FMX.BitmapHelper, FMX.ListBox, System.Generics.Collections;


type
  Tagua_venda = class(TForm)
    Layout_cabecalho: TLayout;
    Rectangle2: TRectangle;
    Image3: TImage;
    Label2: TLabel;
    Layout_central: TLayout;
    Label3: TLabel;
    Label6: TLabel;
    StyleBook1: TStyleBook;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    ListView1: TListView;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Rectangle_comando: TRectangle;
    Image11: TImage;
    Image12: TImage;
    Label_resultado: TLabel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    procedure Image14Click(Sender: TObject);
    procedure volta;
    procedure Label2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListView1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure carrega;
    procedure roda;
    procedure grava;
    procedure roda2;
    procedure addcategoria(var1, var2, var3, var4, var5: string);
    procedure roda3;
    { Private declarations }
  public
    { Public declarations }
         xtag          : integer;
         x             : integer;
         w1            : string; // para controlar o roda 3
         z1            : string;
         ff            : string;
         vdados1       : string;
         vdados2       : string;
         vdados3       : string;
         vdados4       : string;
         quantidade    : integer;
         tag_id        : integer;
         passei_no_zap : integer;
 end;

var
  agua_venda: Tagua_venda;

implementation

{$R *.fmx}

uses agua1_DM, agua_login, agua1_menu, OpenViewUrl;


procedure Tagua_venda.FormCreate(Sender: TObject); // ON CREATE  - primeira tela a ser exibida
begin
        FloatAnimation1.Start;
        passei_no_zap:=0;
        Label6.Text := agua1_login.transp_nome;                                 // captura o nome do usuario
        x:=0;                                                                   // vai servir para controlar as imagens na lista
        agua_DM.RESTRequest5.Execute;                                           //TABELA DE PREÇO
        while Not agua_DM.FDMemTable5.Eof  do
         begin
//           if agua_DM.FDMemTable5statusx.value <> '' then
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

procedure Tagua_venda.FormKeyUp(Sender: TObject; var Key: Word;
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



procedure Tagua_venda.FormShow(Sender: TObject);
begin
//           Image15.Visible:=true;
           FloatAnimation1.Start;

end;

procedure Tagua_venda.Image11Click(Sender: TObject);
var   // BOTAO SUBTRAI  -
   u  : integer;
begin
   u := StrToInt(Label_resultado.Text);
   u := u -1;
   if u < 0  then u:=0;
   Label_resultado.Text:= IntToStr(u);
   quantidade:=u;
end;


procedure Tagua_venda.Image12Click(Sender: TObject);
var  // BOTAO SOMA +
u  : integer;
begin
   u := StrToInt(Label_resultado.Text) ;
   u := u + 1;
   Label_resultado.Text:= IntToStr(u);
   quantidade:=u;
end;


procedure Tagua_venda.Image13Click(Sender: TObject);
begin // CONFIRMACAO DO PEDIDO - QUANTIDADE
showmessage('Quantidade solicitada '+ IntToStr(quantidade));
grava;
Rectangle_comando.Visible:=False;
end;

procedure Tagua_venda.Image14Click(Sender: TObject);
begin
volta;
end;


procedure Tagua_venda.Label2Click(Sender: TObject);
begin
volta;
end;


procedure Tagua_venda.ListView1Change(Sender: TObject);
begin
FloatAnimation1.Start;
end;

procedure Tagua_venda.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   ff:= AItem.TagString;  // coloca na ff o item selecionado no pedido
end;

procedure Tagua_venda.ListView1ItemClickEx(const Sender: TObject;
ItemIndex: Integer; const LocalClickPos: TPointF;   // ITEM CLICK EX
const ItemObject: TListItemDrawable);              // ESCOLHA DO PRODUTO
begin
      if (ItemObject.Name = 'Image6')  then
      begin
           TDialogService.MessageDialog('Informar a quantidade',   // FMX.DialogService   =>  TDialogService.MessageDialog('Confirma exclusão do lançamento?',
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
                        Rectangle_comando.Visible:=True;
                        finally
                      end;
                   end;
              end);
      end else
      begin
      Rectangle_comando.Visible:=false;
      end;
end;



//////////////////////////
///     R O D A
///////////////////////////
procedure Tagua_venda.roda;
var
 z: integer;  // esta é a variavel para controlar o registros ... ficou publica a variavel   z1
begin
    z:=0;
    agua_DM.RESTRequest4.Execute;                                                // 4 e mensagem
    while not agua_DM.FDMemTable4.Eof do                                        // faça enquanto nao for o fim do arquivo
    begin
    agua_DM.FDMemTable3statusx.Tag := z;
    z:=z+1;                                                                 // acrescente um contador
    z1:=IntToStr(z);
    agua_DM.FDMemTable4.Next;
    end;
    if StrToInt(z1) < z then z1:=IntToStr(z+1);
end;



//////////////////////////
///     R O D A  3
///////////////////////////
procedure Tagua_venda.roda3;
var
 z: integer;  // esta é a variavel para controlar o registros ... ficou publica a variavel   z1
begin
     z:=0;
    agua_DM.RESTRequest3.Execute;                                                // 4 e mensagem
    while not agua_DM.FDMemTable3.Eof do                                        // faça enquanto nao for o fim do arquivo
    begin
    z:=z+1;                                                                 // acrescente um contador
    agua_DM.FDMemTable3.Next;
    end;
    w1:=IntToStr(z);
    if StrToInt(w1) < z then w1:=IntToStr(z+1);
end;


//----------------
// vamos gravar
//----------------
procedure Tagua_venda.grava;
var
    cc:string;
    xx:string;
    dd:string;
    jj:string;
    yy:string;
    uu:string;
    quantidadeS:string;

 begin  // SALVA - POT //
  dd:=DateToStr(now);
  jj:='Solicitei o produto';
  yy:='número [ '+ff+' ] ' ;
    // -----------------------------------------//
   //             GRAVA OS RECADOS             //
  //------------------------------------------//
  roda2;  // buscou os valores de vdados1 2.3...
  roda;  // faz o sistema rodar o numero de registro ..
  agua_DM.RESTClient4.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_falecomigo/cod_falecomigo/'+z1+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
  agua_DM.RESTRequest4.Method := TRESTRequestMethod.rmPATCH;
  agua_DM.RESTRequest4.Params.Clear;                                                       // limpa o RESTRequest1
  agua_DM.RESTRequest4.Params.AddItem;                                                     // adiciona item
  agua_DM.RESTRequest4.Params.Items[0].name  := 'param';                                   // item = param
  cc:= '{"assuntoa":"'+jj+'","assuntob":"'+vdados1+'","assuntoc":"'+vdados2+'","datax":"'+dd+'","aptx":"8888","statusx":"s","id":"'+z1+'","nome":"'+label6 .Text+'"}';                     // cc é uma string composta de um Json feito na mao
  agua_DM.RESTRequest4.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
  agua_DM.RESTRequest4.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
  agua_DM.RESTRequest4.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
  agua_DM.RESTRequest4.Execute;

   ////////  AGORA VAI GRAVAR O ARQUIVO AGUA , REFERENTE O PEDIDO
   begin
      roda3;
//      showmessage('quantos registro tem de pedido .... ' + w1 );
      quantidadeS:=IntToStr(quantidade);
      agua_DM.RESTClient3.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_agua/reg_agua/'+w1+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
      agua_DM.RESTRequest3.Method := TRESTRequestMethod.rmPATCH;
      agua_DM.RESTRequest3.Params.Clear;                                                       // limpa o RESTRequest1
      agua_DM.RESTRequest3.Params.AddItem;                                                     // adiciona item
      agua_DM.RESTRequest3.Params.Items[0].name  := 'param';                                   // item = param
      cc:= '{"datax":"'+dd+'","descri":"'+vdados1+'","marca":"'+vdados2+'","id":"'+w1+'","nomex":"'+Label6.Text+'","qt":"'+quantidadeS+'","statusx":"s","valor":"'+vdados3+'"}';
      agua_DM.RESTRequest3.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
      agua_DM.RESTRequest3.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
      agua_DM.RESTRequest3.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
      agua_DM.RESTRequest3.Execute;
      showmessage('pedido efetuado');
      Label_resultado.Text:='0';
      quantidadeS:='0';
      quantidade:=0;
      passei_no_zap:=1;
   end;
   carrega;
   volta;
 end;



procedure Tagua_venda.roda2;  //variáveis globais VDADOS1 ... o conteudo da tabela5 tabela_preço
 begin
   agua_DM.RESTRequest5.Execute;
   while Not agua_DM.FDMemTable5.Eof  do
         begin
          if ff = agua_DM.FDMemTable5id.value then   //  o ff foi capturado no clique on X, e tem o registro
            begin
            xtag    := agua_DM.FDMemTable5.Tag;
            vdados1 := agua_DM.FDMemTable5.FieldByName('dados1').AsString;
            vdados2 := agua_DM.FDMemTable5.FieldByName('dados2').AsString;
            vdados3 := agua_DM.FDMemTable5.FieldByName('dados3').AsString;
            vdados4 := agua_DM.FDMemTable5.FieldByName('dados4').AsString;
          end;
            agua_DM.FDMemTable5.Next;
   end ;
 end;


procedure Tagua_venda.carrega;
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

procedure Tagua_venda.volta;
var
    minha_api:string;
    by : string;
begin

  by:= agua1_login.transp_nome;
  if passei_no_zap = 1 then
     begin
      // ================================== enviando mensagem pelo WHATSAPP ======================================================================
      minha_api:='https://api.whatsapp.com/Send?phone=553391322416&text=' + '*' + 'Enviei um pediddo pelo APP:   ' + by + '         ' + vdados1 +'        '+ vdados2+'       ' + vdados3;
      // OpenURL('https://api.whatsapp.com/Send?phone=553391322416&text=TESTANDO 123');
      OpenURL(minha_api);
      passei_no_zap := 0;
      end;



 if Not Assigned(agua_menu) then
        Application.CreateForm(Tagua_menu, agua_menu);
        Application.MainForm := agua_menu;
        agua_menu.Show;
        agua_venda.Close;
 end;

//________________________________________________________________________________________________________________________________________ADDCATEGORIA__________________//
procedure Tagua_venda.addcategoria(var1, var2, var3, var4, var5: string ); // procedure que jogará dentro da list view os dados recolhidos dentro da tab
 begin


    with  ListView1.items.Add do
        begin
           tagstring:=var5;
           TlistItemText(objects.FindDrawable('Text1')).Text := var1 ;
           TlistItemText(objects.FindDrawable('Text2')).Text := var2 ;
           TlistItemText(objects.FindDrawable('Text3')).Text := var3 ;
           TlistItemText(objects.FindDrawable('Text7')).Text := var4 ;
           TlistItemText(objects.FindDrawable('Text8')).Text := var5 ;
           TListItemImage(Objects.FindDrawable('Image4')).Bitmap := Image8.Bitmap ;
           TListItemImage(Objects.FindDrawable('Image6')).Bitmap := Image10.Bitmap ;


           if x=0 then
           begin
             TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image1.Bitmap ;
             x:=x+1;
           end
           else
           if x=1 then
           begin
            TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image2.Bitmap ;
             x:=x+1;
            end
           else
           if x=2 then
           begin
            TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image3.Bitmap ;
             x:=x+1;
            end
           else
           if x=3 then
           begin
            TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image4.Bitmap ;
             x:=x+1;
            end
            else
           if x=4 then
           begin
            TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image5.Bitmap ;
             x:=x+1;
            end
            else
           if x=5 then
           begin
            TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image6.Bitmap ;
             x:=x+1;
            end
            else
           if x=6 then
           begin
             TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image7.Bitmap ;
             x:=x+1;
           end
            else
           if x=7 then
           begin
             TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image9.Bitmap ;
             x:=x+1;
           end
            else
           if x >= 8 then
           begin
             TListItemImage(Objects.FindDrawable('Image5')).Bitmap := Image9.Bitmap ;
             x:= 0;
           end;
        end;


 end;

end.


