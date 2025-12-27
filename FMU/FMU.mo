model FMU
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {96, -4}, extent = {{-10, -10}, {10, 10}})));
equation

y = u^3;

annotation(
    uses(Modelica(version = "4.1.0")));
end FMU;
