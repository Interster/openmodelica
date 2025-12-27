model pendulumEenvoudig

// Model van youtube.com/watch?v=3jofcOmvWj0

  parameter Real M = 1; // Massa van die pendulum
  parameter Real L = 1; // Lengte van die pendulum
  parameter Real g = 9.81; // Gravitasieversnelling
  
  Real u; // Inset draaimoment
  Real y; // Uitset hoekverplasing
  Real x1(start = 1); // Pendulum hoekverplasing
  Real x2(start = 0); // Pendulum hoeksnelheid

equation

  der(x1) = x2;
  der(x2) = (u - M*g*L*sin(x1))/(M*L^2);
  y = x1*180/3.14159;
  // Inset krag is nul geval:
  u = 0;
  // Inset krag is 'n sinusgolf
  //u = sin(0.5*time);
  

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
    
end pendulumEenvoudig;
