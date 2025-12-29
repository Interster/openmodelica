model controlledshaft2FMU
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(transformation(origin = {36, 28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1) annotation(
    Placement(transformation(origin = {52, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 10) annotation(
    Placement(transformation(origin = {20, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {-14, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(transformation(origin = {8, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-52, 28}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-122, 28}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {-20, -82}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-20, -92}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{46, 28}, {42, 28}, {42, -24}}));
  connect(inertia.flange_a, damper.flange_b) annotation(
    Line(points = {{42, -24}, {30, -24}}));
  connect(damper.flange_a, fixed.flange) annotation(
    Line(points = {{10, -24}, {-14, -24}}));
  connect(inertia.flange_b, speedSensor.flange) annotation(
    Line(points = {{62, -24}, {76, -24}, {76, -52}, {18, -52}}));
  connect(u, torque.tau) annotation(
    Line(points = {{-52, 28}, {24, 28}}, color = {0, 0, 127}));
  connect(y, speedSensor.w) annotation(
    Line(points = {{-20, -82}, {-44, -82}, {-44, -52}, {-3, -52}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")));
end controlledshaft2FMU;
