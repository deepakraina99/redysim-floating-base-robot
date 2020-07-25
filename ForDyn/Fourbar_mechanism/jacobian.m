function [J, dJ]=jacobian(q, dq, th,dth)
%Input
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx type dof aj]=inputs();

a0=al(1); a1=al(2); a2=al(3); a3=al(4);
th0=q(4); th1=th(2);th2=th(3); th3=th(4);
dth0=dq(4); dth1=dth(2);dth2=dth(3); dth3=dth(4);
th01=th0+th1; th012=th0+th1+th2; th03=th0+th3;
dth01=dth0+dth1; dth012=dth0+dth1+dth2; dth03=dth0+dth3;

%Rotaion from inertial to base frame
Q1=[cos(th0) sin(th0)
   -sin(th0) cos(th0)];

% Jacobian J
J1=[0 0 0 0 0 -a0*sin(th0)-a1*sin(th01)-a2*sin(th012)+a3*sin(th03) -a1*sin(th01)-a2*sin(th012) -a2*sin(th012)   a3*sin(th03)
    0 0 0 0 0  a0*cos(th0)+a1*cos(th01)+a2*cos(th012)-a3*cos(th03)  a1*cos(th01)+a2*cos(th012)  a2*cos(th012)  -a3*cos(th03)];

J=Q1*J1;

% Derivative of Jacobian dJ

dJ1=[0 0 0 0 0 -a0*cos(th0)*dth0-a1*cos(th01)*dth01-a2*cos(th012)*dth012+a3*cos(th03)*dth03 -a1*cos(th01)*dth01-a2*cos(th012)*dth012 -a2*cos(th012)*dth012  a3*cos(th03)*dth03
     0 0 0 0 0 -a0*sin(th0)*dth0-a1*sin(th01)*dth01-a2*sin(th012)*dth012+a3*sin(th03)*dth03 -a1*sin(th01)*dth01-a2*sin(th012)*dth012 -a2*sin(th012)*dth012  a3*sin(th03)*dth03];

dJ=Q1*dJ1;



