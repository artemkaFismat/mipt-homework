program solution_7;

type
  Point = record
    x, y: real;
  end;

var
  points: array of Point;
  p: Point;
  i, n: integer;
  canBeOnCircle: boolean;
  a, b, c, d, e, f, g, h, det: real;
  centerX, centerY, radius: real;

begin
  WriteLn('Вводите координаты точек (x,y). Для окончания ввода введите (0,0):');
  n := 0;
  repeat
    Write('Точка ', n+1, ': ');
    ReadLn(p.x, p.y);
    if (p.x <> 0) or (p.y <> 0) then
    begin
      SetLength(points, n+1);
      points[n] := p;
      n := n + 1;
    end;
  until (p.x = 0) and (p.y = 0);

  if n < 3 then
  begin
    WriteLn('Все точки лежат на одной окружности (требуется минимум 3 точки для однозначного определения окружности).');
    Exit;
  end;

  canBeOnCircle := True;
  
  a := points[0].x;
  b := points[0].y;
  c := points[1].x;
  d := points[1].y;
  e := points[2].x;
  f := points[2].y;

  det := a*(d - f) - b*(c - e) + (c*f - d*e);
  
  if det = 0 then
  begin
    for i := 3 to n-1 do
    begin
      if (points[i].x - a)*(d - b) <> (points[i].y - b)*(c - a) then
      begin
        canBeOnCircle := False;
        Break;
      end;
    end;
    
    if canBeOnCircle then
      WriteLn('Все точки коллинеарны и не могут лежать на одной окружности (если точек больше 2).')
    else
      WriteLn('Точки не могут лежать на одной окружности.');
    Exit;
  end;

  g := (a*a + b*b) / 2;
  h := (c*c + d*d) / 2;
  
  centerX := ( (h - g)*(d - b) - ( (e*e + f*f)/2 - g )*(d - b) ) / det;
  centerY := ( ( (e*e + f*f)/2 - g )*(c - a) - (h - g)*(c - a) ) / det;
  radius := Sqrt( (a - centerX)*(a - centerX) + (b - centerY)*(b - centerY) );

  for i := 3 to n-1 do
  begin
    if Abs( Sqrt( (points[i].x - centerX)*(points[i].x - centerX) + 
             (points[i].y - centerY)*(points[i].y - centerY) ) - radius ) > 1e-10 then
    begin
      canBeOnCircle := False;
      Break;
    end;
  end;

  if canBeOnCircle then
    WriteLn('Все точки могут лежать на одной окружности.')
  else
    WriteLn('Точки не могут лежать на одной окружности.');
end.
