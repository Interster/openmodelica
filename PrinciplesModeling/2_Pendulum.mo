// Bron:  Principles of Object-Oriented Modeling and Simulation with Modelica 3.3
  // Second Edition
  // Peter Fritzson
  // Bl. 21 in Principles of Object modellling

class Pendulum

constant Real PI = 3.141592653589793;

parameter Real m=1, g=9.81, L=0.5;
Real F;
output Real x(start=0.5),y(start=0);
output Real vx,vy;

equation

m*der(vx) = -(x/L)*F;
m*der(vy) = -(y/L)*F-m*g;
der(x) = vx;
der(y) = vy;

x^2 + y^2 = L^2;

annotation(
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.004));
end Pendulum;
