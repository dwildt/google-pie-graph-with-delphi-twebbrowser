program GoogleChart;

uses
  Forms,
  UFormGoogleChart in 'src\UFormGoogleChart.pas' {FormGoogleChart};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGoogleChart, FormGoogleChart);
  Application.Run;
end.
