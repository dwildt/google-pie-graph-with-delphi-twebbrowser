program GoogleGraph;

uses
  Forms,
  UFormGoogleGraph in 'src\UFormGoogleGraph.pas' {FormGoogleGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGoogleGraph, FormGoogleGraph);
  Application.Run;
end.
