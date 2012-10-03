unit UFormGoogleGraph;

(*

Exemplo de uso do TWebBrowser e componentes DataAware para interagir com
o Google Chart API.

Gráfico de exempo: Pie Chart
https://google-developers.appspot.com/chart/interactive/docs/gallery/piechart

Organizado por:
Daniel Wildt
http://danielwildt.com
http://twitter.com/dwildt

Sobre o funcionamento do código:
Simplesmente preencha Tipos e valores no grid.
Ao salvar o ClientDataSet vai disparar um evento para gerar o gráfico.
Ao gravar e ao deletar linhas o evento é disparado.


*)


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, OleCtrls, SHDocVw, HTTPApp, HTTPProd, DB,
  StdCtrls, Grids, DBGrids, DBClient;

type
  TFormGoogleChart = class(TForm)
    dsTipos: TDataSource;
    cdsTipos: TClientDataSet;
    DBGrid: TDBGrid;
    lblFill: TLabel;
    cdsTiposTipo: TStringField;
    cdsTiposValor: TIntegerField;
    pgProdGooglePie: TPageProducer;
    WebBrowser: TWebBrowser;
    DBNavigator: TDBNavigator;
    procedure cdsTiposAfterDelete(DataSet: TDataSet);
    procedure cdsTiposAfterPost(DataSet: TDataSet);
    procedure pgProdGooglePieHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    procedure GerarGrafico; 
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGoogleChart: TFormGoogleChart;

implementation

{$R *.dfm}

uses ActiveX;

procedure TFormGoogleChart.cdsTiposAfterDelete(DataSet: TDataSet);
begin
  GerarGrafico;
end;

procedure TFormGoogleChart.cdsTiposAfterPost(DataSet: TDataSet);
begin
  GerarGrafico;
end;

procedure TFormGoogleChart.GerarGrafico;
  var
   sl: TStringList;
   ms: TMemoryStream;
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

   if Assigned(WebBrowser.Document) then
   begin
     sl := TStringList.Create;
     try
       ms := TMemoryStream.Create;
       try
         sl.Text := pgProdGooglePie.Content;
         sl.SaveToStream(ms) ;
         ms.Seek(0, 0) ;
         (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
       finally
         ms.Free;
       end;
     finally
       sl.Free;
     end;
   end;
end;

procedure TFormGoogleChart.pgProdGooglePieHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  if TagString = 'DATA' then
  begin
    cdsTipos.First;
    ReplaceText := '';
    while (not cdsTipos.Eof) do
    begin
      ReplaceText :=  ReplaceText +
         '[' +
         QuotedStr(cdsTipos.FieldByName('Tipo').AsString) +
         ',' +
         cdsTipos.FieldByName('Valor').AsString +
         ']';
      cdsTipos.Next;
      if(not cdsTipos.Eof) then
        ReplaceText :=  ReplaceText + ',';
    end;
  end;
end;

end.
