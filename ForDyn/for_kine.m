% ReDySim forward kinematics module. This module perform forward kinematics of the system under study
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [tt vc  scf vcf sof stf sbf vtf ttf]=for_kine(q,th, dq, dth, n, alp, a, b, bt, dx, dy, dz, al, alt)
% FORWARD RECURSION _FINDING TWIST AND TWIST RATE
%Initialization
e=[0;0;1];
% z31=[0;0;0];
tt=zeros(3,n);
% tb=zeros(3,n);
so=zeros(3,n);
sc=zeros(3,n);
st=zeros(3,n);
Oi=zeros(3,n);
vo=zeros(3,n);
tb=zeros(3,n);
vc=zeros(3,n);
vt=zeros(3,n);
sof=zeros(3,n);
scf=zeros(3,n);
stf=zeros(3,n);
ttf=zeros(3,n);
vof=zeros(3,n);
vcf=zeros(3,n);
vtf=zeros(3,n);
Q=zeros(3,3,n);

phi1=q(4);th1=q(5);si1=q(6);
% dphi1=dq(4);
% dth1=dq(5);dsi1=dq(6);
Q1=[cos(phi1)*cos(si1)-sin(phi1)*sin(th1)*sin(si1)   -sin(phi1)*cos(th1)     cos(phi1)*sin(si1)+sin(phi1)*sin(th1)*cos(si1)
    sin(phi1)*cos(si1)+cos(phi1)*sin(th1)*sin(si1)    cos(phi1)*cos(th1)     sin(phi1)*sin(si1)-cos(phi1)*sin(th1)*cos(si1)
    -cos(th1)*sin(si1)              sin(th1)                                  cos(th1)*cos(si1)                         ];
QL1=[-sin(si1)*cos(th1)   cos(si1)  0
    sin(th1)            0         1
    cos(si1)*cos(th1)   sin(si1)  0    ];


%Positoins
di=[dx(1);dy(1);dz(1)];
Oi(:,1)=Q1'*[q(1);q(2);q(3)];
aoi=[alt(1)-al(1);0;0];
ati=[alt(1);0;0];
sc(:,1)=Oi(:,1)+di;
so(:,1)=Oi(:,1);
st(:,1)=Oi(:,1)+ati;

%Corner points on the planar base
ab1=[alt(1); alt(1); alt(1)];
ab2=[alt(1); -alt(1); alt(1)];
ab3=[-alt(1); -alt(1); alt(1)];
ab4=[-alt(1); alt(1); alt(1)];
ab5=[-alt(1); alt(1); -alt(1)];
ab6=[-alt(1); -alt(1); -alt(1)];
ab7=[alt(1); -alt(1); -alt(1)];
ab8=[alt(1); alt(1); -alt(1)];



s1=sc(:,1)+ab1;
s2=sc(:,1)+ab2;
s3=sc(:,1)+ab3;
s4=sc(:,1)+ab4;
s5=sc(:,1)+ab5;
s6=sc(:,1)+ab6;
s7=sc(:,1)+ab7;
s8=sc(:,1)+ab8;

%Velocities
dth1=dq(4:6);
v1=dq(1:3);
tt(:,1)=QL1*dth1;
tti=tt(:,1);
tb(:,1)=Q1'*v1;

ttixdi=[tti(2)*di(3)-di(2)*tti(3);-(tti(1)*di(3)-di(1)*tti(3));tti(1)*di(2)-di(1)*tti(2)];
ttixaoi=[tti(2)*aoi(3)-aoi(2)*tti(3);-(tti(1)*aoi(3)-aoi(1)*tti(3));tti(1)*aoi(2)-aoi(1)*tti(2)];
ttixati=[tti(2)*ati(3)-ati(2)*tti(3);-(tti(1)*ati(3)-ati(1)*tti(3));tti(1)*ati(2)-ati(1)*tti(2)];
vc(:,1)=tb(:,1)+ttixdi;
vo(:,1)=tb(:,1)+ttixaoi;
vt(:,1)=tb(:,1)+ttixati;

% Foot ground interaction
Q(:,:,1)=Q1;
scf(:,1)=Q(:,:,1)*sc(:,1);
stf(:,1)=Q(:,:,1)*st(:,1);
sof(:,1)=Q(:,:,1)*so(:,1);
s1f=Q(:,:,1)*s1;
s2f=Q(:,:,1)*s2;
s3f=Q(:,:,1)*s3;
s4f=Q(:,:,1)*s4;
s5f=Q(:,:,1)*s5;
s6f=Q(:,:,1)*s6;
s7f=Q(:,:,1)*s7;
s8f=Q(:,:,1)*s8;

sbf=[s1f s2f s3f s4f s5f s6f s7f s8f];

ttf(:,1)=Q(:,:,1)*tt(:,1);
vcf(:,1)=Q(:,:,1)*vc(:,1);
vof(:,1)=Q(:,:,1)*vo(:,1);
vtf(:,1)=Q(:,:,1)*vt(:,1);

% FOR LOOP STARTS
for i=2:n
    Qi=[cos(th(i))              -sin(th(i))              0
        cos(alp(i))*sin(th(i))   cos(alp(i))*cos(th(i)) -sin(alp(i))
        sin(alp(i))*sin(th(i))   sin(alp(i))*cos(th(i))  cos(alp(i))];
    %position vector from origin of link to origin of next link
    aim=[a(i)
        - b(i)*sin(alp(i))
        b(i)*cos(alp(i))];
    di=[dx(i);dy(i);dz(i)];
    
    %w angular velocity
    ttbi=tt(:,bt(i));
    tt(:,i)=Qi'*ttbi+e*dth(i);
    tti=tt(:,i);
    
    %v  linear velocity
    ttbixaim=[ttbi(2)*aim(3)-aim(2)*ttbi(3);-(ttbi(1)*aim(3)-aim(1)*ttbi(3));ttbi(1)*aim(2)-aim(1)*ttbi(2)];
    tb(:,i)=Qi'*(tb(:,bt(i))+ttbixaim);
    
    %Positin vectors
    Oi(:,i)=Qi'*(Oi(:,bt(i))+aim);
    sc(:,i)=Oi(:,i)+di;
    aoi=[alt(i)-al(i);0;0];
    ati=[alt(i);0;0];
    so(:,i)=Oi(:,i)+aoi;
    st(:,i)=Oi(:,i)+ati;
    
    % Velocities in body fixed frame frame
    ttixdi=[tti(2)*di(3)-di(2)*tti(3);-(tti(1)*di(3)-di(1)*tti(3));tti(1)*di(2)-di(1)*tti(2)];
    ttixaoi=[tti(2)*aoi(3)-aoi(2)*tti(3);-(tti(1)*aoi(3)-aoi(1)*tti(3));tti(1)*aoi(2)-aoi(1)*tti(2)];
    ttixati=[tti(2)*ati(3)-ati(2)*tti(3);-(tti(1)*ati(3)-ati(1)*tti(3));tti(1)*ati(2)-ati(1)*tti(2)];
    vc(:,i)=tb(:,i)+ttixdi;
    vo(:,i)=tb(:,i)+ttixaoi;
    vt(:,i)=tb(:,i)+ttixati;
    
    % Velocities in inertial frame
    Q(:,:,i)=Q(:,:,bt(i))*Qi;
    
    stf(:,i)=Q(:,:,i)*st(:,i);
    stf(:,i)=Q(:,:,i)*st(:,i);
    scf(:,i)=Q(:,:,i)*sc(:,i);
    sof(:,i)=Q(:,:,i)*so(:,i);
    ttf(:,i)=Q(:,:,i)*tt(:,i);
    vof(:,i)=Q(:,:,i)*vo(:,i);
    vcf(:,i)=Q(:,:,i)*vc(:,i);
    vtf(:,i)=Q(:,:,i)*vt(:,i);
    
end