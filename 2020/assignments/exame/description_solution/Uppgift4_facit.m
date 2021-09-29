%% Uppgift4
%
% Namn:
%
% Tentamensdatum: 2020-10-29
%
% Beskrivning av Uppgift4:
%


%% LÖSNINGSFÖRSLAG

clear all
close all
clc

% 2x = z - y
% 2y - z = 18
% x + y = 27

% 2*x + 1*y - 1*z = 0
% 0*x + 2*y - 1*z = 18
% 1*x + 1*y + 0*z = 27

A = [2 1 -1; 0 2 -1; 1 1 0];
b = [0; 18; 27];
x = A\b;

w_sol = fzero(@(w) exp(-w) - 5*w,1);

fprintf('x = %i, y = %i, z = %i, w = %f\n',x(1),x(2),x(3),w_sol);

