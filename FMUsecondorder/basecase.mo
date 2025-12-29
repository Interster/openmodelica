model basecase
  Modelica.Blocks.Sources.Ramp ramp(height = 100, duration = 4, startTime = 1)  annotation(
    Placement(transformation(origin = {-42, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(transformation(origin = {2, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1)  annotation(
    Placement(transformation(origin = {18, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 10)  annotation(
    Placement(transformation(origin = {-14, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-56, -22}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp.y, torque.tau) annotation(
    Line(points = {{-30, 30}, {-10, 30}}, color = {0, 0, 127}));
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{12, 30}, {8, 30}, {8, -22}}));
  connect(inertia.flange_a, damper.flange_b) annotation(
    Line(points = {{8, -22}, {-4, -22}}));
  connect(damper.flange_a, fixed.flange) annotation(
    Line(points = {{-24, -22}, {-56, -22}}));

annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
end basecase;
