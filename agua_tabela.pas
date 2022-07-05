unit agua_tabela;

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
  Tagua_tabel = class(TForm)
    Layout_cabecalho: TLayout;
    Rectangle2: TRectangle;
    Layout_caixa_central: TLayout;
    Lay_segundo: TLayout;
    RoundRect6: TRoundRect;
    Edit5: TEdit;
    Label13: TLabel;
    Lay_terceiro: TLayout;
    RoundRect3: TRoundRect;
    Edit2: TEdit;
    Label14: TLabel;
    Lay_primeiro: TLayout;
    RoundRect4: TRoundRect;
    Edit3: TEdit;
    Label12: TLabel;
    Lay_botao: TLayout;
    RoundRect1: TRoundRect;
    Label5: TLabel;
    FloatAnimation1: TFloatAnimation;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    Label4: TLabel;
    Image9: TImage;
    Label3: TLabel;
    Lay_quarto: TLayout;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    CornerButton1: TCornerButton;
    Edit4: TEdit;
    Label6: TLabel;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Image1: TImage;
    StyleBook1: TStyleBook;
    Label2: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Rectangle5: TRectangle;
    Edit6: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure carrega;
    procedure fim;
    procedure mostra_imagem;
    procedure esconde_imagem;
    { Private declarations }
  public
    { Public declarations }
  salvacao:string;
  controle:integer;
  z:integer;
  end;

var
  agua_tabel: Tagua_tabel;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu;



procedure Tagua_tabel.CornerButton1Click(Sender: TObject);
begin
if Edit4.Text= '' then Edit4.Text:='0';
controle:=1;
salvacao:=Edit4.Text;
RoundRect1Click(Sender);
end;


procedure Tagua_tabel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    carrega;
    Action:= TCloseAction.caFree;   // LIMPA A TELA
    agua_tabel := nil;            // ZERA OS CAMPOS
    carrega;

end;



procedure Tagua_tabel.FormCreate(Sender: TObject);
begin
     agua_DM.RESTClient5.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela/cod_tabela.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest5.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest5.Execute;
     agua_DM.FDMemTable5.First;
     z:=agua_DM.FDMemTable5.RecordCount -1; // a quantidade de registros - 1 // o motivo é que tem um registro que é 0
     controle:=0; // será usado para controlar se esta alterando ou incluindo
end;



procedure Tagua_tabel.FormKeyUp(Sender: TObject; var Key: Word;
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
                fim;
            end
            else if  not Assigned(agua_menu) then   // executo no relatorio e vou para o menu
            begin
                Key := 0;
                fim;
            end
            else if  not Assigned(agua_menu) then
                 key :=0;
                 fim;
         end;
      end;
{$ENDIF}
end;

procedure Tagua_tabel.Image14Click(Sender: TObject);
begin
fim;
end;



procedure Tagua_tabel.Image1Click(Sender: TObject);
var
xx: string ;
begin
     esconde_imagem;
     xx:= Edit4.Text;
     agua_DM.RESTClient5.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela/cod_tabela/'+xx+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest5.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest5.Execute;

 if  agua_DM.FDMemTable5.FieldByName('unidade').AsString = 'agua'  then
     begin
       Edit4.Text :=  agua_DM.FDMemTable5.FieldByName('id').AsString ;
       Edit3.Text :=  agua_DM.FDMemTable5.FieldByName('dados1').AsString;
       Edit5.Text :=  agua_DM.FDMemTable5.FieldByName('dados2').AsString ;
       Edit2.Text :=  agua_DM.FDMemTable5.FieldByName('dados3').AsString   ;
       Edit1.Text :=  agua_DM.FDMemTable5.FieldByName('dados4').AsString ;
       Edit6.Text :=  agua_DM.FDMemTable5.FieldByName('statusx').AsString ;
       mostra_imagem;

     end else
     begin
       showmessage('tabela não localizada');
     end;

 end;

procedure Tagua_tabel.Image9Click(Sender: TObject);
begin
carrega;
fim;
end;



procedure Tagua_tabel.Label5Click(Sender: TObject);
begin
RoundRect1Click(Sender); // so para chamar a tela
end;



procedure Tagua_tabel.RoundRect1Click(Sender: TObject);
var
cc:string;
z1:string;

begin  // SALVA - POT //
FloatAnimation1.Start;
        if controle=1 then
        begin
          z1:=salvacao;
        end
        else
        begin
        Z:=Z+1;
        Z1:=IntToStr(z);
        end;
agua_DM.RESTClient5.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela/cod_tabela/'+z1+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
agua_DM.RESTRequest5.Method := TRESTRequestMethod.rmPATCH;
agua_DM.RESTRequest5.Params.Clear;                                                       // limpa o RESTRequest1
agua_DM.RESTRequest5.Params.AddItem;                                                     // adiciona item
agua_DM.RESTRequest5.Params.Items[0].name  := 'param';                                   // item = param
cc:= '{"dados1":"'+edit3.Text+'","dados2":"'+edit5.Text+'","dados3":"'+edit2.Text+'","dados4":"'+edit1.Text+'","statusx":"'+edit6.Text+'","unidade":"agua","id":"'+z1+'"}';                     // cc é uma string composta de um Json feito na mao
agua_DM.RESTRequest5.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
agua_DM.RESTRequest5.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
agua_DM.RESTRequest5.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
agua_DM.RESTRequest5.Execute;
showmessage('menssagem enviada');
    edit1.Text := '';  // comunicado
    edit2.Text := '';  // comunicado
    edit3.Text := ''; // contexto
    edit5.Text := ''; // operador
    Edit4.Text:='';
    controle:=0;
FloatAnimation1.Inverse:=true;


end;

procedure Tagua_tabel.carrega;
begin

     agua_DM.RESTClient5.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_tabela/cod_tabela.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
     agua_DM.RESTRequest5.Method := TRESTRequestMethod.rmGET;
     agua_DM.RESTRequest5.Execute;

end;


procedure Tagua_tabel.fim;
begin
carrega;

    if  not Assigned(agua_menu) then
    Application.CreateForm(Tagua_menu, agua_menu);
    Application.MainForm := agua_menu;
    agua_menu.Show;
    agua_tabel.Close;
end;


procedure Tagua_tabel.mostra_imagem;
var
xx: integer ;
begin
xx := StrToInt(Edit4.Text);
           case xx  of
           10 : Image2.visible :=  true ;
           11 : Image2.visible :=  true ;
           12 : Image3.visible :=  true ;
           13 : Image4.visible :=  true ;
           14 : Image5.visible :=  true ;
           15 : Image6.visible :=  true ;
           16 : Image7.visible :=  true ;
           17 : Image8.visible := true ;
           18 : Image11.visible := true ;
           19 : Image12.visible := true ;
           20 : Image13.visible := true ;
           end;

end;




procedure Tagua_tabel.esconde_imagem;
begin
            Image2.visible :=  false ;
            Image3.visible :=  false ;
            Image4.visible :=  false ;
            Image5.visible :=  false ;
            Image6.visible :=  false ;
            Image7.visible :=  false ;
            Image8.visible :=  false ;
            Image13.visible := false ;
            Image12.visible := false ;
            Image11.visible := false ;
            Image10.visible := false ;

end;




end.


