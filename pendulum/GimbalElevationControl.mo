model GimbalElevationControl
  Gimbal.PhysicalPendulum physicalPendulum annotation(
    Placement(transformation(origin = {76, 12}, extent = {{-10, -10}, {10, 10}})));
  Gimbal.MotorBrushless motorBrushless annotation(
    Placement(transformation(origin = {32, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 0.5, startTime = 1) annotation(
    Placement(transformation(origin = {-98, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID(Td = 2, Ti = 100, k = 10) annotation(
    Placement(transformation(origin = {-14, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-58, 12}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-87, 12}, {-67, 12}}, color = {0, 0, 127}));
  connect(feedback.y, PID.u) annotation(
    Line(points = {{-49, 12}, {-26, 12}}, color = {0, 0, 127}));
  connect(PID.y, motorBrushless.u) annotation(
    Line(points = {{-3, 12}, {20, 12}}, color = {0, 0, 127}));
  connect(motorBrushless.y, physicalPendulum.u) annotation(
    Line(points = {{41.2, 12}, {71.2, 12}}, color = {0, 0, 127}));
  connect(physicalPendulum.y, feedback.u2) annotation(
    Line(points = {{91.4, 12.6}, {97.4, 12.6}, {97.4, -21.4}, {-58.6, -21.4}, {-58.6, 4.6}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end GimbalElevationControl;
