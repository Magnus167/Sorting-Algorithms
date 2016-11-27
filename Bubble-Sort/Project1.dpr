program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  d: Array [1 .. 10] of Int64;
  i: Int64;
  s: String;

function sorted(): Boolean;
var
  ii, n: Int64;
  r: Boolean;
begin
  r := True;
  n := d[1];
  for ii := 1 to 10 do
  begin
    if NOT(n <= d[ii]) then
    begin
      r := False;
      break;
    end;
    n := d[ii];
  end;

  result := r;
end;

function sort( { a: array of Int64 } ): Int64;
var
  p, ix: Int64;
begin
  repeat
    for ix := 2 to 10 do
    begin

      if d[ix - 1] > d[ix] then
      begin
        p := d[ix - 1];
        d[ix - 1] := d[ix];
        d[ix] := p;
      end;

    end;

  until (sorted = True);

end;

function isnum(ss: String): Boolean;
var
  isn: Int64;
  r: Boolean;
begin
  r := True;

  for isn := 1 to ss.Length do
    if NOT(ss[isn] in ['0' .. '9', '-']) then
    begin
      r := False;
      break;
    end;

  if ss.Length = 0 then
    r := False;

  result := r;

end;

begin
  repeat
    WriteLn('Please enter 10 Integers');
    for i := 1 to 10 do
    begin

      repeat
        WriteLn('Please enter Integer number ' + IntToStr(i));
        readln(s);
      until isnum(s);
      d[i] := StrToInt(s);
    end;

    sort();
    WriteLn('-----------List Soretd-----------');
    for i := 1 to 10 do
      WriteLn(d[i]);

    WriteLn('');
    WriteLn('');

    WriteLn('Press Ctrl + C to quit. Press Enter to relaunch application');
    readln;

  until 0 = 1;

end.
