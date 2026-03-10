model zoh
  Modelica.Blocks.Sources.Sine sine(f = 10)  annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = 0.0005)  annotation(
    Placement(transformation(origin = {-26, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(samplePeriod = 0.001)  annotation(
    Placement(transformation(origin = {8, -2}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sine.y, sampler.u) annotation(
    Line(points = {{-48, 0}, {-38, 0}}, color = {0, 0, 127}));
  connect(sampler.y, zeroOrderHold.u) annotation(
    Line(points = {{-14, 0}, {-4, 0}, {-4, -2}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
end zoh;
