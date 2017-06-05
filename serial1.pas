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
			Button1: TButton;
			BtnSave: TButton;
			Edit1: TEdit;
			OpenDialog1: TOpenDialog;
			SaveDialog1: TSaveDialog;
			StringGrid1: TStringGrid;
			procedure BtnLoadClick(Sender: TObject);
   procedure BtnSaveClick(Sender: TObject);
   			procedure Button1Click(Sender: TObject);
			procedure StringGrid1StartDrag(Sender: TObject;
				  var DragObject: TDragObject);
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

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
      columNumber:Integer;
begin
      if TryStrToInt(Edit1.text,columNumber)then
        begin
            StringGrid1.ColCount:=columNumber+1;
		end;
	End;

procedure TForm1.StringGrid1StartDrag(Sender: TObject;
	  var DragObject: TDragObject);
begin

end;

procedure TForm1.BtnSaveClick(Sender: TObject);
begin
      if SaveDialog1.Execute then
        begin
			StringGrid1.SaveToCSVFile(SaveDialog1.FileName + '.csv', ';');
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
begin
    if(aCol = StringGrid1.ColCount-1) then
      StringGrid1.ColCount:=++columSize;
	end;

end.

