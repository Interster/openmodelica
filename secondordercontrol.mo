model secondordercontrol
  Modelica.Blocks.Continuous.SecondOrder secondOrder(k = 0.3, w = 0.5, D = 0.4)  annotation(
    Placement(transformation(origin = {34, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 1, startTime = 1)  annotation(
    Placement(transformation(origin = {-84, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID(k = 10, Ti = 2, Td = 2)  annotation(
    Placement(transformation(origin = {-4, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-44, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PID.y, secondOrder.u) annotation(
    Line(points = {{7, 20}, {22, 20}}, color = {0, 0, 127}));
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-72, 20}, {-52, 20}}, color = {0, 0, 127}));
  connect(feedback.u2, secondOrder.y) annotation(
    Line(points = {{-44, 12}, {-44.25, 12}, {-44.25, -34}, {62, -34}, {62, 20}, {46, 20}}, color = {0, 0, 127}));
  connect(feedback.y, PID.u) annotation(
    Line(points = {{-35, 20}, {-16, 20}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001),
  Diagram(graphics = {Text(origin = {18, -53}, extent = {{-52, 5}, {52, -5}}, textString = "Model of second order system")}));
end secondordercontrol;
