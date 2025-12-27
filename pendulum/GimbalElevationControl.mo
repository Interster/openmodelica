model GimbalElevationControl
  Gimbal.MotorBrushless motorBrushless(Kt = 1)  annotation(
    Placement(transformation(origin = {-62, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 0.1, startTime = 1) annotation(
    Placement(transformation(origin = {-242, 12}, extent = {{-10, -10}, {10, 10}})));
  Gimbal.PhysicalPendulum GimbalElevation(mus = 0.6, mud = 0.3)  annotation(
    Placement(transformation(origin = {-32, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.WrapAngle wrapAngle annotation(
    Placement(transformation(origin = {12, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ToDegrees(k = 57.295) annotation(
    Placement(transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID_pos(k = 1)  annotation(
    Placement(transformation(origin = {-150, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-180, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ToDegreesPerSecond(k = 57.295) annotation(
    Placement(transformation(origin = {52, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ToRadians(k = 0.01745) annotation(
    Placement(transformation(origin = {-208, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID_rate(k = 10, Ti = 10, Td = 20) annotation(
    Placement(transformation(origin = {-90, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {-120, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain RateGain(k = 1) annotation(
    Placement(transformation(origin = {-96, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Sine sine_disturb(amplitude = 0, f = 10, startTime = 5)  annotation(
    Placement(transformation(origin = {-84, 54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ToRadians1(k = 0.01745) annotation(
    Placement(transformation(origin = {-44, 54}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(motorBrushless.y, GimbalElevation.u) annotation(
    Line(points = {{-53, 12}, {-36, 12}}, color = {0, 0, 127}));
  connect(GimbalElevation.y_uit[1], wrapAngle.u) annotation(
    Line(points = {{-22, 10}, {0, 10}}, color = {0, 0, 127}));
  connect(wrapAngle.y, ToDegrees.u) annotation(
    Line(points = {{24, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(feedback.y, PID_pos.u) annotation(
    Line(points = {{-171, 12}, {-163, 12}}, color = {0, 0, 127}));
  connect(GimbalElevation.y_uit[2], ToDegreesPerSecond.u) annotation(
    Line(points = {{-22, 10}, {-6, 10}, {-6, -22}, {40, -22}}, color = {0, 0, 127}));
  connect(GimbalElevation.y_uit[1], feedback.u2) annotation(
    Line(points = {{-22, 10}, {-22, -36}, {-180, -36}, {-180, 4}}, color = {0, 0, 127}));
  connect(ToRadians.y, feedback.u1) annotation(
    Line(points = {{-197, 12}, {-189, 12}}, color = {0, 0, 127}));
  connect(step.y, ToRadians.u) annotation(
    Line(points = {{-231, 12}, {-221, 12}}, color = {0, 0, 127}));
  connect(PID_rate.y, motorBrushless.u) annotation(
    Line(points = {{-78, 12}, {-72, 12}}, color = {0, 0, 127}));
  connect(feedback1.y, PID_rate.u) annotation(
    Line(points = {{-110, 12}, {-102, 12}}, color = {0, 0, 127}));
  connect(PID_pos.y, feedback1.u1) annotation(
    Line(points = {{-138, 12}, {-128, 12}}, color = {0, 0, 127}));
  connect(GimbalElevation.y_uit[2], RateGain.u) annotation(
    Line(points = {{-22, 10}, {-14, 10}, {-14, -20}, {-84, -20}}, color = {0, 0, 127}));
  connect(RateGain.y, feedback1.u2) annotation(
    Line(points = {{-106, -20}, {-120, -20}, {-120, 4}}, color = {0, 0, 127}));
  connect(sine_disturb.y, ToRadians1.u) annotation(
    Line(points = {{-73, 54}, {-56, 54}}, color = {0, 0, 127}));
  connect(ToRadians1.y, GimbalElevation.d) annotation(
    Line(points = {{-33, 54}, {-28, 54}, {-28, 6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-260, 80}, {80, -40}})),
    version = "",
    uses(Modelica(version = "4.1.0")));
end GimbalElevationControl;
