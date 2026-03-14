model seondorderBaseMotion

parameter Real I = 0.8; // Inertia in [kg.m^2]
parameter Real c = 21; // damping [N.m.s/rad]
parameter Real k = 350000; // Stiffness in [N.m/rad]

Real x(start = 0);  // reponse of structure in [rad]
Real base;

Real d1x; // First derivative of x
Real d2x; // Second derivative of x
Real d1base;
  // First derivative of base motion
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-98, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}))); equation

equation

base = u; // Sets the input to the base motion.  Required for successful solution.
d1base = der(base); // The base rotation rate is the derivative of u + disturbance.

d1x = der(x);
d2x = der(d1x);

// Response of damped system under motion of the base
I*d2x + c*(d1x - d1base) + k*(x - base) = 0;

y = x;


annotation(
    uses(Modelica(version = "4.1.0")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
    Icon(graphics = {Rectangle(origin = {-2, -68}, extent = {{-78, 4}, {78, -4}}), Rectangle(origin = {-8, 20}, extent = {{-46, 18}, {46, -18}}), Text(origin = {-7, 23}, extent = {{-15, 11}, {15, -11}}, textString = "m"), Text(origin = {-59, -37}, extent = {{-15, 11}, {15, -11}}, textString = "k"), Text(origin = {39, -35}, extent = {{-15, 11}, {15, -11}}, textString = "c"), Line(origin = {-26.9009, -31}, points = {{-1.09913, -33}, {-1.09913, -19}, {8.90087, -13}, {-7.09913, -9}, {8.90087, -3}, {-9.09913, 3}, {8.90087, 9}, {-9.09913, 13}, {2.90087, 17}, {2.90087, 33}}), Line(origin = {12, -12}, points = {{0, 14}, {0, -14}}), Line(origin = {12, -52}, points = {{0, -12}, {0, 12}}), Line(origin = {12, -29}, points = {{-10, 11}, {-10, -11}, {10, -11}, {10, 11}}), Line(origin = {12, -26}, points = {{-8, 0}, {8, 0}}), Line(origin = {47, 44}, points = {{-9, -26}, {9, -26}, {9, 26}}, arrow = {Arrow.None, Arrow.Open}), Text(origin = {69, 59}, extent = {{-15, 11}, {15, -11}}, textString = "x")}),
    Diagram(graphics));
end seondorderBaseMotion;
