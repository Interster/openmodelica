model toetsFMU
  FMU fmu annotation(
    Placement(transformation(origin = {4, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 3, duration = 2, offset = 1, startTime = 1)  annotation(
    Placement(transformation(origin = {-48, 2}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp.y, fmu.u) annotation(
    Line(points = {{-36, 2}, {-6, 2}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
end toetsFMU;
