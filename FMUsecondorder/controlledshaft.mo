model controlledshaft
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 150, startTime = 1) annotation(
    Placement(transformation(origin = {-94, 36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(transformation(origin = {16, 36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1) annotation(
    Placement(transformation(origin = {32, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 10) annotation(
    Placement(transformation(origin = {0, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-34, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(transformation(origin = {-2, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.LimPID PID(yMax = 1500, k = 100, Ti = 1/100)  annotation(
    Placement(transformation(origin = {-56, 36}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{26, 36}, {22, 36}, {22, -16}}));
  connect(inertia.flange_a, damper.flange_b) annotation(
    Line(points = {{22, -16}, {10, -16}}));
  connect(damper.flange_a, fixed.flange) annotation(
    Line(points = {{-10, -16}, {-34, -16}}));
  connect(ramp.y, PID.u_s) annotation(
    Line(points = {{-83, 36}, {-68, 36}}, color = {0, 0, 127}));
  connect(PID.y, torque.tau) annotation(
    Line(points = {{-45, 36}, {4, 36}}, color = {0, 0, 127}));
  connect(speedSensor.w, PID.u_m) annotation(
    Line(points = {{-12, -56}, {-56, -56}, {-56, 24}}, color = {0, 0, 127}));
  connect(inertia.flange_b, speedSensor.flange) annotation(
    Line(points = {{42, -16}, {56, -16}, {56, -56}, {8, -56}}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001));
end controlledshaft;
