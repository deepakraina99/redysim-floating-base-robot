% ReDySim plot_en module. This module plots total energy for
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function[]=plot_en()
disp('------------------------------------------------------------------');
disp('Plots the Energy balance');

load envar.dat;
load timevar.dat;
EN=envar;T=timevar;

set(0,'DefaultLineLineWidth',1.5)

fh1=figure('Name','Energy Balance','NumberTitle','off');
subplot(2,1,1)
set(fh1, 'color', 'white'); % sets the color to white 
plot(T,EN(:,1),T,EN(:,4));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
% title(' ENERGY BALANCE OF SIMULATION THROUGH LSIM ','FontSize',14);
xlabel('time (s)','FontSize',10);
ylabel('Energy (J)','FontSize',10);
h=legend('Potential','Total');
set(h,'Orientation','horizontal','Color', 'none','Box', 'off','Location','best','fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5)
subplot(2,1,2)
set(fh1, 'color', 'white'); % sets the color to white 
plot(T,EN(:,2),T,EN(:,3));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
% title(' ENERGY BALANCE OF SIMULATION THROUGH LSIM ','FontSize',14);
xlabel('time (s)','FontSize',10);
ylabel('Energy (J)','FontSize',10);
h=legend('Kinetic','Actuator');
set(h,'Orientation','horizontal','Color', 'none','Box', 'off','Location','best','fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5)



% accumulated_error=(sum(TE-TE(1))*100)/TE(1)
% maximum_ele_error=(max(abs(TE-TE(1)))*100)/TE(1)
