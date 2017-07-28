program Project2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  numArray, outArray: Array of Integer;
  arrayLength, globalI: Int64;

function sort(arr: Array of Integer): Integer;
var
  localI, temp, localJ, minNumLoc: Int64;

begin

  for localI := 0 to Length(arr) - 1 do
  begin
    minNumLoc := localI;
    for localJ := localI + 1 to Length(arr) - 1 do
      if arr[localJ] < arr[minNumLoc] then
        minNumLoc := localJ;

    temp := arr[localI];
    arr[localI] := arr[minNumLoc];
    arr[minNumLoc] := temp;

  end;

  for localI := 0 to Length(arr) - 1 do
    outArray[localI] := arr[localI];
end;

begin
  arrayLength := 65536; // length of the array you want
  setLength(numArray, arrayLength);
  setLength(outArray, arrayLength);
  for globalI := 0 to arrayLength - 1 do
    numArray[globalI] := random(1048576);
  // this is just for example
  // replace these 2 lines with

  sort(numArray);
  for globalI := 0 to arrayLength - 1 do
    WriteLn(outArray[globalI]);

  readln;

end.
