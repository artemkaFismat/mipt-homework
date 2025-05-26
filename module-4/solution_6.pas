program solution_6;
var
        num, temp, digit, newNum, power, i : integer;
        oddDigits                          : array of integer;
        count                              : integer;
begin
        readln(num);

        temp := num;
        count := 0;
        newNum := 0;
        power := 1

        while temp > 0 do
        begin
                digit := temp mod 10;
                if digit mod 2 <> 0 then
                        count := count + 1
                temp := temp div 10;
        end;

        SetLength(oddDigits, count);

        temp := num;
        i := 0
        while temp > 0 do
        begin
                digit := temp mod 10;
                if digit mod 2 <> 0 then
                begin
                        oddDigits[i] := digit;
                        i := i + 1
                end;
                temp := tem div 10;
        end;

        for i := 0 to (count div 2) - 1 do
        begin
                temp := oddDigits[i];
                oddDigits[i] := oddDigits[count - 1 - i];
                oddDigits[count - 1 - i] := temp;
        end;

        temp := num;
        i := 0;
        power := 1;
        newNum := 0;

        while temp > 0 do
        begin
                digit := temp mod 10;
                if digit mod 2 <> 0 then
                begin
                        digit := oddDigits[i];
                        i := i + 1;
                end;
                newNum := newNum + digit * power;
                power := power * 10;
                temp := temp div 10;
        end;

        writeln(newNum);
end;