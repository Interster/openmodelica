model simpleRotorControl
  Gimbal.simpleRotor simpleRotor(x1(start = 0), x2(start = 10))  annotation(
    Placement(transformation(origin = {34, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 0)  annotation(
    Placement(transformation(origin = {-62, 4}, extent = {{-10, -10}, {10, 10}})));
  Gimbal.MotorBrushless motorBrushless annotation(
    Placement(transformation(origin = {-18, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PI PI annotation(
    Placement(transformation(origin = {-32, -36}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(motorBrushless.y, simpleRotor.u) annotation(
    Line(points = {{-9, 4}, {31, 4}, {31, 3}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
end simpleRotorControl;
