model RMS_signal
  Modelica.Blocks.Math.RootMeanSquare RMS_sine(f = 1)  annotation(
    Placement(transformation(origin = {-2, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine(f = 50)  annotation(
    Placement(transformation(origin = {-62, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.RootMeanSquare RMS_signal(f = 1) annotation(
    Placement(transformation(origin = {44, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine1(f = 50) annotation(
    Placement(transformation(origin = {-62, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sum sum1(nin = 3)  annotation(
    Placement(transformation(origin = {-8, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine11(f = 25, phase = 0.17453292519943295) annotation(
    Placement(transformation(origin = {-62, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine12(f = 5, phase = 0.8726646259971648) annotation(
    Placement(transformation(origin = {-62, -68}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sine.y, RMS_sine.u) annotation(
    Line(points = {{-51, 60}, {-15, 60}}, color = {0, 0, 127}));
  connect(sine1.y, sum1.u[1]) annotation(
    Line(points = {{-50, -6}, {-20, -6}, {-20, -38}}, color = {0, 0, 127}));
  connect(sine11.y, sum1.u[2]) annotation(
    Line(points = {{-50, -38}, {-20, -38}}, color = {0, 0, 127}));
  connect(sine12.y, sum1.u[3]) annotation(
    Line(points = {{-50, -68}, {-20, -68}, {-20, -38}}, color = {0, 0, 127}));
  connect(sum1.y, RMS_signal.u) annotation(
    Line(points = {{4, -38}, {32, -38}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001),
  Diagram(graphics = {Text(origin = {29, 41}, extent = {{-47, 9}, {47, -9}}, textString = "RMS van sinusgolf moet 0.707 gee"), Text(origin = {22, -87}, extent = {{-66, 9}, {66, -9}}, textString = "RMS van samegestelde golf as 'n meer algemene voorbeeld"), Rectangle(origin = {6, -41}, lineColor = {255, 0, 0}, extent = {{-86, 55}, {86, -55}}), Rectangle(origin = {1, 56.5}, lineColor = {255, 0, 0}, extent = {{-79, 28}, {79, -27}})}));
end RMS_signal;
