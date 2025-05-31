program solution_8;

type
  Point = record
    x, y: real;
  end;

var
  trajectory: array of Point;
  currentPoint: Point;
  totalAngle: real;
  i, n, revolutions: integer;
  prevAngle, currentAngle, angleDiff: real;

function CalculateAngle(x, y: real): real;
begin
  if x = 0 then
  begin
    if y > 0 then
      CalculateAngle := Pi/2
    else
      CalculateAngle := -Pi/2;
  end
  else
  begin
    CalculateAngle := ArcTan(y/x);
    if x < 0 then
      CalculateAngle := CalculateAngle + Pi;
  end;
end;

begin
  SetLength(trajectory, 1);
  trajectory[0].x := 1.0;
  trajectory[0].y := 0.0;
  n := 1;

  WriteLn('Вводите координаты точек траектории (x,y). Для окончания ввода введите (0,0):');
  repeat
    Write('Точка ', n, ': ');
    ReadLn(currentPoint.x, currentPoint.y);
    if (currentPoint.x <> 0) or (currentPoint.y <> 0) then
    begin
      SetLength(trajectory, n+1);
      trajectory[n] := currentPoint;
      n := n + 1;
    end;
  until (currentPoint.x = 0) and (currentPoint.y = 0);

  totalAngle := 0.0;
  prevAngle := CalculateAngle(trajectory[0].x, trajectory[0].y);

  for i := 1 to n-1 do
  begin
    currentAngle := CalculateAngle(trajectory[i].x, trajectory[i].y);
    angleDiff := currentAngle - prevAngle;

    if angleDiff > Pi then
      angleDiff := angleDiff - 2*Pi
    else if angleDiff < -Pi then
      angleDiff := angleDiff + 2*Pi;

    totalAngle := totalAngle + angleDiff;
    prevAngle := currentAngle;
  end;

  revolutions := Round(totalAngle / (2*Pi));

  WriteLn('Количество полных оборотов вокруг (0,0): ', revolutions);
end.
