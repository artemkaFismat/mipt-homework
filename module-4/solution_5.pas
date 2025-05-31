program solution_5;

uses
  SysUtils;

var
  numStr: string;
  uniqueDigits: set of '0'..'9';
  digit: char;
  count: integer;

begin
  Write('Введите целое неотрицательное число: ');
  ReadLn(numStr);

  if numStr = '' then
  begin
    WriteLn('Ошибка: не введено число');
    Exit;
  end;

  for digit in numStr do
  begin
    if not (digit in ['0'..'9']) then
    begin
      WriteLn('Ошибка: введены не только цифры');
      Exit;
    end;
  end;

  uniqueDigits := [];
  for digit in numStr do
    Include(uniqueDigits, digit);

  count := 1;
  for digit in uniqueDigits do
    count := count * Length(numStr);

  WriteLn('Количество различных чисел такой же длины: ', count);
end.
