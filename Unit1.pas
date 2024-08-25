//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    JSONStr : String;
    procedure CreateJsonArray;
    procedure AccessJsonArrayElements(const JSONString : String);
    procedure AddNewElementToJsonArray(const JSONString : String);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CreateJsonArray;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  AccessJsonArrayElements(JSONStr);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  AddNewElementToJsonArray(JSONStr);
end;

procedure TForm1.CreateJsonArray;
var
  JsonArray: TJSONArray;
  JsonObject: TJSONObject;
begin
  JsonArray := TJSONArray.Create;
  try
    // Criando o primeiro objeto
    JsonObject := TJSONObject.Create;
    JsonObject.AddPair('Name', 'John Doe');
    JsonObject.AddPair('Age', TJSONNumber.Create(30));
    JsonArray.AddElement(JsonObject);

    // Criando o segundo objeto
    JsonObject := TJSONObject.Create;
    JsonObject.AddPair('Name', 'Jane Doe');
    JsonObject.AddPair('Age', TJSONNumber.Create(25));
    JsonArray.AddElement(JsonObject);

    // Convertendo o array para string JSON e armazenando na variável JSONStr
    JSONStr := JsonArray.ToString;  // [{"Name":"John Doe","Age":30},{"Name":"Jane Doe","Age":25}]

    ShowMessage('Array JSON criado com sucesso!');
  finally
    JsonArray.Free;
  end;
end;

procedure TForm1.AccessJsonArrayElements(const JSONString : String);
var
  JsonArray: TJSONArray;
  JsonObject: TJSONObject;
  Name: string;
  Age: Integer;
  index: Integer;

begin
  JsonArray := TJSONObject.ParseJSONValue(JSONString) as TJSONArray;
  try
    Memo1.Lines.Clear; //Limpando o Memo1

    // Laço de repetição para iterar sobre os objetos no array JSON
    for index := 0 to JSONArray.Count - 1 do
    begin

      // Acessando os objetos
      JsonObject := JsonArray.Items[index] as TJSONObject;
      Name := JsonObject.GetValue<string>('Name');
      Age := JsonObject.GetValue<Integer>('Age');

      Memo1.Lines.Add('Name: '+ Name + ', Age: ' + IntToStr(Age));  //Adicionando os objetos no Memo1
    end;

  finally
    JsonArray.Free;
  end;
end;

procedure TForm1.AddNewElementToJsonArray(const JSONString : String);
var
  JsonArray: TJSONArray;
  JsonObject: TJSONObject;
begin
  JsonArray := TJSONObject.ParseJSONValue(JSONString) as TJSONArray;
  try
    // Criando e adicionando um novo objeto
    JsonObject := TJSONObject.Create;
    JsonObject.AddPair('Name', 'Madonna');
    JsonObject.AddPair('Age', TJSONNumber.Create(60));
    JsonArray.AddElement(JsonObject);

    JSONStr := JsonArray.ToString;  // [{"Name":"John Doe","Age":30},{"Name":"Jane Doe","Age":25},{"Name":"Madonna","Age":60}]

    ShowMessage('Elemento Array JSON adicionado com sucesso!');
  finally
    JsonArray.Free;
  end;
end;

end.
