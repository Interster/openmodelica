model electricalmotor
  Modelica.Blocks.Continuous.TransferFunction DCmotorFOC(b = {5}, a = {1, 20, 5})  annotation(
    Placement(transformation(origin = {38, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = 40)  annotation(
    Placement(transformation(origin = {-6, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-44, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 1, startTime = 0) annotation(
    Placement(transformation(origin = {-90, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Derivative derivative(T = 0.001)  annotation(
    Placement(transformation(origin = {88, 32}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-78, 32}, {-52, 32}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation(
    Line(points = {{-35, 32}, {-18, 32}}, color = {0, 0, 127}));
  connect(gain.y, DCmotorFOC.u) annotation(
    Line(points = {{5, 32}, {26, 32}}, color = {0, 0, 127}));
  connect(DCmotorFOC.y, feedback.u2) annotation(
    Line(points = {{49, 32}, {62, 32}, {62, 0}, {-44, 0}, {-44, 24}}, color = {0, 0, 127}));
  connect(derivative.u, DCmotorFOC.y) annotation(
    Line(points = {{76, 32}, {50, 32}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
end electricalmotor;
