% ReDySim torque module. The control algorithm is entered here
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [tu_q tu_th] = torque(t, n, tf, q, th, dq, dth)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx type dof aj]=inputs();
%Desired Joint trejectory
[th_d dth_d ddth_d]=trajectory(t, n, tf);

% 1: Joint level PD control
tu_q=[0;0;0;0;0;0];
kp=49; kv=14;
if type==0%open-loop systems
tu_th=kp*(th_d(2:n)-th(2:n))+kv*(dth_d(2:n)-dth(2:n));
elseif type==1%closed-loop systems
tu_th=zeros(n-1,1);
for i=1:n-1
    if aj(i)==1
       tu_th(i)=kp*(th_d(i+1)-th(i+1))+kv*(dth_d(i+1)-dth(i+1));
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end