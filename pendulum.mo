model pendulum
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(transformation(origin = {68, -38}, extent = {{-100, -10}, {-80, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(fixed = true), useAxisFlange = true, w(fixed = true)) annotation(
    Placement(transformation(origin = {64, -46}, extent = {{-60, -10}, {-40, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1) annotation(
    Placement(transformation(origin = {68, -38}, extent = {{-60, 30}, {-40, 50}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody1(r = {0.5, 0, 0}, width = 0.06) annotation(
    Placement(transformation(origin = {68, -38}, extent = {{-20, -10}, {0, 10}})));
equation
  connect(damper.flange_b, revolute1.axis) annotation(
    Line(points = {{28, 2}, {28, -18}, {14, -18}, {14, -36}}));
  connect(revolute1.support, damper.flange_a) annotation(
    Line(points = {{8, -36}, {8, 2}}));
  connect(revolute1.frame_b, boxBody1.frame_a) annotation(
    Line(points = {{24, -46}, {38, -46}, {38, -38}, {48, -38}}, color = {95, 95, 95}, thickness = 0.5));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-12, -38}, {-2, -38}, {-2, -46}, {4, -46}}, color = {95, 95, 95}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "4.1.0")),
  Documentation(info = "<html><head></head><body>Simulate pendulum</body></html>"),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end pendulum;
