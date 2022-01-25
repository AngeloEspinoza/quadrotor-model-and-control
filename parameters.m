clc, clear, close all;

% Constants
g = 9.81; 
m = 0.468;
k = 2.980e-6; % Thrust factor of rotor (depends on density
              % geometry, etc)
           % to the centre of gravity           
l = 0.225; % Linear distance from the centre of the rotor
b = 1.140e-7; % Drag constant
Im = 3.357e-5; % Inertia moment of the rotor

% Inertia 
I_xx = 4.856e-3; % kg*m^2
I_yy = 4.856e-3; % kg*m^2
I_zz = 8.801e-3; % kg*m^2

sim("quadrotor_model") % Initialize Simulink 

% Plot the movements
plot3(x, y, z)
xlabel("Position x")
ylabel("Position y")
zlabel("Position z")
title("Positions")

grid on