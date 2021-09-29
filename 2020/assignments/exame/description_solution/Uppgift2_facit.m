%% Uppgift2
%
% Namn:
%
% Tentamensdatum: 2020-10-29
%
% Beskrivning av Uppgift2:
%

%% LÖSNINGSFÖRSLAG

clear all
close all
clc

data = importdata('bagdata.txt');

[~,ind] = sort(data.data,'ascend');

viewers = randi(12,1,length(ind))-1+3;

fprintf('%-40s %8s %-10s\n','VÄSKA','PRIS','BESÖKARE');

for i=1:length(ind)    
    fprintf('%-40s %8.2f %3i\n',data.textdata{ind(i)},data.data(ind(i)),viewers(ind(i)));
end

fprintf('Totalt antal besökare: %i\n',sum(viewers));
fprintf('Total möjlig försäljning: %.2f kr\n',sum(viewers.*data.data'));
