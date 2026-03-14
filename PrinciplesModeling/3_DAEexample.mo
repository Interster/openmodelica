// Bron:  Principles of Object-Oriented Modeling and Simulation with Modelica 3.3
  // Second Edition
  // Peter Fritzson
  // Bl. 22 in Principles of Object modellling
 
class DAEexample

Real x(start = 0.9);
Real y; 

equation

der(y) + (1 + 0.5*sin(y))*der(x) = sin(time);
x - y = exp(-0.9*x)*cos(y);

annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.001));
end DAEexample;
