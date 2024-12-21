var
        x, y, z : integer;
Begin
        Readln(x, y, z);
        if (x >= 0) and (y >= 0) and (z >= 0) then Writeln('I');
        if (x < 0) and (y >= 0) and (z >= 0) then Writeln('II');
        if (x < 0) and (y < 0) and (z >= 0) then Writeln('III');
        if (x >= 0) and (y < 0) and (z >= 0) then Writeln('IV');
        if (x >= 0) and (y >= 0) and (z < 0) then Writeln('V');
        if (x < 0) and (y >= 0) and (z < 0) then Writeln('VI');
        if (x < 0) and (y < 0) and (z < 0) then Writeln('VII');
        if (x >= 0) and (y < 0) and (z < 0) then Writeln('VIII');
End.