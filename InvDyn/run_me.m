% ReDySim main module. Use this module to run your program
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [] = run_me()
%Use this file to run your program
clear all;
fclose all;
clc;
%Run the main code
runinv;
%Plots the joint motion
plot_motion;
%Plots the joint torques
plot_tor;
%Energy Calculation
energy;
%Plots Energy Balance
plot_en;
%Momentum Calculation
momentum;
%Plots Momentum
plot_mtum;
%Animation
animate;

disp('------------------------------------------------------------------');
disp('Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi ');
disp('Thank you for using ReDySim');
disp('------------------------------------------------------------------');

