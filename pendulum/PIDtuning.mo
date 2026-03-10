model PIDtuning
  Modelica.Blocks.Continuous.TransferFunction AnalogTFGain(b = {1}, a = {1, 15.656, 56.6, 0})  annotation(
    Placement(transformation(origin = {18, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step(height = 1, startTime = 1)  annotation(
    Placement(transformation(origin = {-118, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-66, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID1(k = 100) annotation(
    Placement(transformation(origin = {-28, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction DigitalTF(a = {1, 15.656, 56.6, 0}, b = {1}) annotation(
    Placement(transformation(origin = {98, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(transformation(origin = {-68, -78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = 0.1) annotation(
    Placement(transformation(origin = {152, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(samplePeriod = 0.1) annotation(
    Placement(transformation(origin = {194, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.Sampler sampler1(samplePeriod = 0.01) annotation(
    Placement(transformation(origin = {16, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold1(samplePeriod = 0.01) annotation(
    Placement(transformation(origin = {58, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain annotation(
    Placement(transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction AnalogTF(a = {1, 15.656, 56.6, 0}, b = {1}) annotation(
    Placement(transformation(origin = {22, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(transformation(origin = {-62, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PID PID11(k = 100) annotation(
    Placement(transformation(origin = {-24, -16}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step.y, feedback.u1) annotation(
    Line(points = {{-107, 38}, {-74, 38}}, color = {0, 0, 127}));
  connect(AnalogTFGain.y, feedback.u2) annotation(
    Line(points = {{30, 38}, {36, 38}, {36, 8}, {-66, 8}, {-66, 30}}, color = {0, 0, 127}));
  connect(feedback1.y, PID1.u) annotation(
    Line(points = {{-59, -78}, {-41, -78}, {-41, -76}}, color = {0, 0, 127}));
  connect(sampler.y, zeroOrderHold.u) annotation(
    Line(points = {{163, -76}, {181, -76}}, color = {0, 0, 127}));
  connect(step.y, feedback1.u1) annotation(
    Line(points = {{-106, 38}, {-98, 38}, {-98, -78}, {-76, -78}}, color = {0, 0, 127}));
  connect(sampler1.y, zeroOrderHold1.u) annotation(
    Line(points = {{27, -76}, {45, -76}}, color = {0, 0, 127}));
  connect(zeroOrderHold1.y, DigitalTF.u) annotation(
    Line(points = {{69, -76}, {85, -76}}, color = {0, 0, 127}));
  connect(PID1.y, sampler1.u) annotation(
    Line(points = {{-17, -76}, {3, -76}}, color = {0, 0, 127}));
  connect(DigitalTF.y, sampler.u) annotation(
    Line(points = {{109, -76}, {139, -76}}, color = {0, 0, 127}));
  connect(zeroOrderHold.y, feedback1.u2) annotation(
    Line(points = {{205, -76}, {215, -76}, {215, -112}, {-69, -112}, {-69, -86}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation(
    Line(points = {{-56, 38}, {-36, 38}}, color = {0, 0, 127}));
  connect(gain.y, AnalogTFGain.u) annotation(
    Line(points = {{-12, 38}, {6, 38}}, color = {0, 0, 127}));
  connect(AnalogTF.y, feedback2.u2) annotation(
    Line(points = {{33, -16}, {39, -16}, {39, -46}, {-63, -46}, {-63, -24}}, color = {0, 0, 127}));
  connect(step.y, feedback2.u1) annotation(
    Line(points = {{-106, 38}, {-88, 38}, {-88, -16}, {-70, -16}}, color = {0, 0, 127}));
  connect(feedback2.y, PID11.u) annotation(
    Line(points = {{-52, -16}, {-36, -16}}, color = {0, 0, 127}));
  connect(PID11.y, AnalogTF.u) annotation(
    Line(points = {{-12, -16}, {10, -16}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  Diagram(graphics = {Text(extent = {{-62, 82}, {-62, 82}}, textString = "text"), Text(origin = {-19, 77}, extent = {{-59, 15}, {59, -15}}, textString = "Based on Dorff, pg. 452.")}),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end PIDtuning;
