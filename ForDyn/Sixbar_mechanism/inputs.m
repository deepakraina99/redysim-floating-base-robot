function [n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx type dof aj]=inputs()

% 6-bar mechanism
%NO. OF LINKS
n=6;

nq=0;%1 for spatial and 0 for planar

%ENTER DH PARAMETER HERE   
%  dh=[al b alp th];
alp=[0; 0; 0; 0; 0; 0];
a=[0; 0.5; 1; 1; -0.5; 1];
b=[0; 0; 0; 0; 0; 0];
%Parent array bt and corrosponding vectors
bt=[0 1 2 3 1 5];

%Link Length
al=[1; 1; 1; 1; 1; 1];
% al=[1; 4; 9; 1; 7];
% %Distance from origin to link tip in term of link length
alt=[0.5; 1; 1; 1; 1; 1];

% d - VECTOR FORM ORIGIN TO CG 
dx=[  0    al(2)/2  al(3)/2  al(4)/2  al(5)/2  al(6)/2];
dy=[  0       0       0       0           0      0    ];
dz=[  0       0       0       0           0      0    ];

%MASS
m=[500; 10; 10; 10 ; 10; 10];
% g=[0 ; 9.81; 0];
 g=[0 ; 0; 0];

%MOMENT OF INERTIA
Icxx=zeros(n,1);Icyy=zeros(n,1);Iczz=zeros(n,1); % Initialization 
Icxy=zeros(n,1);Icyz=zeros(n,1);Iczx=zeros(n,1); % Initialization 
Icxx(1)=83.61;  Icyy(1)=83.61; Iczz(1)=83.61;
Icxx(2)=0.01;   Icyy(2)=1.05;  Iczz(2)=1.05;
Icxx(3)=0.01;   Icyy(3)=1.05;  Iczz(3)=1.05;
Icxx(4)=0.01;   Icyy(4)=1.05;  Iczz(4)=1.05;
Icxx(5)=0.01;   Icyy(5)=1.05;  Iczz(5)=1.05;
Icxx(6)=0.01;   Icyy(6)=1.05;  Iczz(6)=1.05;

%system type
type=1;%1 for Closed-loop and 0 for open-loop

%Degree of fredom of the system
dof=6; %3+3 for planar and 6+3 for spatial

%Actuated joints of closed tree
aj=[1 0 0 1 1]; %enter 1 for actuated joints and 0 otherwise
