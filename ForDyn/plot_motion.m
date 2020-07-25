% ReDySim plot_motion module. This module plot joint positions and velocities
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function[]=plot_motion()
disp('------------------------------------------------------------------');
disp('Generating plots for joint motions');

[n]=inputs();
m=n-1;
load statevar.dat;
load timevar.dat;
Y=statevar;T=timevar;
clear statevar;
clear timevar;

set(0,'DefaultLineLineWidth',1.5)
fh1=figure('Name','Base Motions','NumberTitle','off');
set(fh1, 'color', 'white'); % sets the color to white 
subplot(2,2,1)
plot(T,Y(:,1:3));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
hl=legend('X_0','Y_0','Z_0');
set(hl,'Orientation','h','Color', 'none','Box', 'off','Location','northoutside','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Base COM (m)','FontSize',10)
% xlim([0 1]) ;
% set(h,'FontSize',10);
subplot(2,2,2)
plot(T,Y(:,4:6));
% axis([0 1 -100 10])
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
hl=legend('\phi_0','\theta_0','\psi_0');
set(hl,'Orientation','h','Color', 'none','Box', 'off','Location','northoutside','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Euler angles (rad)','FontSize',10);
% xlim([0 1]) ;
subplot(2,2,3)
plot(T,Y(:,7+m:9+m));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
hl=legend('$\dot{X_0}$','$\dot{Y_0}$','$\dot{Z_0}$');
set(hl,'interpreter','latex','Orientation','h','Color', 'none','Box', 'off','Location','northoutside','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Rates of Base COM (m/s)','FontSize',10)
% xlim([0 1]) ;
% set(h,'FontSize',10);
subplot(2,2,4)
plot(T,Y(:,10+m:12+m));
% axis([0 1 -100 10])
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
hl=legend('$\dot{\phi_0}$','$\dot{\theta_0}$','$\dot{\psi_0}$');
set(hl,'interpreter','latex','Orientation','h','Color', 'none','Box', 'off','Location','northoutside','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Rates of Euler angles (rad/s)','FontSize',10);

fh2=figure('Name','Joint Motions','NumberTitle','off');
set(fh2, 'color', 'white'); % sets the color to white 
subplot(1,2,1)
plot(T,Y(:,7:m+6));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
l1=legend('\theta_1','\theta_2','\theta_3','\theta_4','\theta_5','\theta_6','\theta_7');
set(l1,'Orientation','h','Location','northoutside','Color', 'none','Box', 'off','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Joint angle (rad)','FontSize',10);
subplot(1,2,2)
plot(T,Y(:,m+13:2*m+12))
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out');
l1=legend('$\dot{\theta_1}$','$\dot{\theta_2}$','$\dot{\theta_3}$','$\dot{\theta_4}$','$\dot{\theta_5}$','$\dot{\theta_6}$','$\dot{\theta_7}$');
set(l1,'interpreter','latex','Orientation','h','Location','northoutside','Color', 'none','Box', 'off','FontAngle','italic','fontsize',10,'fontweight','normal','fontname','times new romans','linewidth',0.5)
xlabel('time(s)','FontSize',10);
ylabel('Rates of joint angle (rad/s)','FontSize',10);
