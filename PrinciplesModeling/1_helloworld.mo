model helloworld
  // Bron:  Principles of Object-Oriented Modeling and Simulation with Modelica 3.3
  // Second Edition
  // Peter Fritzson
  // Bl. 20 in Principles of Object modellling
  Real x(start = 1);
parameter Real a = 1;

equation

der(x) = -a*x;

annotation(
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.001));
end helloworld;
