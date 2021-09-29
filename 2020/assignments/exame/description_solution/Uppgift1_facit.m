%% Uppgift1
%
% Namn:
%
% Tentamensdatum: 2020-10-29
%
% Beskrivning av Uppgift1:
%

%% LÖSNINGSFÖRSLAG

clear all
close all
clc

f = @(x) x.^3 - x.^2./log(2+x);
g = @(x) 2+sin(x/pi);

x = linspace(0,pi);

figure1 = figure;
plot(x,f(x),'-r','LineWidth',2)
hold on
plot(x,g(x),':b','LineWidth',2)
axis([0 pi -1 5])
set(gca,'FontSize',16)

xlabel('x')
ylabel('f(x), g(x)')

h = @(x) f(x) - g(x);
x0 = fzero(h,1);

plot(x0,f(x0),'^k','LineWidth',2,'MarkerSize',20,'MarkerFaceColor','g')

legend('f(x)','g(x)','skärningspunkt','Location','NorthWest')

A = integral(g,0,pi);

title(sprintf('integral av g(x) på intervallet = %.2f',A))

% annotation(figure1,'textarrow',[0.6875 0.560714285714286],[0.272809523809524 0.547619047619048],'String',{'Där!'});
text(2,2,'Här!')
