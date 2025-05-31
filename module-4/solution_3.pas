program solution_3;

uses
  SysUtils;

var
  m, max_m: LongInt;
  n: LongInt;
  sum: Extended;
  found: Boolean;

begin
  ReadLn(m);

  n := 0;
  sum := 0.0;
  while sum <= m do
  begin
    Inc(n);
    sum := sum + 1.0 / n;
  end;
  WriteLn('Минимальное n такое, что сумма > ', m, ': ', n);

  max_m := 0;
  n := 0;
  sum := 0.0;
  found := False;

  while not found do
  begin
    Inc(n);
    sum := sum + 1.0 / n;
    if n = High(LongInt) then
    begin
      max_m := Trunc(sum);
      found := True;
    end
    else if sum > High(LongInt) then
    begin
      max_m := Trunc(sum - 1.0/n);
      found := True;
    end;
  end;
  WriteLn('Максимальное m, при котором n остается в LongInt: ', max_m);
end.
