function [J, dJ]=jacobian(q, dq, th,dth)
%Input
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx type dof aj]=inputs();

a0=al(1); a1=al(2); a2=al(3); a3=al(4); a4=al(5); a5=al(6);
th0=q(4); th1=th(2);th2=th(3); th3=th(4); th4=th(5); th5=th(6);
dth0=dq(4); dth1=dth(2);dth2=dth(3); dth3=dth(4); dth4=dth(5); dth5=dth(6);
th01=th0+th1; th012=th0+th1+th2; th0123=th0+th1+th2+th3; th04=th0+th4; th045=th0+th4+th5;
dth01=dth0+dth1; dth012=dth0+dth1+dth2; dth0123=dth0+dth1+dth2+dth3; dth04=dth0+dth4; dth045=dth0+dth4+dth5;

%Rotation from inertial to base frame
Q1=[cos(th0) sin(th0)
   -sin(th0) cos(th0)];
% Jacobian J
J1=[0 0 0 0 0 -a0*sin(th0)-a1*sin(th01)-a2*sin(th012)-a3*sin(th0123)+a4*sin(th04)+a5*sin(th045)  -a1*sin(th01)-a2*sin(th012)-a3*sin(th0123) -a2*sin(th012)-a3*sin(th0123)   -a3*sin(th0123)  a4*sin(th04)+a5*sin(th045)  a5*sin(th045)
    0 0 0 0 0  a0*cos(th0)+a1*cos(th01)+a2*cos(th012)+a3*cos(th0123)-a4*cos(th04)-a5*cos(th045)   a1*cos(th01)+a2*cos(th012)+a3*cos(th0123)  a2*cos(th012)+a3*cos(th0123)    a3*cos(th0123) -a4*cos(th04)-a5*cos(th045) -a5*cos(th045)];

J=Q1*J1;

% Derivative of Jacobian dJ

dJ1=[0 0 0 0 0 -a0*cos(th0)*dth0-a1*cos(th01)*dth01-a2*cos(th012)*dth012-a3*cos(th0123)*dth0123+a4*cos(th04)*dth04+a5*cos(th045)*dth045 -a1*cos(th01)*dth01-a2*cos(th012)*dth012-a3*cos(th0123)*dth0123 -a2*cos(th012)*dth012-a3*cos(th0123)*dth0123  -a3*cos(th0123)*dth0123 a4*cos(th04)*dth04+a5*cos(th045)*dth045 a5*cos(th045)*dth045
     0 0 0 0 0 -a0*sin(th0)*dth0-a1*sin(th01)*dth01-a2*sin(th012)*dth012-a3*sin(th0123)*dth0123+a4*sin(th04)*dth04+a5*sin(th045)*dth045 -a1*sin(th01)*dth01-a2*sin(th012)*dth012-a3*sin(th0123)*dth0123 -a2*sin(th012)*dth012-a3*sin(th0123)*dth0123  -a3*sin(th0123)*dth0123 a4*sin(th04)*dth04+a5*sin(th045)*dth045 a5*sin(th045)*dth045];

dJ=Q1*dJ1;



