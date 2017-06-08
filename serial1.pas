unit serial1;

{$mode objfpc}{$H+}

interface

uses
	  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
	  Dialogs, StdCtrls, Grids;

type

	  { TForm1 }

   TForm1 = class(TForm)
			BtnLoad: TButton;
			BtnSave: TButton;
			Button1: TButton;
			OpenDialog1: TOpenDialog;
			SaveDialog1: TSaveDialog;
			StringGrid1: TStringGrid;
			procedure BtnLoadClick(Sender: TObject);
   procedure BtnSaveClick(Sender: TObject);
   procedure Button1Click(Sender: TObject);
			procedure FormCreate(Sender: TObject);
			procedure StringGrid1ValidateEntry(sender: TObject; aCol,
				  aRow: Integer; const OldValue: string; var NewValue: String);
	  private
			{ private declarations }
	  public
			{ public declarations }
	  end;

var
	  Form1: TForm1;
      columSize:integer = 5;
      rowSize:integer = 5;
      a,b:double;

implementation
 uses grafico;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
      rowSize:=StringGrid1.RowCount;
      columSize:=StringGrid1.ColCount;
end;
procedure TForm1.BtnSaveClick(Sender: TObject);
begin
      if SaveDialog1.Execute then
        begin
			StringGrid1.SaveToCSVFile(SaveDialog1.FileName + '.csv', ';');
		end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var xySum,xsqrSum:Real;
      x,y:Double;
      i:integer;
      o:integer;
      xSum,ySum:double;
      arraysize:integer=0;
      chartArray:array [0..3] of TLineSeries;
      labelEquation:array[0..3] of TLabel;
      labelhysteresis:array[0..3] of TLabel;
      labelprecision:array[0..3] of TLabel;
      maxDiference1:real;
      maxDiference2:real;
      NextCollum:real;
      FSO:real;


begin
      Form2.Chart1LineSeries1.Clear;
      chartArray[0] := Form2.Chart1LineSeries1;
      chartArray[1] := Form2.Chart1LineSeries2;
      chartArray[2] := Form2.Chart1LineSeries3;
      chartArray[3] := Form2.Chart1LineSeries4;
      labelEquation[0] := Form2.LblEq1;
      labelEquation[1] := Form2.LblEq2;
      labelEquation[2] := Form2.LblEq3;
      labelEquation[3] := Form2.LblEq4;
      //escolher a cor das linhas
      if(TryStrToFloat(StringGrid1.Cells[1,rowSize-1],FSO)) then
      else
      	ShowMessage('Valores do eixo x não reconhecidos');
      for o:= 2 to 5 do
      begin
	        for I:=0 to rowSize-1 do
	        begin
	           if(TryStrToFloat(StringGrid1.Cells[1,i],x)) AND (TryStrToFloat(StringGrid1.Cells[o,i],y)) then
	             begin
	               arraysize:=arraysize+1;
	               xsqrSum := xsqrSum + x*x;
	               xySum:= xySum + x*y;
	               xsum:=xsum+x;
	               ysum:=ysum+y;
	               chartArray[o-2].AddXY(x,y,'',clRed);
                   if(o mod 2 = 0) then
                     begin
                      if(TryStrToFloat(StringGrid1.Cells[o+1,i],NextCollum)) then
                         begin
                           if(NextCollum - y > maxDiference1) and (o=2) then
                              begin
							 	maxDiference1:= NextCollum-y;
							  end;
						   if(NextCollum - y > maxDiference2) and (o=4) then
                              begin
							 	maxDiference2:= NextCollum-y;
							  end;
						 end;
					 end;

			  end;
		    end;
	        if(arraysize>1)then
	          begin
	      	  a:=(arraysize*xySum-(xsum*ySum))/((arraysize*xsqrSum-(xSum*xSum)));
	          b:=(ySum-a*xSum)/arraysize;
              Form2.LblHis.Caption := FloatToStr(maxDiference1/fso*100)+'%';
              Form2.LblHis2.Caption := FloatToStr(maxDiference2/fso*100)+'%';
              labelEquation[o-2].Caption:= 'Equação ' + IntToStr(o-1) + ': ' + 'a: ' + FormatFloat('0.###',a) + ' b: ' + FormatFloat('0.###',b);
	          Form2.Show;
			  end;
	  end;
end;

procedure TForm1.BtnLoadClick(Sender: TObject);
begin
      if OpenDialog1.Execute then
        begin
            StringGrid1.LoadFromCSVFile(OpenDialog1.FileName,';');
		end;

end;


procedure TForm1.StringGrid1ValidateEntry(sender: TObject; aCol, aRow: Integer;
	  const OldValue: string; var NewValue: String);
var tempFloat:Double;
begin
    if (TryStrToFloat(NewValue,tempFloat))then
      StringGrid1.Cells[aCol,aRow]:=NewValue
    else
    	StringGrid1.Cells[aCol,aRow]:= OldValue;
    if(aRow = StringGrid1.RowCount-1) then
      begin
        rowSize:= rowSize + 1;
      	StringGrid1.RowCount:=rowSize;
	  end;

	end;

end.

