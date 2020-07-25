% ReDySim sys_ode. This module contains ODE of system under study
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function dy=sys_ode(t,y, tf)

%Model parameter
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx]=inputs();

q=y(1:6);
dq=y(6+1:2*6);
disp(t);

% Trajectories
[th_d dth_d ddth_d ]=trajectory(t, n, tf);

% % C+Tug- TERM USING INVERSE DYNAMIC ALGORITHM
th=[0;th_d];
dth=[0;dth_d];
ddth=[0;ddth_d];
[tu_th ddq] = invdyn_float(q, dq, th, dth,ddth, n,alp,a,b,bt,dx,dy,dz,al,alt, m,g,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx);

%Accelerations
dy=zeros(2*6+1,1);
dy(1:6)=dq;
dy(6+1:2*6)=ddq;

% deriv of joint energy
dy(2*6+1)=-tu_th'*dth(2:n);
%%%%%%%%%%%%%%%%%%% hopon.m ends %%%%%%%%%%%%%%%%%%%%
