package Gimbal
  model MotorBrushless
  
  Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}})));
  
  parameter Real Kt = 1; // Motor konstante van borsellose motor [N.m/ampere]
  
  equation
  
  y = Kt*u;

  annotation(
      Icon(graphics = {Ellipse(origin = {0, -1}, extent = {{-54, 53}, {54, -53}}), Ellipse(origin = {0, -1}, extent = {{-42, 43}, {42, -43}}), Line(origin = {-35.0362, 32.9638}, points = {{-34.9638, -32.9638}, {-30.9638, -12.9638}, {-18.9638, 7.03619}, {-2.96381, 21.0362}, {17.0362, 31.0362}, {35.0362, 33.0362}}), Line(origin = {-7, 70}, points = {{-7, 4}, {7, -4}}), Line(origin = {-6, 63}, points = {{-8, -5}, {6, 3}}), Text(origin = {-74, 66}, extent = {{18, 8}, {0, -8}}, textString = "T")}));

  end MotorBrushless;

  model PhysicalPendulum
  
  // Inset draaimoment
  Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(transformation(origin = {-96, 12}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-44, 6}, extent = {{-20, -20}, {20, 20}})));
  // Uitset hoekverplasing
  Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(transformation(origin = {102, 12}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {154, 6}, extent = {{-10, -10}, {10, 10}})));
  
    // Model van youtube.com/watch?v=3jofcOmvWj0
    
    parameter Real M = 20; // Massa van die pendulum [kg]
    parameter Real I = 0.2; // Traagheid van die fisiese pendulum [kg.m^2]
    parameter Real L = 0.001; // Lengte van die swaartepunt van die pendulum tot die rotasiepunt [m]
    parameter Real g = 9.81; // Gravitasieversnelling
    parameter Real mus = 0.06; // Statiese wrywingskoeffisient van laer
    parameter Real mud = 0.05; // Dinamiese wrywingskoeffisient van laer
    parameter Real rlaer = 0.015; // Radius van die laer [m]
    
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
    
    // Uitset in grade
    y = x1*180/3.14159;

  annotation(
      Icon(graphics = {Line(origin = {2.9239, 9.03333}, points = {{29.0761, -67.0333}, {3.0761, -77.0333}, {-12.9239, -69.0333}, {-26.9239, -43.0333}, {-14.9239, -17.0333}, {-20.9239, 12.9667}, {-52.9239, 24.9667}, {-72.9239, 50.9667}, {-66.9239, 76.9667}, {-44.9239, 76.9667}, {-26.9239, 54.9667}, {-6.9239, 36.9667}, {15.0761, 14.9667}, {37.0761, 2.96667}, {73.0761, -49.0333}, {29.0761, -67.0333}}), Line(origin = {-48, 62}, points = {{0, 12}, {0, -12}}), Line(origin = {-48, 62}, points = {{-14, 0}, {14, 0}}), Ellipse(origin = {10, -4}, extent = {{-16, 16}, {16, -16}}), Line(origin = {10, -5}, points = {{0, 17}, {0, -15}}), Line(origin = {16, -4}, points = {{-22, 0}, {10, 0}})}));

  end PhysicalPendulum;
  annotation(
    Icon(graphics = {Rectangle(origin = {0, 26}, extent = {{-40, 36}, {40, -36}}), Line(origin = {22.08, 11.08}, points = {{-78.0814, 24.9186}, {-78.0814, -31.0814}, {33.9186, -31.0814}, {33.9186, 22.9186}}), Line(origin = {0, -36}, points = {{0, 16}, {0, -16}}), Line(origin = {-48, 24}, points = {{-8, 0}, {8, 0}}), Line(origin = {48, 24}, points = {{8, 0}, {-8, 0}})}),
  uses(Modelica(version = "4.1.0")));
end Gimbal;
