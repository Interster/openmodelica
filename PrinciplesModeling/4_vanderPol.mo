model vanderPol

  // Bron:  Principles of Object-Oriented Modeling and Simulation with Modelica 3.3
  // Second Edition
  // Peter Fritzson
  // Bl. 22 in Principles of Object modellling

Real x(start = 1) "Descriptive string for x"; // x starts at 1
Real y(start = 1) "Descriptive string for y"; // y starts at 1

parameter Real lambda = 0.3;

equation

der(x) = y; // This is the first equation
der(y) = -x + lambda*(1- x*x)*y; /* The 2nd differential equation */

annotation(
    experiment(StartTime = 0, StopTime = 25, Tolerance = 1e-06, Interval = 0.001));
end vanderPol;
