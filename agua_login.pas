unit agua_login;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.StdCtrls,
  FMX.Ani, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, REST.Client, REST.Authenticator.Basic, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  Data.Bind.Components, Data.Bind.ObjectScope,
  System.Json.Types,   System.Json.Readers,   System.Json.Writers,
  System.Json, FMX.ScrollBox, FMX.Memo, FMX.TabControl, System.Actions,
  FMX.ActnList, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.VirtualKeyboard,FMX.Platform;

type
  Tagua1_login = class(TForm)
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabConta1: TTabItem;
    TabConta2: TTabItem;
    Layout1: TLayout;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Layout2: TLayout;
    Label3: TLabel;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Layout3: TLayout;
    Label6: TLabel;
    Button3: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Layout4: TLayout;
    StyleBook: TStyleBook;
    Rectangle2: TRectangle;
    Edit11: TEdit;
    Rectangle3: TRectangle;
    Edit2: TEdit;
    Rectangle4: TRectangle;
    Edit3: TEdit;
    Rectangle5: TRectangle;
    Edit4: TEdit;
    Rectangle6: TRectangle;
    Edit5: TEdit;
    Rectangle7: TRectangle;
    Edit6: TEdit;
    Rectangle8: TRectangle;
    Edit7: TEdit;
    Rectangle9: TRectangle;
    Edit8: TEdit;
    Rectangle10: TRectangle;
    Edit9: TEdit;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    Rectangle11: TRectangle;
    senha_repete: TEdit;
    Image4: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    Rectangle12: TRectangle;
    Image1: TImage;
    procedure Button3Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
  private
    procedure roda;
    procedure pula_tela;
    { Private declarations }
  public
    { Public declarations }
// VARIÁVEIS GLOBAIS // ____________________________________________
    w:integer;
    controle:integer;
    senha:string;
    email:string;
    transp_nome   : string; // nome
    transp_senha  : string; // SENHA
    transp_aptx   : string; // APT
    transp_nivel  : string; // NIVEL

  end;

var

 agua1_login: Tagua1_login;

implementation

{$R *.fmx}

uses agua1_menu, agua1_DM, agua_localizacao;



procedure Tagua1_login.Button1Click(Sender: TObject);
var
  email : string ;  // email
  X : string ;  // email
  Y : string ;  // senha
  t : string ;  // aptx
  z : integer;  // so para contar nuero de registro
  p : string ;  // statusx
  converte  : string ; // servirá para tirar espaços da senha
  converte2 : string ;// servirá para tirar espaços da onfirmacao da senha
  I : integer;

  begin
   FloatAnimation1.Start;
   FloatAnimation3.Start;
   z:=0;
   w:=1;
       agua_DM.RESTRequest2.Execute;                                                // executa a URL pelo REST
       //       email := Trim(edit1.Text) ;                                              // o que foi digitado
       senha := Trim(edit11.Text) ;                                              // o que foi digitado
       while not agua_DM.FDMemTable2.Eof do                                        // faça enquanto nao for o fim do arquivo
        begin
            x:=agua_DM.FDMemTable2email.Value;                                      // receba a cada passagem o novo valor par x ( email )
            y:=agua_DM.FDMemTable2senha.Value;                                      // receba a cada passagem o novo valor para y ( senha )
            t:=agua_DM.FDMemTable2aptx.Value;
            p:=agua_DM.FDMemTable2statusx.Value;
            z:=z+1;                                                             // acrescente um contador

               if y = '' then y:='erro';
               if  (y=senha) and (p='s') then                                   // se meu y for igual a senha  faça
               begin
                  w:=0;                                                         // ao passar aqui o w fica zero e o controle infica que a senha foi validada
                  transp_senha:= senha;
                  transp_nome := agua_DM.FDMemTable2nomex.Value;
                  transp_aptx := agua_DM.FDMemTable2aptx.Value;
                  transp_nivel:= agua_DM.FDMemTable2nivel.Value;
                  pula_tela;
               end;
                                                                                //    showmessage('valor de x=> '+ x + ' y=> ' + y + ' email=> ' + email + ' senha=> '+senha );
              agua_DM.FDMemTable2.Next;
        end;

    if p <> 's' then  showmessage('sem autorização');
    if w <> 0   then  showmessage('senha incorreta');

end;


procedure Tagua1_login.Button2Click(Sender: TObject);
var
I        :integer;
t,x      :integer;
converte :string ;

 begin
 t:=0;
 x:=1;
//=============================================================================
//  TESTA A SENHA SE SAO IDENTICAS E VERIFICA NOME E SOBRE NOME              //
//=============================================================================
   if (edit3.Text <> senha_repete.Text) or ( edit3.Text = '') then
      begin
       showmessage('senhas não conferem');                                      // testa se a senha esta em branco // testa se a senhas sao diferentes
       t:=1;
      end;

      converte:= Edit2.Text;
      for I := 1 to Length(converte)   do
      begin
          if converte[I] = ' ' then
             begin
               x:=0;                                                             // no campo digitado tem espço em branco ( CORRETO )
             end;
      end;

    if x=1  then                                                                 // se x e igual é = 1 , significa que o nome nao tem sobrenome
        begin
          showmessage('Informar nome e sobrenome');
        end;

   if (t = 1) or (x = 1 ) then
   begin
       t:=0;
       ChangeTabAction2.Execute;
   end else begin
       ChangeTabAction3.Execute;

   end;

 end;


procedure Tagua1_login.Button3Click(Sender: TObject); // PRIMEIRO CADASTRO
var
controleS: string;   //finalidade é controlar em que registro estou
cc       : string;  // email
converte : string;  // finalidade do converte é entregar o a senha sem registros brancos ( COMANDO TRIM )
converte2 : string; // entrega o registro senha_repete sem brancos no inicio e fim  ( COMANDO TRIM )
       x : integer;
       I : integer;

 begin

    email := edit4.Text ;                    // o que foi digitado
    senha := edit3.Text ;                   // o que foi digitado
    converte:=Trim(edit3.Text);            // recebe a senha digitada e manda para a variavel converte
    converte2:=Trim(senha_repete.Text);
    roda;
    x:=1;
    controleS:=IntToStr(Controle);

    if w <> 0 then    // o ( w diferente 0 ) significa que o registro nao existe , vai ser gravado pela 1 vez
    begin

       if converte = converte2 then  // e a confirmacao que as senhas foram  digitadas corretas
       begin

                  Edit3.Text :=converte2; // joga a senha sem espaços dentro do edit3
                  if w <> 0 then
                   begin
                    agua_DM.RESTClient2.BaseURL:='https://laurolivro-606860-default-rtdb.firebaseio.com/tab_usuario/cod_usuario/' +controleS+ '.json?auth=gGrjaEZca7Dld3kCnSd7oDeQ8Xi8xJkcuvqCkrBg';
                    agua_DM.RESTRequest2.Method := TRESTRequestMethod.rmPATCH;
                    agua_DM.RESTRequest2.Params.Clear;                                                       // limpa o RESTRequest1
                    agua_DM.RESTRequest2.Params.AddItem;                                                     // adiciona item
                    agua_DM.RESTRequest2.Params.Items[0].name  := 'param'; // item = param
                    //01 usuario :    aptx statusx email nivel nomex senha sequencia  unidade
                    cc:= '{"aptx":"8888","email":"'+Edit4.text+'","nivel":"cliente","nomex":"'+Edit2.Text+'","senha":"'+Edit3.Text+'","campo1":"'+Edit5.Text+'","campo2":"'+Edit9.Text+'","campo3":"'+Edit8.Text+'","campo4":"'+Edit6.Text+'","id":"'+controleS+'","statusx":"s"}';   // cc é uma string composta de um Json feito na mao
                    agua_DM.RESTRequest2.Params.Items[0].value :=cc;                                         // colocado dentro do RESTRequest1 o conteudo de cc
                    agua_DM.RESTRequest2.Params.Items[0].ContentType := ctAPPLICATION_JSON;                  // ct application
                    agua_DM.RESTRequest2.Params.Items[0].Kind := TRESTRequestParameterKind.pkGETorPOST;      // recebe um pk GET ou POST ( se não existir atualize )
                    agua_DM.RESTRequest2.Execute;                                                            // execute
                    showmessage('senha cadastrada com sucesso');
                    end;
//                  Edit1.Text :='' ;
                  Edit2.Text :='' ;                                             //converte2;   // campo que foi digitado a senha
                  Edit3.Text :='' ;
                  Edit4.Text :='' ;                                             //converte2;  // campo que foi digitado a senha
                  Edit5.Text :='' ;                                             //converte2;  // campo que foi digitado a senha
                  Edit6.Text :='' ;                                             //converte2;  // campo que foi digitado a senha
                  Edit7.Text :='' ;
                  Edit8.Text :='' ;
                  Edit9.Text :='' ;
                  Edit11.Text :='' ;
                  senha_repete.Text:='' ;

                  ChangeTabAction1.Execute;
        end
    end;
 end;



procedure Tagua1_login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       Action     := TCloseAction.caFree;
       agua1_login := nil;
end;

procedure Tagua1_login.Image1Click(Sender: TObject);
begin

  if   not Assigned(agua_localiz) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_localiz, agua_localiz);                  // cria o formulario
   Application.MainForm := agua_localiz;                                 // informa que o programa MENU se tornou o principal
   agua_localiz.Show;

end;

procedure Tagua1_login.Image4Click(Sender: TObject);
begin
    ChangeTabAction2.Execute;
end;

procedure Tagua1_login.Label2Click(Sender: TObject);
begin
    ChangeTabAction2.Execute;
end;

procedure Tagua1_login.Label4Click(Sender: TObject);
begin
    ChangeTabAction1.Execute;
end;

procedure Tagua1_login.Label8Click(Sender: TObject);
begin
    ChangeTabAction1.Execute;
end;



//--------------------------------------
// R O D A ________________________RODA
//--------------------------------------
procedure Tagua1_login.roda;
var
  x        : string ;                                                            // email       // recebe valor da tabela do email
  Y        : string ;                                                            // senha       // receb  valor da tabela da senh
  z        : integer;                                                            // sequencia  // so para contar nuero de registro

  begin
    w:= 1;
    controle:=0;                                                                 // CONTROLE
    agua_DM.RESTRequest2.Execute;                                                    // executa a URL

     while not agua_DM.FDMemTable2.Eof do                                            // faça enquanto nao for o fim do arquivo
     begin                                                                       // faça
         x:=agua_DM.FDMemTable2email.Value;                                          // receba a cada passagem o novo valor par x ( email )
         y:=agua_DM.FDMemTable2senha.Value;                                          // receba a cada passagem o novo valor para y ( senha )
         if y='' then y:='erro';                                                 // vai colocar no registro em branco uma espressao de erro / evitando passar com senha valida

           if (y=senha) and (x=email) then                                       // se meu y for igual a senha  faça
            begin
               showMessage( 'email e senha já existem ');
               w:=0;                                                             // o ( W = 0  ) impede que o registro seja salvo em duplicitade
               ChangeTabAction1.Execute;
            end;

         agua_DM.FDMemTable2.Next;
         controle:=controle+1;                                                  // vai contar quantos registros tem , e serve para enumerar o próximo
     end;

   end;



procedure Tagua1_login.pula_tela;                                                   //____________________________REPETE EXIT
begin
          ///////////////// VOU PARA OUTRA TELA ////////////////////////
    if   not Assigned(agua_menu) then                        // pergunta se o programa ja existe, se nao cria
         Application.CreateForm(Tagua_menu, agua_menu); // cria o formulario
         Application.MainForm := agua_menu      ;      // informa que o programa MENU se tornou o principal
         agua_menu.Show;                              // abre o novo formulario MENU
       //  agua1_login.Close;
 end;




end.
