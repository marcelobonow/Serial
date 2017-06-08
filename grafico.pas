unit grafico;

{$mode objfpc}{$H+}

interface

uses
	  Classes, SysUtils, FileUtil, TASources, TAStyles, TAGraph, TASeries, Forms,
	  Controls, Graphics, Dialogs, StdCtrls;

type

	  { TForm2 }

   TForm2 = class(TForm)
			Chart1: TChart;
			Chart1LineSeries1: TLineSeries;
			Chart1LineSeries2: TLineSeries;
			Chart1LineSeries3: TLineSeries;
			Chart1LineSeries4: TLineSeries;
			LblHis: TLabel;
			LblEq4: TLabel;
			LblEq1: TLabel;
			LblEq2: TLabel;
			LblEq3: TLabel;
			LblHis2: TLabel;
			procedure FormCreate(Sender: TObject);
	  private
			{ private declarations }
	  public
			{ public declarations }
	  end;

var
	  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
end;

end.

