model temp
Real vx(start=1);
Real vy(start=2);
Real x(start=0);
Real y(start=0);
parameter Real e=0.9;
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(shapeType = "box", r = {-0.25, 0, 0}, length = 0.5, width = 0.001, height = 0.5)  annotation(
    Placement(transformation(origin = {30, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape1(height = 0, length = 0.01, r = {x, 0, y}, shapeType = "sphere", width = 0) annotation(
    Placement(transformation(origin = {-36, -16}, extent = {{-10, -10}, {10, 10}})));
equation
der(vx)=0;
der(vy)=0;
der(x)=vx;
der(y)=vy;

when x>0.25 or x<(-0.25) then
reinit(vx,-e*pre(vx));
end when;

when y>0.25 or y<(-0.25) then
reinit(vy,-e*pre(vy));
end when;


annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end temp;
