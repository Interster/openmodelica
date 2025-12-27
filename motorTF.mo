model motorTF
  Modelica.Blocks.Sources.Step step(height = 0.1, startTime = 1) annotation(
    Placement(transformation(origin = {-150, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction motorTF(b = {5}, a = {1, 20})  annotation(
    Placement(transformation(origin = {50, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain RateGain(k = 40)  annotation(
    Placement(transformation(origin = {12, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(origin = {90, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {-108, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ToDegree(k = 57.29582) annotation(
    Placement(transformation(origin = {138, 22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID(k = 10)  annotation(
    Placement(transformation(origin = {-74, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(motorTF.y, feedback.u2) annotation(
    Line(points = {{62, 22}, {68, 22}, {68, -4}, {-30, -4}, {-30, 14}}, color = {0, 0, 127}));
  connect(RateGain.y, motorTF.u) annotation(
    Line(points = {{23, 22}, {38, 22}}, color = {0, 0, 127}));
  connect(RateGain.u, feedback.y) annotation(
    Line(points = {{0, 22}, {-20, 22}}, color = {0, 0, 127}));
  connect(motorTF.y, integrator.u) annotation(
    Line(points = {{62, 22}, {78, 22}}, color = {0, 0, 127}));
  connect(step.y, feedback1.u1) annotation(
    Line(points = {{-138, 22}, {-116, 22}}, color = {0, 0, 127}));
  connect(integrator.y, feedback1.u2) annotation(
    Line(points = {{102, 22}, {110, 22}, {110, -30}, {-108, -30}, {-108, 14}}, color = {0, 0, 127}));
  connect(integrator.y, ToDegree.u) annotation(
    Line(points = {{102, 22}, {126, 22}}, color = {0, 0, 127}));
  connect(PID.y, feedback.u1) annotation(
    Line(points = {{-62, 22}, {-38, 22}}, color = {0, 0, 127}));
  connect(feedback1.y, PID.u) annotation(
    Line(points = {{-98, 22}, {-86, 22}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Text(origin = {-19, -75}, extent = {{43, 11}, {-43, -11}}, textString = "Example from page 125, Dorff."), Text(origin = {9, 62}, extent = {{-81, 14}, {81, -14}}, textString = "Motor oordragsfunksie is theta(s)/Vf(s) waar Vf die spanning is.
Die uitset is spoed in rad/s."), Line(origin = {41, 49}, points = {{-7, 9}, {7, -9}}), Text(origin = {16, -12}, extent = {{-22, 4}, {22, -4}}, textString = "Rate loop"), Text(origin = {6, -38}, extent = {{-22, 4}, {22, -4}}, textString = "Position loop")}, coordinateSystem(extent = {{-160, 80}, {160, -100}})),
    uses(Modelica(version = "4.1.0")),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001),
  version = "");
end motorTF;
