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
      xSum,ySum:double;
      arraysize:integer=0;
begin
      Form2.Chart1LineSeries1.Clear;
      for I:=0 to rowSize-1 do
      begin
         if(TryStrToFloat(StringGrid1.Cells[1,i],x)) AND (TryStrToFloat(StringGrid1.Cells[2,i],y)) then
           begin
             arraysize:=arraysize+1;
             xsqrSum := xsqrSum + x*x;
             xySum:= xySum + x*y;
             xsum:=xsum+x;
             ysum:=ysum+y;
             Form2.Chart1LineSeries1.AddXY(x,y,'',clRed);
	  	end;
	  end;
      if(arraysize>1)then
        begin
      	a:=(arraysize*xySum-(xsum*ySum))/((arraysize*xsqrSum-(xSum*xSum)));
        b:=(ySum-a*xSum)/arraysize;
        ShowMessage('a: ' + FloatToStr(a) + ' b: ' + FloatToStr(b));
        Form2.Show;
		end;
      //Form2.Chart1LineSeries1.AddArray(xyArray);
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

