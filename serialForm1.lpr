program serialForm1;

{$mode objfpc}{$H+}

uses
	  {$IFDEF UNIX}{$IFDEF UseCThreads}
	  cthreads,
	  {$ENDIF}{$ENDIF}
	  Interfaces, // this includes the LCL widgetset
	  Forms, tachartlazaruspkg, serial1, grafico;

{$R *.res}

begin
	  RequireDerivedFormResource:=True;
	  Application.Initialize;
	  Application.CreateForm(TForm1, Form1);
	  Application.CreateForm(TForm2, Form2);
	  Application.Run;
end.

