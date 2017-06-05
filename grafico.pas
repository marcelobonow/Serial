unit grafico;

{$mode objfpc}{$H+}

interface

uses
	  Classes, SysUtils, FileUtil, TASources, TAStyles, TAGraph, Forms, Controls,
	  Graphics, Dialogs;

type

	  { TForm2 }

   TForm2 = class(TForm)
			Chart1: TChart;
	  private
			{ private declarations }
	  public
			{ public declarations }
	  end;

var
	  Form2: TForm2;

implementation

{$R *.lfm}

end.

