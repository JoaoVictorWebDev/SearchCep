unit ViaCepController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    ConsultarCep: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Cep: TMemo;
    Image1: TImage;
    RESTClient2: TRESTClient;
    RESTResponse2: TRESTResponse;
    RESTRequest2: TRESTRequest;
    RESTRequest3: TRESTRequest;
    RESTClient3: TRESTClient;
    RESTResponse3: TRESTResponse;
    procedure ConsultarCepClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  CepTexto:String;

implementation

{$R *.dfm}

procedure TForm1.ConsultarCepClick(Sender: TObject);
begin

 // Tenta acessar o serviço ViaCEP
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + Edit1.Text + '/json/';
  RESTRequest1.Execute;
  Cep.Lines.Add(RestRequest1.Response.JSONText);

  begin
    RESTClient2.BaseURL := 'https://apicep.com/api/';
    RESTRequest2.Resource := Edit1.Text + '/json/';
    RESTRequest2.Execute;
    Cep.Lines.Add(RestRequest2.Response.JSONText);

    if RESTResponse2.StatusCode <> 200 then
    begin
      RESTClient3.BaseURL := 'https://docs.awesomeapi.com.br/api-cep/';
      RESTRequest3.Resource := Edit1.Text;
      RESTRequest3.Execute;
      Cep.Lines.Add(RestRequest3.Response.JSONText);
    end;
    if RESTResponse1.StatusCode = 200 then
    Cep.Lines.Add(RESTResponse1.JSONText)
  else if RESTResponse2.StatusCode = 200 then
    Cep.Lines.Add(RESTResponse2.JSONText)
  else if RESTResponse3.StatusCode = 200 then
    Cep.Lines.Add(RESTResponse3.JSONText)
  else
    ShowMessage('Todos os serviços estão offline.');
  end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  RestRequest1.Execute;
  RestRequest2.Execute;
  RestRequest3.Execute;

end;

end.


