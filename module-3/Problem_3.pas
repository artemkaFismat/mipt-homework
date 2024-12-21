var
        x1, x2, xl, y1, y2, yl, r, l1, l2 : integer;
Begin
        Readln(x1, y1, x2, y2, xl, yl, r);
        l1 := abs((x1 - xl) * (x1 - xl) + (y1 - yl) * (y1 - yl) - r * r);
        l2 := abs((x2 - xl) * (x2 - xl) + (y2 - yl) * (y2 - yl) - r * r);

        if l1 < l2 then begin
                Writeln('The first point is closer.');
        end
        else if l2 < l1 then begin
                Writeln('The second point is closer.');
        end
        else begin
                Writeln('Both points are equally removed from the circle.');
        end;
End.