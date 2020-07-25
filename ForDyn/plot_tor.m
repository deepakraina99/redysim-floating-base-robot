% ReDySim plot_tor module. This module plots joint torque
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [] = plot_tor()
disp('------------------------------------------------------------------');
disp('Plots the Input Joint Torques');

load statevar.dat;
load timevar.dat;
Y=statevar;T=timevar;
clear statevar;
clear timevar;
let=length(T);
[y0, ti, tf, incr, rtol, atol]=initials();
[n type alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx]=inputs();
jtor=zeros(let,n-1);
for k =1:let
    q=Y(k,1:6)';
    th=Y(k,6:6+n-1)';
    nqn=6+n;
    dq=Y(k,nqn:nqn+6-1)';
    dth=Y(k,nqn+6-1:2*(n+6-1))';
    t=T(k);
    Tp=tf;
    %Joint Torque
    [tu_q tu_th] = torque(t, n, Tp, q, th, dq, dth);
    tue=[tu_q; tu_th];
    jtor(k,:)=tu_th;
end
fh1=figure('Name','Input joint torques','NumberTitle','off');
set(fh1, 'color', 'white'); % sets the color to white
plot(T,jtor);
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
l1=legend('\tau_1','\tau_2','\tau_3','\tau_4','\tau_5','\tau_6','\tau_7');
set(l1,'Orientation','h','Location','northoutside','Color', 'none','Box', 'off','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Joint torques (N.m)','FontSize',10);
end

