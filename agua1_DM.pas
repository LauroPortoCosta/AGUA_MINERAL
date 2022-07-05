unit agua1_DM;

// 5 tabela de preço
// 4 fale comigo
// 3 agua
//

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FireDAC.Stan.StorageBin;

type
  Tagua_DM = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    RESTResponseDataSetAdapter3: TRESTResponseDataSetAdapter;
    FDMemTable3: TFDMemTable;
    RESTClient4: TRESTClient;
    RESTRequest4: TRESTRequest;
    RESTResponse4: TRESTResponse;
    RESTResponseDataSetAdapter4: TRESTResponseDataSetAdapter;
    FDMemTable4: TFDMemTable;
    RESTClient5: TRESTClient;
    RESTRequest5: TRESTRequest;
    RESTResponse5: TRESTResponse;
    RESTResponseDataSetAdapter5: TRESTResponseDataSetAdapter;
    FDMemTable5: TFDMemTable;
    FDMemTable5dados1: TWideStringField;
    FDMemTable5dados2: TWideStringField;
    FDMemTable5dados3: TWideStringField;
    FDMemTable5dados4: TWideStringField;
    FDMemTable5id: TWideStringField;
    FDMemTable5statusx: TWideStringField;
    FDMemTable5unidade: TWideStringField;
    FDMemTable4aptx: TWideStringField;
    FDMemTable4assuntoa: TWideStringField;
    FDMemTable4assuntob: TWideStringField;
    FDMemTable4assuntoc: TWideStringField;
    FDMemTable4datax: TWideStringField;
    FDMemTable4id: TWideStringField;
    FDMemTable4nome: TWideStringField;
    FDMemTable4statusx: TWideStringField;
    FDMemTable1controle: TWideStringField;
    FDMemTable1data_geral: TWideStringField;
    FDMemTable1id: TWideStringField;
    FDMemTable1mensagem1: TWideStringField;
    FDMemTable1mensagem10: TWideStringField;
    FDMemTable1mensagem2: TWideStringField;
    FDMemTable1mensagem3: TWideStringField;
    FDMemTable1mensagem4: TWideStringField;
    FDMemTable1mensagem5: TWideStringField;
    FDMemTable1mensagem6: TWideStringField;
    FDMemTable1mensagem7: TWideStringField;
    FDMemTable1mensagem8: TWideStringField;
    FDMemTable1mensagem9: TWideStringField;
    FDMemTable1statusx: TWideStringField;
    FDMemTable1unidade: TWideStringField;
    FDMemTable3datax: TWideStringField;
    FDMemTable3descri: TWideStringField;
    FDMemTable3id: TWideStringField;
    FDMemTable3marca: TWideStringField;
    FDMemTable3nomex: TWideStringField;
    FDMemTable3qt: TWideStringField;
    FDMemTable3statusx: TWideStringField;
    FDMemTable3valor: TWideStringField;
    FDMemTable2aptx: TWideStringField;
    FDMemTable2campo1: TWideStringField;
    FDMemTable2campo2: TWideStringField;
    FDMemTable2campo3: TWideStringField;
    FDMemTable2campo4: TWideStringField;
    FDMemTable2email: TWideStringField;
    FDMemTable2id: TWideStringField;
    FDMemTable2nivel: TWideStringField;
    FDMemTable2nomex: TWideStringField;
    FDMemTable2senha: TWideStringField;
    FDMemTable2sequencia: TWideStringField;
    FDMemTable2statusx: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  agua_DM: Tagua_DM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tagua_DM.DataModuleCreate(Sender: TObject);
begin
////////////////////////////// apagar
end;

end.
