program solution_9;

function GCD(a, b: longint): longint;
begin
  while b <> 0 do
  begin
    a := a mod b;
    if a = 0 then
    begin
      a := b;
      break;
    end;
    b := b mod a;
  end;
  GCD := a;
end;

function LCM(a, b: longint): longint;
begin
  LCM := (a div GCD(a, b)) * b;
end;

var
  numbers: array of longint;
  n, i, count: longint;
  currentLCM: longint;
begin
  WriteLn('Вводите натуральные числа (0 - конец ввода):');
  count := 0;
  repeat
    ReadLn(n);
    if n <> 0 then
    begin
      SetLength(numbers, count+1);
      numbers[count] := n;
      Inc(count);
    end;
  until n = 0;

  if count = 0 then
  begin
    WriteLn('Не введено ни одного числа!');
    Exit;
  end;

  currentLCM := numbers[0];
  for i := 1 to count-1 do
  begin
    currentLCM := LCM(currentLCM, numbers[i]);
    if currentLCM < 0 then
    begin
      WriteLn('Произошло переполнение! НОК слишком большое.');
      Exit;
    end;
  end;

  WriteLn('Наименьшее общее кратное: ', currentLCM);
end.
