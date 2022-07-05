unit agua_localizacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  Tagua_localiz = class(TForm)
    Lay_geral: TLayout;
    Lay_cabecalho: TLayout;
    Lay_A: TLayout;
    Lay_B: TLayout;
    Image1: TImage;
    Rectangle1: TRectangle;
    Image2: TImage;
    Rectangle2: TRectangle;
    Label6: TLabel;
    Image7: TImage;
    Label1: TLabel;
    Image3: TImage;
    FloatAnimation1: TFloatAnimation;
    Layout_cabecalho: TLayout;
    Image4: TImage;
    procedure Image14Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure volta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  agua_localiz: Tagua_localiz;

implementation

{$R *.fmx}

uses OpenViewUrl ;




procedure Tagua_localiz.Image14Click(Sender: TObject);
begin
volta;
end;

procedure Tagua_localiz.Image1Click(Sender: TObject);
//var
//link_1      :string;  // telefone ..... waht app
//link_2      :string;
//resultado  : string;

begin
OpenURL('https://goo.gl/maps/6dB4NiYuYJvUBdiAA');
//https://www.google.com.br/maps/place/R.+Dez,+570+-+Ilha+dos+Ara%C3%BAjos,+Gov.+Valadares+-+MG,+35020-650/@-18.8706791,-41.947623,17z/data=!3m1!4b1!4m5!3m4!1s0xb1a7bb9fa977a7:0x8147f96f3c2a7e61!8m2!3d-18.8706791!4d-41.9454343

//link_1    :=  'https://app.whatsgw.com.br/api/WhatsGw/Send?apikey=6869806d-e41a-433d-bd23-d9b3cc888f4a&phone_number=553399906951&contact_phone_number=553384047669';
//link_2    :=  '&message_custom_id=mysoftwareid&message_type=text&message_to_group=0&message_body=MenssagemLauro%20NoSeuWhatAAP!!%20Italico%20*negrito*%20~tachado~%20```Monoespa%C3%A7ado```%F0%9F%98%9C' ;
//resultado :=  link_1+ link_2 ;
//OpenURL(resultado);


//OpenURL('https://api.whatsapp.com/Send?phone=553384047669&text=TESTANDO 123');



end;

procedure Tagua_localiz.Image7Click(Sender: TObject);
begin
close;  //volta;
end;

procedure Tagua_localiz.volta;
begin
//   if Not Assigned(manicure1) then
//      Application.CreateForm(Tmanicure1, manicure1);
//      Application.MainForm := manicure1;
//      manicure1.Show;
//      manicure_localiz.Close;
end;





end.
