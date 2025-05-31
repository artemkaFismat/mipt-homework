program solution_3;

var
  b, c, d, f: integer;
  i, root: integer;
  roots: array of integer;
  count: integer;
  value: int64;

function IsRoot(x: integer): boolean;
var
  res: int64;
begin
  res := x*x;           // x²
  res := res * res;      // x⁴
  res := res + b*x*x*x;  // x⁴ + bx³
  res := res + c*x*x;    // x⁴ + bx³ + cx²
  res := res + d*x;      // x⁴ + bx³ + cx² + dx
  res := res + f;        // x⁴ + bx³ + cx² + dx + f
  IsRoot := (res = 0);
end;

function AlreadyFound(x: integer): boolean;
var
  j: integer;
begin
  for j := 0 to count-1 do
    if roots[j] = x then
    begin
      AlreadyFound := true;
      Exit;
    end;
  AlreadyFound := false;
end;

begin
  Write('b = '); ReadLn(b);
  Write('c = '); ReadLn(c);
  Write('d = '); ReadLn(d);
  repeat
    Write('f = '); ReadLn(f);
    if f = 0 then WriteLn('Ошибка: f должно быть ≠ 0!');
  until f <> 0;

  SetLength(roots, 4);
  count := 0;
  
  for i := 1 to Abs(f) do
  begin
    if f mod i = 0 then
    begin
      root := i;
      if IsRoot(root) and not AlreadyFound(root) then
      begin
        roots[count] := root;
        Inc(count);
      end;
      root := -i;
      if IsRoot(root) and not AlreadyFound(root) then
      begin
        roots[count] := root;
        Inc(count);
      end;
    end;
  end;

  if count = 0 then
    WriteLn('Уравнение не имеет целых корней.')
  else
  begin
    Write('Найденные целые корни: ');
    for i := 0 to count-1 do
      Write(roots[i], ' ');
    WriteLn;
  end;
end.
