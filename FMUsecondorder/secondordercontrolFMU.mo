model secondordercontrolFMU
  Modelica.Blocks.Continuous.SecondOrder secondOrder(D = 0.4, k = 0.3, w = 0.5) annotation(
    Placement(transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-102, 6}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-60, 6}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {84, 6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {62, 6}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(y, secondOrder.y) annotation(
    Line(points = {{84, 6}, {13, 6}}, color = {0, 0, 127}));
  connect(secondOrder.u, u) annotation(
    Line(points = {{-10, 6}, {-102, 6}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")));
end secondordercontrolFMU;
