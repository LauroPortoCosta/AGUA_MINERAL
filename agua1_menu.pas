unit agua1_menu;

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
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.VirtualKeyboard,FMX.Platform,
  FMX.ListBox;

type
  Tagua_menu = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Lay_cabecalho: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Label6: TLabel;
    Image10: TImage;
    Animation_menu_branco: TFloatAnimation;
    Layout_lateral: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout4: TLayout;
    Image6: TImage;
    Reservas: TLabel;
    Tabela: TLabel;
    Label11: TLabel;
    Animation_esconde_lateral: TFloatAnimation;
    Animation_lateral: TFloatAnimation;
    Image7: TImage;
    Label9: TLabel;
    Lay_centro: TLayout;
    Lay_rodape: TLayout;
    Label4: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Image22: TImage;
    Rectangle4: TRectangle;
    Image1: TImage;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    ListBoxItem5: TListBoxItem;
    GradientAnimation1: TGradientAnimation;
    GradientAnimation2: TGradientAnimation;
    Layout1: TLayout;
    Image13: TImage;
    RoundRect1: TRoundRect;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    FloatAnimation1: TFloatAnimation;
    Label23: TLabel;
    Label24: TLabel;
    Label13: TLabel;
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Abre;
    procedure Fecha;
    procedure FormCreate(Sender: TObject);
    procedure recadosClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle11Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure TabelaClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
  private
    procedure alarme;
    { Private declarations }
  public
    { Public declarations }
  var
  qual_arquivo:string;

  end;

var
  agua_menu: Tagua_menu;

implementation

{$R *.fmx}

uses agua1_DM, agua_login, agua_tabela, agua1_logo, agua_Reltab, agua_recad,
  agua1_livre, agua_clien, agua_IncCli, agua_RelReca, agua_vendas, agua_Relserv;



procedure Tagua_menu.Image10Click(Sender: TObject);
begin

     if  agua1_login.transp_nivel='agua' then                // senha de sindico
     begin
       if Image10.Tag=0 then
       abre     // fecha a cortina do menu lateral
       else
       fecha;  // abre a cortina do menu lateral
     end;
end;

procedure Tagua_menu.Image13Click(Sender: TObject);
begin
RoundRect1.Visible:=true;
end;


procedure Tagua_menu.Image1Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_menu.Image22Click(Sender: TObject);
begin

//     if   not Assigned(manicure_vazio) then                                      // pergunta se o programa ja existe, se nao cria
//          Application.CreateForm(Tmanicure_vazio, manicure_vazio);               // cria o formulario
//          Application.MainForm := manicure_vazio;                                // informa que o programa MENU se tornou o principal
//          manicure_vazio.Show;                                                   // abre o novo formulario MENU
//          manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.Image7Click(Sender: TObject);
begin
close;
end;

procedure Tagua_menu.Label10Click(Sender: TObject);
begin // ALTERA CIENTE

   if   not Assigned(agua_Inc_cli) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_Inc_cli, agua_Inc_cli);                  // cria o formulario
   Application.MainForm := agua_Inc_cli;                                 // informa que o programa MENU se tornou o principal
   agua_Inc_cli.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU


end;

procedure Tagua_menu.Label12Click(Sender: TObject);
begin // RECADOS
    if Not Assigned(agua_RelRec) then
           Application.CreateForm(Tagua_RelRec, agua_RelRec);
           Application.MainForm := agua_RelRec;
           agua_RelRec.Show;
     //      manicure_RelRec.Close;

end;

procedure Tagua_menu.Label2Click(Sender: TObject);
begin //agua_venda
   if   not Assigned(agua_venda) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_venda, agua_venda);                  // cria o formulario
   Application.MainForm := agua_venda;                                 // informa que o programa MENU se tornou o principal
   agua_venda.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.Label3Click(Sender: TObject);
begin
   if   not Assigned(agua_RelTa) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_RelTa, agua_RelTa);                  // cria o formulario
   Application.MainForm := agua_RelTa;                                 // informa que o programa MENU se tornou o principal
   agua_RelTa.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.Label5Click(Sender: TObject);
begin
//agua_rec

   if   not Assigned(agua_rec) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_rec, agua_rec);                  // cria o formulario
   Application.MainForm := agua_rec;                                 // informa que o programa MENU se tornou o principal
   agua_rec.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.Label8Click(Sender: TObject);
begin

   if   not Assigned(agua_tabel) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_tabel, agua_tabel);                  // cria o formulario
   Application.MainForm := agua_tabel;                                 // informa que o programa MENU se tornou o principal
   agua_tabel.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.recadosClick(Sender: TObject);
begin
close;
end;

procedure Tagua_menu.Rectangle11Click(Sender: TObject);
begin
//   if senha.transportec='manicure' then                // senha de sindico
//   begin
//   if   not Assigned(manicure_Rel) then                                       // pergunta se o programa ja existe, se nao cria
//   Application.CreateForm(Tmanicure_Rel, manicure_Rel);                  // cria o formulario
//   Application.MainForm := manicure_Rel;                                 // informa que o programa MENU se tornou o principal
//   manicure_Rel.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU
//   end

end;


procedure Tagua_menu.Rectangle2Click(Sender: TObject);
begin
fecha;
end;

procedure Tagua_menu.Rectangle3Click(Sender: TObject);
begin
fecha;
end;


procedure Tagua_menu.Rectangle8Click(Sender: TObject);
begin


     if  agua1_login.transp_nivel='agua' then                // senha de sindico
     begin
       if Image10.Tag=0 then
           begin
             if   not Assigned(agua_Rel) then                                       // pergunta se o programa ja existe, se nao cria
             Application.CreateForm(Tagua_Rel, agua_Rel);                  // cria o formulario
             Application.MainForm := agua_Rel;                                 // informa que o programa MENU se tornou o principal
             agua_Rel.Show;
           end;
     end;

// MENU ADM
//   if   not Assigned(agua_Rel) then                                       // pergunta se o programa ja existe, se nao cria
//   Application.CreateForm(Tagua_Rel, agua_Rel);                  // cria o formulario
//   Application.MainForm := agua_Rel;                                 // informa que o programa MENU se tornou o principal
//   agua_Rel.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU


end;

procedure Tagua_menu.Rectangle9Click(Sender: TObject);  // ADM
begin
RoundRect1.Visible:=false;
end;

procedure Tagua_menu.RoundRect1Click(Sender: TObject);
begin
RoundRect1.Visible:=false;
end;

procedure Tagua_menu.TabelaClick(Sender: TObject);
begin   // CLIENTE
   if   not Assigned(agua_cliente) then                                       // pergunta se o programa ja existe, se nao cria
   Application.CreateForm(Tagua_cliente, agua_cliente);                  // cria o formulario
   Application.MainForm := agua_cliente;                                 // informa que o programa MENU se tornou o principal
   agua_cliente.Show;
//   manicure1.Close;                                                      // abre o novo formulario MENU

end;

procedure Tagua_menu.Abre;  // A B R E   cortina
begin
    Lay_cabecalho.Visible:=false;
    Lay_rodape.Visible:=false;
    Layout_lateral.Visible:=true;                                                   // dentro do Object Inspector tenho minha Tag, que armazeno o numero 1 para fechado e 0 para aberto
    Animation_menu_branco.Inverse:=False;                                        // O Inverse nasce False , isso significa que  ele vai de 0 a 90 graus
    Animation_menu_branco.Start;                                                 // o start vai fazer o botao girar de 0 a 90 graus com Duration 0,5 conforme Object Inspector
    Image10.Tag:=1;
    Animation_lateral.Inverse:=false;
    Animation_lateral.Start;
end;


procedure Tagua_menu.Fecha;   // F E C H A  cortina
begin
    Lay_cabecalho.Visible:=true;
    Lay_rodape.Visible:=true;
    Animation_menu_branco.Inverse:=true;                                         // AQUI INVERTE A ESCALA =>  isso significa que  ele vai de 90 a 0 graus
    Animation_menu_branco.Start;
    Image10.Tag:=0;
    Animation_lateral.Inverse:=true;
    Animation_lateral.Start;
    Animation_esconde_lateral.Start;
    Layout_lateral.Visible:=false;                                                  // dentro do Object Inspector tenho minha Tag, que armazeno o numero 1 para fechado e 0 para aberto
//    chama_menu.Execute;                                                          // CHAMA MENU  o action list facilitou este comando //
end;


procedure Tagua_menu.FormCreate(Sender: TObject);
begin

       if agua1_login.transp_nivel='agua' then                // senha de sindico
       begin
        Image10.Visible:=true;
       end;


   Label6.Text:= agua1_login.transp_nome;
   alarme;
   end;



procedure Tagua_menu.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin



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
              end
               else
               begin
            if  not Assigned(agua_menu) then
            begin
                Key := 0;
                 close;
            end
            else if  not Assigned(agua_menu) then   // executo no relatorio e vou para o menu
            begin
                Key := 0;
                  close;
            end
            else if  not Assigned(agua_menu) then
                 key :=0;
                  close;
         end;
      end;
{$ENDIF}
end;
end;


procedure Tagua_menu.alarme;
var
xy:string;
b:integer;

  begin
        b:=0;
        xy:=DateToStr(date);
        agua_DM.RESTRequest3.Execute;

        while Not agua_DM.FDMemTable3.Eof  do
         begin

               if agua_DM.FDMemTable3statusx.value <> 'n'  then
                begin
                   //  showmessage('valor de senha '+agua1_login.transp_nome+ 'valor de tabela nome '+agua_DM.FDMemTable3nomex.Value );

                    if   agua_DM.FDMemTable3nomex.Value = agua1_login.transp_nome then
                     begin
                      Label16.Text := agua_DM.FDMemTable3.FieldByName('datax').AsString;
                      Label17.Text := agua_DM.FDMemTable3.FieldByName('descri').AsString;
                      Label18.Text := agua_DM.FDMemTable3.FieldByName('marca').AsString;
                      Label19.Text := agua_DM.FDMemTable3.FieldByName('qt').AsString;
                      // Label16.Text := manicure_DM.FDMemTable3.FieldByName('dados3').AsString;
                      b:=1;
                     end;

                end;

          agua_DM.FDMemTable3.Next;
          end;

          if b = 1 then
          begin
           Image13.Visible:=true;
           FloatAnimation1.Start;
          end;

  end;

end.





