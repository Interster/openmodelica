model showBaseMotion
  seondorderBaseMotion seondorderBaseMotion1 annotation(
    Placement(transformation(origin = {-4, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.017, f = 2)  annotation(
    Placement(transformation(origin = {-60, 2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain toMicroRad annotation(
    Placement(transformation(origin = {50, 2}, extent = {{-10, -10}, {10, 10}})));
  seondorderBaseMotion mode1Az annotation(
    Placement(transformation(origin = {-12, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 0.017, f = 2) annotation(
    Placement(transformation(origin = {-74, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain toMicroRad1 annotation(
    Placement(transformation(origin = {82, -66}, extent = {{-10, -10}, {10, 10}})));
  seondorderBaseMotion mode2Az annotation(
    Placement(transformation(origin = {-14, -84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Sum sum1(nin = 2)  annotation(
    Placement(transformation(origin = {38, -66}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(sine.y, seondorderBaseMotion1.u) annotation(
    Line(points = {{-48, 2}, {-8, 2}}, color = {0, 0, 127}));
  connect(seondorderBaseMotion1.y, toMicroRad.u) annotation(
    Line(points = {{12, 2}, {38, 2}}, color = {0, 0, 127}));
  connect(sine1.y, mode1Az.u) annotation(
    Line(points = {{-63, -54}, {-23, -54}}, color = {0, 0, 127}));
  connect(sine1.y, mode2Az.u) annotation(
    Line(points = {{-62, -54}, {-44, -54}, {-44, -84}, {-24, -84}}, color = {0, 0, 127}));
  connect(mode1Az.y, sum1.u[1]) annotation(
    Line(points = {{-2, -54}, {26, -54}, {26, -66}}, color = {0, 0, 127}));
  connect(mode2Az.y, sum1.u[2]) annotation(
    Line(points = {{-4, -84}, {26, -84}, {26, -66}}, color = {0, 0, 127}));
  connect(sum1.y, toMicroRad1.u) annotation(
    Line(points = {{49, -66}, {70, -66}}, color = {0, 0, 127}));
  connect(seondorderBaseMotion1.y, toMicroRad.u) annotation(
    Line(points = {{6, 2}, {38, 2}}, color = {0, 0, 127}));
  connect(sine1.y, mode1Az.u) annotation(
    Line(points = {{-62, -54}, {-22, -54}}, color = {0, 0, 127}));
  connect(sine1.y, mode2Az.u) annotation(
    Line(points = {{-62, -54}, {-42, -54}, {-42, -84}, {-24, -84}}, color = {0, 0, 127}));
  connect(mode1Az.y, sum1.u[1]) annotation(
    Line(points = {{-2, -54}, {10, -54}, {10, -66}, {26, -66}}, color = {0, 0, 127}));
  connect(mode2Az.y, sum1.u[2]) annotation(
    Line(points = {{-4, -84}, {8, -84}, {8, -66}, {26, -66}}, color = {0, 0, 127}));
  connect(sum1.y, toMicroRad1.u) annotation(
    Line(points = {{50, -66}, {70, -66}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001),
  Diagram(graphics = {Text(origin = {-6, 68}, extent = {{-26, 8}, {26, -8}}, textString = "Calculate the RMS value of the output signal
Subtract the mean and then calculate that RMS

See how resonance occurs at 105.2Hz."), Text(origin = {8, -32}, extent = {{-104, 12}, {104, -12}}, textString = "Superposition of the modes of an axis for example azimuth")}));
end showBaseMotion;
