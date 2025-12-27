model pendulumBeheer
  // Model van youtube.com/watch?v=3jofcOmvWj0
  
  parameter Real M = 20; // Massa van die pendulum [kg]
  parameter Real I = 0.2; // Traagheid van die fisiese pendulum [kg.m^2]
  parameter Real L = 0.001; // Lengte van die swaartepunt van die pendulum tot die rotasiepunt [m]
  parameter Real g = 9.81; // Gravitasieversnelling
  parameter Real mus = 0.06; // Statiese wrywingskoeffisient van laer
  parameter Real mud = 0.05; // Dinamiese wrywingskoeffisient van laer
  parameter Real rlaer = 0.015; // Radius van die laer [m]
  
  Real u; // Inset draaimoment
  Real y; // Uitset hoekverplasing
  Real x1(start = 0); // Pendulum hoekverplasing
  Real x2(start = 0); // Pendulum hoeksnelheid
  
  Real Tw; // Wrywing draaimoment
  Real Dryf; // Andrywingsdraaimoment
  Real mu; // Wrywingskoeffisient van laer


equation
  if x2 > 0.1 then
    mu = mud;
  else
    mu = mus;
  end if;
  
  Tw = sign(x2)*mu*M*g*rlaer;
  Dryf = u - M*g*L*cos(x1);
  
  if abs(Dryf) > abs(Tw) then
    der(x2) = (u - Tw - M*g*L*cos(x1))/I;
  else
    der(x2) = 0;
  end if;
  
  der(x1) = x2;
  
  y = x1*180/3.14159;
  
  // Inset krag is nul geval:
  u = 0;
  
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001),
    uses(Modelica(version = "4.1.0")));

end pendulumBeheer;
