% PUNKTLIGHET Plottar punktlighetsstatistik från fil
%
% PUNKTLIGHET är ett script som läser in texttabeller 
% över punktligheten i Sverige respektive Tyskland ur
% textfilerna:
%
%       svenskPunktlighetsStatistik.txt
%    &
%       deutschesPunktlichkeitsStatistik.txt
%
% och plottar överlagrade histogram över dem. 


%% Steg 0: Rensa och stäng samt be om användarinput

clear all
close all
clc

utskrift = input('Vill du ha tabell utskriven i kommandofönstret? (1/0) >> ');
clc


%% Steg 1: Läs in data och ta ut definierande storheter

svenskData = load('svenskPunktlighetsStatistik.txt');
tyskData = load('deutschesPunktlichkeitsStatistik.txt');
antalManader = size(tyskData,1);      %Definiera variabel för antalet månader
startAr = min(tyskData(:,2));         %... vilket år datan börjar vid
slutAr = max(tyskData(:,2));          %... och vilket år den slutar vid.


%% Steg 2: Plotta stapeldiagram

figure
h = bar([tyskData(:,3) svenskData(:,3)],2);
hold on
plot([0 antalManader+1],[98.4 98.4],'k--','LineWidth',2); % Vi får inte glömma inrikestrafik i Schweiz när vi jämför!
h(1).FaceColor = [0 0 1];
h(2).FaceColor = [1 0 0];
h(1).BarWidth = 1.5;
h(2).BarWidth = 1.5;

                                    
%% Steg 3: Ordna axlar (generellt från datafil) och titel mm

axis([0 antalManader+1 0 100])
V = cell(antalManader,1);               %Fördefiniera en cellmatris som sedan
for a = 1:antalManader                  %används här för att ange månad med  
    V{a} = sprintf('%02i', tyskData(a,1));%nolla i XTickLabel nedan.
end
xticks(1:antalManader)
xticklabels(V)

for a = startAr:slutAr                  %Skriv på passande ställen ut år.
    aretsStart = find(tyskData(:,2)==a, 1, 'first');
    aretsSlut = find(tyskData(:,2)==a, 1, 'last');
    text(mean([aretsStart,aretsSlut]), -8, sprintf('%4i', a));
end

ylabel('punktlighet i %')
legend('Tyskland', 'Sverige', 'Schweiz', 'Location', 'SouthEast')
title('Jämförelse av punktlighet i tågtrafiken mellan Sverige och Tyskland')


%% Steg 4: Skriv ut data i kommandofönstret

if (utskrift==1)
    fprintf('\n\n\n')
    fprintf('Data över tågs punktlighet mellan %4i%2s och %4i%2s\n\n', startAr, V{1}, slutAr, V{end})
    fprintf('               Procent punktliga passagerartåg\n')
    fprintf('År    Månad        Sverige      Tyskland\n')
    fprintf('----------------------------------------------\n')
    for a = 1:antalManader
        fprintf('%4i  %2s            %3.1f%%        %3.1f%%\n', tyskData(a,2), V{a}, svenskData(a,3), tyskData(a,3));
    end
    fprintf('\n\n\n')
end