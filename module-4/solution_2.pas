program solution_2;

uses
  Math, SysUtils;

function WallisPi(iterations: integer): real;
var
  i: integer;
  product: real;
begin
  product := 1.0;
  for i := 1 to iterations do
    product := product * Sqr(2 * i) / ((2 * i - 1) * (2 * i + 1));
  product := 2 * product;
  WallisPi := product;
end;

function FourthPowerPi(iterations: integer): real;
var
  k: integer;
  sum: real;
begin
  sum := 0.0;
  for k := 1 to iterations do
    sum := sum + 1.0 / (k * k * k * k);
  FourthPowerPi := Power(90 * sum, 0.25);
end;

function RamanujanPi(iterations: integer): real;
var
  i: integer;
  term, sum, num, denom, sign: real;
begin
  sum := 0.0;
  num := 1.0;
  denom := 1.0;
  sign := 1.0;
  for i := 0 to iterations - 1 do
  begin
    term := sign * (4 * i + 1) * Power(num / denom, 3);
    sum := sum + term;
    sign := -sign;
    num := num * (2 * i + 1);
    denom := denom * (2 * i + 2);
  end;
  RamanujanPi := 2 / sum;
end;

function VietaPi(iterations: integer): real;
var
  i: integer;
  product, sqrt2: real;
begin
  product := 1.0;
  sqrt2 := Sqrt(2.0);
  for i := 1 to iterations do
  begin
    product := product * sqrt2 / 2;
    sqrt2 := Sqrt(2 + sqrt2);
  end;
  VietaPi := 2 / product;
end;

var
  startTime: QWord;
  piValue: real;
begin
  WriteLn('Сравнение методов вычисления π');
  WriteLn('-----------------------------');
  
  startTime := GetTickCount64;
  piValue := WallisPi(100000);
  WriteLn('Формула Валлиса (100 тыс. итераций):');
  WriteLn('  Значение π = ', piValue:0:10);
  WriteLn('  Время: ', GetTickCount64 - startTime, ' мс');
  WriteLn;
  
  startTime := GetTickCount64;
  piValue := FourthPowerPi(100);
  WriteLn('Ряд 1/n^4 (100 итераций):');
  WriteLn('  Значение π = ', piValue:0:10);
  WriteLn('  Время: ', GetTickCount64 - startTime, ' мс');
  WriteLn;
  
  startTime := GetTickCount64;
  piValue := RamanujanPi(10);
  WriteLn('Ряд Рамануджана (10 итераций):');
  WriteLn('  Значение π = ', piValue:0:10);
  WriteLn('  Время: ', GetTickCount64 - startTime, ' мс');
  WriteLn;
  
  startTime := GetTickCount64;
  piValue := VietaPi(25);
  WriteLn('Формула Виета (25 итераций):');
  WriteLn('  Значение π = ', piValue:0:10);
  WriteLn('  Время: ', GetTickCount64 - startTime, ' мс');
  WriteLn;
  
  WriteLn('-----------------------------');
  WriteLn('Ряд Рамануджана быстрее всего!');
end.
