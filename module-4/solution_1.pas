program solution_1;
var
    count, num             : longint;
    firstPart, lastPart    : integer;
    prod1, prod2           : integer;
    d1, d2, d3, d4, d5, d6 : integer;
begin
    count := 0;

    for num := 100000 to 999999 do
    begin
        firstPart := num div 1000;
        lastPart :=  num mod 1000;

        d1 := firstPart div 100;
        d2 := (firstPart div 100) mod 10;
        d3 := firstPart mod 10;
        prod1 := d1 * d2 * d3;

        d4 := lastPart div 100;
        d5 := (lastPart div 10) mod 10;
        d6 := lastPart mod 10;
        prod2 := d4 * d5 * d6;

        if prod1 = prod2 then
            count := count + 1;
    end;

    writeln(count);
end.
