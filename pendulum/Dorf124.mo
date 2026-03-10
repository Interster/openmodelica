model Dorf124
  Modelica.Blocks.Continuous.TransferFunction AnalogTFGain(a = {0.001, 1.02, 20, 0}, b = {5}) annotation(
    Placement(transformation(origin = {86, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 1, startTime = 1) annotation(
    Placement(transformation(origin = {-50, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {2, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = 40)  annotation(
    Placement(transformation(origin = {44, -24}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-39, -24}, {-6, -24}}, color = {0, 0, 127}));
  connect(AnalogTFGain.y, feedback.u2) annotation(
    Line(points = {{98, -24}, {104, -24}, {104, -54}, {2, -54}, {2, -32}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation(
    Line(points = {{12, -24}, {32, -24}}, color = {0, 0, 127}));
  connect(gain.y, AnalogTFGain.u) annotation(
    Line(points = {{56, -24}, {74, -24}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Text(origin = {49, 15}, extent = {{-59, 15}, {59, -15}}, textString = "Based on Dorff, pg. 124.")}, coordinateSystem(extent = {{-60, 40}, {120, -60}})),
  version = "",
  uses,
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));end Dorf124;
