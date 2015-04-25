unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}
const size = 10;
type  pole =array[1..size] of integer;
var   i    :integer;

function fillArrayAndReturn(var p:pole; rand:integer):pole;
begin
  Randomize;
  for i:= 1 to size do
  begin
    p[i]:= random(rand) + 1;
  end;
  Result:=p;
end;

function returnMinMaxInArray(p:pole):string;
var min, max, indexMin, indexMax :integer;
begin
  min     :=p[1];
  max     :=p[1];
  indexMin:= 1;
  indexMax:= 1;

  for i:=1 to size do
  begin
    if (min > p[i]) then begin
                           min     :=p[i];
                           indexMin:=i;
                         end;
    if (max < p[i]) then begin
                           max     :=p[i];
                           indexMax:=i;
                         end;
  end;
  Result:= 'max: ' + IntToStr(max) + ' indexMax: ' +IntToStr(indexMax) + ' min: ' +IntToStr(min) + ' indexMin: ' +IntToStr(indexMin);
end;

procedure memoizuj(str:string);
begin
  Form1.Memo1.Lines.Add(str);
end;
procedure writeArray(var p:pole);
var all:string;
begin
  for i:= 0 to size do
  begin
    all += IntToStr(p[i]) + ', ';
  end;
  memoizuj(all);
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var ar  :pole;
    rand:integer;
begin
  rand:= 50;
  memoizuj(returnMinMaxInArray(fillArrayAndReturn(ar, rand)));
  writeArray(ar);
end;

end.



































