model toetsFMU
  FMU fmu annotation(
    Placement(transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock(startTime = 0)  annotation(
    Placement(transformation(origin = {-58, 2}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(continuousClock.y, fmu.u) annotation(
    Line(points = {{-46, 2}, {-6, 2}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end toetsFMU;
