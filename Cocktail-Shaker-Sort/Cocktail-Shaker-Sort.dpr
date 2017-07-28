program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  d: Array [1 .. 500000] of Int64;
  i: Int64;
  s: String;
  started: String;
  finished: String;

function sorted(): Boolean;
var
  ii, n: Int64;
  r: Boolean;
begin
  r := True;
  n := d[1];
  for ii := 1 to 500000 do
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
  p, ix, tx: Int64;
begin
  tx := 0;

  repeat

    for ix := 2 to 500000 - tx do
    begin

      if d[ix - 1] > d[ix] then
      begin
        p := d[ix - 1];
        d[ix - 1] := d[ix];
        d[ix] := p;
      end;

    end;

    for ix := 500000 to 2 - tx do
    begin

      if d[ix + 1] < d[ix] then
      begin
        p := d[ix + 1];
        d[ix + 1] := d[ix];
        d[ix] := p;
      end;

    end;

    tx := tx + 1;

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

    for i := 1 to 500000 do
      d[i] := Random(10000000);

    started := timetostr(now);
    writeln(started);
    sort();
    finished := timetostr(now);
    writeln(finished);
    writeln('-----------List Soretd-----------');
    for i := 1 to 500000 do
      writeln(d[i]);
    writeln('-----------List Soretd-----------');
     writeln(started);
    writeln(finished);

    writeln('');
    writeln('');

    writeln('Press Ctrl + C to quit. Press Enter to relaunch application');
    readln;

  until 0 = 1;


end.
