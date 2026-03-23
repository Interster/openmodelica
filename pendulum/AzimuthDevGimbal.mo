model AzimuthDevGimbal
  Gimbal.VerticalRotor AzimuthRotor annotation(
    Placement(transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 0.0, startTime = 1) annotation(
    Placement(transformation(origin = {-56, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, AzimuthRotor.u) annotation(
    Line(points = {{-44, 10}, {-8, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end AzimuthDevGimbal;
