model BeheerDigitaal
  Modelica.Blocks.Continuous.SecondOrder ToeLus(k = 1, w = 628, D = 0.02)  annotation(
    Placement(transformation(origin = {32, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID(k = 0.001, Ti = 0.1, Td = 0.1)  annotation(
    Placement(transformation(origin = {-72, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 1, startTime = 1)  annotation(
    Placement(transformation(origin = {-136, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-104, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = 0.005)  annotation(
    Placement(transformation(origin = {70, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(samplePeriod = 0.005)  annotation(
    Placement(transformation(origin = {116, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold1(samplePeriod = 0.0005) annotation(
    Placement(transformation(origin = {4, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler1(samplePeriod = 0.0005) annotation(
    Placement(transformation(origin = {-36, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.SecondOrder Ooplus2deOrde(D = 0.02, k = 1, w = 628) annotation(
    Placement(transformation(origin = {-20, -54}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-125, 8}, {-112, 8}}, color = {0, 0, 127}));
  connect(feedback.y, PID.u) annotation(
    Line(points = {{-95, 8}, {-89.5, 8}, {-89.5, 10}, {-84, 10}}, color = {0, 0, 127}));
  connect(ToeLus.y, sampler.u) annotation(
    Line(points = {{44, 8}, {58, 8}, {58, 6}}, color = {0, 0, 127}));
  connect(sampler.y, zeroOrderHold.u) annotation(
    Line(points = {{82, 6}, {104, 6}, {104, 4}}, color = {0, 0, 127}));
  connect(zeroOrderHold.y, feedback.u2) annotation(
    Line(points = {{128, 4}, {134, 4}, {134, -24}, {-104, -24}, {-104, 0}}, color = {0, 0, 127}));
  connect(zeroOrderHold1.y, ToeLus.u) annotation(
    Line(points = {{16, 8}, {20, 8}}, color = {0, 0, 127}));
  connect(PID.y, sampler1.u) annotation(
    Line(points = {{-60, 10}, {-48, 10}}, color = {0, 0, 127}));
  connect(sampler1.y, zeroOrderHold1.u) annotation(
    Line(points = {{-24, 10}, {-8, 10}, {-8, 8}}, color = {0, 0, 127}));
  connect(step.y, Ooplus2deOrde.u) annotation(
    Line(points = {{-124, 8}, {-118, 8}, {-118, -54}, {-32, -54}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001));
end BeheerDigitaal;
