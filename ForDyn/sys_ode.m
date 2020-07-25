% ReDySim sys_ode. This module contains ODE of system under study
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function dy=sys_ode(t,y,Tp)
%Input data
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx type dof aj]=inputs();
q=y(1:6);
th=y(6:6+n-1);
nqn=6+n;
dq=y(nqn:nqn+6-1);
dth=y(nqn+6-1:2*(n+6-1));
disp(t);

%Joint Torque
[tu_q,tu_th] = torque(t, n, Tp, q, th, dq, dth);
tue= [tu_q;tu_th];
% Differential equation
%Method 2:Indirect method
ddth=zeros(n,1);
[tor, ddq, phib, phim] = invdyn_float_vom (q, dq, th, dth,ddth, n,alp,a,b,bt,dx,dy,dz,al,alt, m,g,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx);
phi_b=tu_q-phib;
phi_m=tu_th-phim;
phi=[phi_b; phi_m];

% type=1;
% Caculation of the acceleration
 if type == 1 %closed-loop systems
    [Ib,Im,Ibm] = GIM_float_vom(q,th,n,alp,a,b,bt,dx,dy,dz,m,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx);
    I=[Ib Ibm';Ibm Im];
    [J, dJ]=jacobian(q, dq, th,dth);
    dthh=[dq; dth(2:n)];
    Jt=transpose(J);
%     IJ=I\Jt;
    IJ=pinv(I)*Jt;
    lamphi=(dJ*dthh+J*(inv(I))*phi);
    lamI=J*IJ;
    lam=-pinv(lamI)*lamphi;
    phi=phi+J'*lam;
    phi_b=phi(1:6);
    phi_m=phi(7:6+n-1);
elseif type == 0 %open-loop systems
    phi_b=phi(1:6);
    phi_m=phi(7:6+n-1);
else
    error('Enter correct type of system type, i.e,. 0 for oper-loop and 1 for closed-loop')
end
[ddy]=ddth_float_vom(q, th,n,alp,a,b,bt,dx, dy, dz,m,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx,phi_b,phi_m);
dy=zeros(2*(n+6-1)+1,1);
dy(1:n+6-1)=y(n+6:2*(n+6-1));
dy(n+6:2*(n+6-1))=ddy;

% deriv of joint energy
dy(2*(n+6-1)+1)=-tue'*dy(1:n+6-1);
%%%%%%%%%%%%%%%%%%% hopon.m ends %%%%%%%%%%%%%%%%%%%%