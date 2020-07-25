function [y0, t_initial, t_final, incr, rtol, atol]=initials()

%Simulation time
t_initial=0;
t_final=20;

%Inverse kinematics for obtaining initial configuration
[n]=inputs();

%7 Link system
th=[0.3803;   -0.6198;    1.2867;    2.4411;    1.7062;   -1.0058];%60
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