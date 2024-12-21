var
        x1, x2, x3, y1, y2, y3,  px, py : integer;
Begin
        Readln(x1, y1, x2, y2, x3, y3, px, py);
        if ((px - x1) * (y1 - y2) - (py - y1) * (x1 - x2) >= 0) and
           ((px - x2) * (y2 - y3) - (py - y2) * (x2 - x3) >= 0) and
           ((px - x3) * (y3 - y1) - (py - y3) * (x2 - x1) >= 0)
        then begin
                Writeln('Yes');
        end
        else begin
                Writeln('No');
        end;
End.