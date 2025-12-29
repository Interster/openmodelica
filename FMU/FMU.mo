model FMU
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {96, -4}, extent = {{-10, -10}, {10, 10}})));

parameter Real a = 9;
parameter Real b = 2;
parameter Real c = 5;

equation
y = a*u^2 + b*u + c;

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end FMU;
