model firstorder "A simple first order differential equation"

// https://mbe.modelica.university/behavior/equations/first_order/

Real x "State variable";

initial equation
der(x) = 0 "Used before simulation to compute initial values";


equation

der(x) = 1 - x "Drives value of x toward 1.0";

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.001));
end firstorder;
