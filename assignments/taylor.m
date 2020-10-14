clear all;
close all;
clc;

x=linspace(0,2*pi,100);
y=sin(x);

N=14;
a=0;
y_pred = sin_taylor(x,a,N);

%%
figure();
plot(x,y);
hold on;
plot(x,y_pred);

