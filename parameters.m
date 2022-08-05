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

% Initial configuration
roll_i = -0.1;   % rad
pitch_i = -0.9;  % rad
yaw_i = -3;      % rad
altitude_i = 0;  % meters

% Desired configuration
roll_d = -0.3;   % rad
pitch_d = 0;     % rad
yaw_d = -pi;     % rad
altitude_d = 5;  % meters

sim("quadrotor_model") % Initialize Simulink 

% Plot the movements
figure('Name', 'Positions', 'NumberTitle','off')
plot3(x, y, z)
xlabel("Position x")
ylabel("Position y")
zlabel("Position z")
title("Positions")
grid on

figure('Name', 'Roll angle', 'NumberTitle','off')
plot(tout, roll, tout, ones(size(tout))*roll_d);
xlabel('Time (s)', 'interpreter', 'latex')
l = legend('$\phi$ Current roll angle', '$\phi_d$ Desired roll angle');
set(l, 'interpreter', 'latex')

figure('Name', 'Pitch angle', 'NumberTitle','off')
plot(tout, pitch, tout, ones(size(tout))*pitch_d);
xlabel('Time (s)', 'interpreter', 'latex')
l = legend('$\theta$ Current pitch angle', '$\theta_d$ Desired pitch angle');
set(l, 'interpreter', 'latex')

figure('Name', 'Yaw angle', 'NumberTitle','off')
plot(tout, yaw, tout, ones(size(tout))*yaw_d);
xlabel('Time (s)', 'interpreter', 'latex')
l = legend('$\psi$ Current yaw angle', '$\psi_d$ Desired yaw angle');
set(l, 'interpreter', 'latex')