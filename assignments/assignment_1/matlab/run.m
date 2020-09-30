clear all;
close all;
clc;

result = matlab_DragsterAssignment();

m=10e6;
v=[result.Velocity];
acc=[result.LongAcc];
F=m.*acc;
P=F.*v;

figure();
plot(v);

figure();
plot(P);
