% ReDySim initials module. The initial conditions are entered in this module
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [y0, ti, tf, incr, rtol, atol]=initials()

%Simulation time
ti=0;
tf=20;

%Inverse kinematics for obtaining initial configuration
[n]=inputs();

%7 DOF manipulator
th=[0; pi/2; 0; 0; -pi/2;-pi/2; 0];
dth=zeros(n-1,1);

%Base motions
q=[0; 0; 0; 0; 0; 0];
dq=[0; 0; 0; 0; 0; 0];

% Actuator energy
acten=0;

%Vecotor of all the initial State Variable
y0=[q; th; dq; dth; acten];

%INTERATION TOLERANCES
incr=0.1;
rtol=1e-5;         %relative tolerance in integration 
atol=1e-7;         %absolute tolerances in integration 