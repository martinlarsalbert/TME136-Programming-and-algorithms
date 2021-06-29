%% Uppgift5
%
% Namn:
%
% Tentamensdatum: 2020-10-29
%
% Beskrivning av Uppgift5:
%

%% LÖSNINGSFÖRSLAG

clear all
close all
clc

myVector = randi(10,1,5);

patternFound = find132Pattern(myVector);

disp('Vektor:')
disp(myVector)
disp('132-mönster hittat:')
if patternFound
    disp('Ja')
else
    disp('Nej')
end