% ReDySim plot_mtum module. This module plots linear and angular momentum
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function[]=plot_mtum()
disp('------------------------------------------------------------------');
disp('Plotting total linear and angular momentum');

load mtvar.dat;
load timevar.dat;
EN=mtvar;T=timevar;
n=inputs();
fh1=figure('Name','Linear and Angular Momenta','NumberTitle','off');
set(fh1, 'color', 'white'); % sets the color to white
subplot(2,1,1)
plot(T,EN(:,1),T,EN(:,2),T,EN(:,3));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
xlabel('time (s)','FontSize',10);
ylabel('Linear momentum (N.s)','FontSize',10);
h=legend('P_x','P_y','P_z');
set(h,'Orientation','horizontal','Color', 'none','Box', 'off','Location','best','fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5)
subplot(2,1,2)
plot(T,EN(:,4),T,EN(:,5),T,EN(:,6));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
xlabel('time (s)','FontSize',10);
ylabel('Angular momentum (Nm.s)','FontSize',10);
h=legend('L_x','L_y','L_z');
set(h,'Orientation','horizontal','Color', 'none','Box', 'off','Location','best','fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5)
