unit agua_recad;

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
  Tagua_rec = class(TForm)
    Layout_cabecalho: TLayout;
    Layout_caixa_central: TLayout;
    Layout_rodape: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image14: TImage;
    Label1: TLabel;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    RoundRect1: TRoundRect;
    Label5: TLabel;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    RoundRect5: TRoundRect;
    RoundRect6: TRoundRect;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    FloatAnimation1: TFloatAnimation;
    Image1: TImage;
    Label4: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    procedure Image14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure roda;
    procedure volta;
    { Private declarations }
  public
    { Public declarations }

    unha7_nome: String;
    var z1: string; //vai guardar o numero de ocorrencias tem
  end;

var
  agua_rec: Tagua_rec;

implementation

{$R *.fmx}

uses agua1_DM, agua1_menu, agua_login;



//----------------------------------------
//////////// ON CRIATE ///////////////////
//---------------------------------------
procedure Tagua_rec.FormCreate(Sender: TObject);
begin
    label6.Text:=agua1_login.transp_nome;
    label15.Text := label6.Text;

    edit4.Text:= DateToStr(Date);
    edit2.Text := '';  // comunicado
    edit3.Text := ''; // contexto
    edit1.Text := ''; // operador


end;




procedure Tagua_rec.FormKeyUp(Sender: TObject; var Key: Word;
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




procedure Tagua_rec.Image14Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_rec.Image1Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_rec.Image3Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_rec.Label2Click(Sender: TObject);
begin

volta;

end;

procedure Tagua_rec.Label5Click(Sender: TObject);
begin
RoundRect1Click(Sender); // so para chamar a tela
end;


//----------------
// vamos gravar
//----------------
procedure Tagua_rec.RoundRect1Click(Sender: TObject);
var
cc:string;
xx:string;

begin  // SALVA - POT //
FloatAnimation1.Start;
roda;  // faz o sistema rodar o numero de registro ..
agua_DM.RESTClient4.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_falecomigo/cod_falecomigo/'+z1+'.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
agua_DM.RESTRequest4.Method := TRESTRequestMethod.rmPATCH;
agua_DM.RESTRequest4.Params.Clear;                                                       // limpa o RESTRequest1
agua_DM.RESTRequest4.Params.AddItem;                                                     // adiciona item
agua_DM.RESTRequest4.Params.Items[0].name  := 'param';                                   // item = param
cc:= '{"assuntoa":"'+edit1.Text+'","assuntob":"'+edit2.Text+'","assuntoc":"'+edit3.Text+'","datax":"'+edit4.Text+'","aptx":"9999","statusx":"s","id":"'+z1+'","nome":"'+label6.Text+'"}';                     // cc é uma string composta de um Json feito na mao
agua_DM.RESTRequest4.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
agua_DM.RESTRequest4.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
agua_DM.RESTRequest4.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
agua_DM.RESTRequest4.Execute;
//03 comunicado : aptx comunicado contexto datx orador statusx
showmessage('menssagem enviada');
    edit2.Text := '';  // comunicado
    edit3.Text := ''; // contexto
    edit1.Text := ''; // operador
    volta;
FloatAnimation1.Inverse:=true;
end;




//////////////////////////
///     R O D A
///////////////////////////
procedure Tagua_rec.roda;
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


procedure Tagua_rec.volta;
begin
    if Not Assigned(agua_menu) then
           Application.CreateForm(Tagua_menu, agua_menu);
           Application.MainForm := agua_menu;
           agua_menu.Show;
           agua_rec.Close;
end;



end.

