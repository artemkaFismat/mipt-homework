program solution_10;

var
  numbers: array of Integer;
  n, i, j, b, c, count: Integer;
  maxSum, currentSum: Real;
  D: Real;
  x1, x2: Real;

begin
  SetLength(numbers, 0);
  count := 0;

  repeat
    ReadLn(n);
    if n <> 1001 then
    begin
      if Abs(n) >= 1000 then
      begin
        WriteLn('Ошибка: число должно быть по модулю меньше 1000!');
        Continue;
      end;
      SetLength(numbers, count + 1);
      numbers[count] := n;
      Inc(count);
    end;
  until n = 1001;

  if count < 2 then
  begin
    WriteLn('Ошибка: в последовательности должно быть хотя бы 2 числа!');
    Exit;
  end;

  maxSum := -1;

  for i := 0 to count - 1 do
  begin
    for j := 0 to count - 1 do
    begin
      if i = j then Continue;
      b := numbers[i];
      c := numbers[j];
      D := b * b - 4 * c;
      if D >= 0 then
      begin
        x1 := (-b + Sqrt(D)) / 2;
        x2 := (-b - Sqrt(D)) / 2;
        currentSum := b * b - 2 * c;
        if currentSum > maxSum then
          maxSum := currentSum;
      end;
    end;
  end;

  if maxSum = -1 then
    WriteLn('Нет уравнений с действительными корнями.')
  else
    WriteLn('Максимальная сумма квадратов корней: ', maxSum:0:2);
end.
