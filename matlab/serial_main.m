%This MATLAB program ("serial_main.m") plots a quadratic function x^2 and computes
%its integral value form N1 to N2. The function plot is saved as a .pdf file.
%The integral is evaluated through calling a customized function file 
%"integration.m", and the result is printed to the screen (MATLAB command window).
%Finally, all the generated variables in the workspaced is saved to a .mat file.

clear;
clc;

N1 = -10;                               %input1
N2 = 10;                                %input2

integral_value = integration(N1,N2)

x = linspace(N1,N2,100);

figure;
plot(x, x.^2,'-k.')
print(gcf,'data_plot.pdf','-dpdf')      %Save the figure as a .pdf file

save('data.mat')                        %Save the workpace data
