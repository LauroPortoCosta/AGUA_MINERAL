unit Agua_nulo;

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
  TForm2 = class(TForm)
  private
    procedure carrega;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses agua1_DM;



procedure TForm2.carrega;
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





end.

