%% Uppgift3
%
% Namn:
%
% Tentamensdatum: 2020-10-29
%
% Beskrivning av Uppgift3:
%


%% LÖSNINGSFÖRSLAG

clear all
close all
clc

f = figure;
bild = imread('HonLJ.jpg');
image(bild)
hold on

f.WindowState = 'fullscreen';

g = gca;
x0 = (max(g.XLim) - min(g.XLim))/2;
y0 = (max(g.YLim) - min(g.YLim))/2;
dx = (max(g.XLim) - min(g.XLim))/10;

h = plot(x0,y0,'ok','MarkerSize',18,'MarkerFaceColor','r');
axis([-10 10 -10 10])
axis image off


myMove{1} = 'u';
while ~strcmpi(myMove{1},'q')
    myMove = inputdlg('Riktning: ');
    if strcmpi(myMove{1},'n')        
        if ((h.YData + dx) < max(g.YLim))
            h.YData = h.YData + dx;
        end
    elseif strcmpi(myMove{1},'u')
        if ((h.YData - dx) > min(g.YLim))
            h.YData = h.YData - dx;
        end
    elseif strcmpi(myMove{1},'h')
        if ((h.XData + dx) < max(g.XLim))
            h.XData = h.XData + dx;
        end        
    elseif strcmpi(myMove{1},'v')        
        if ((h.XData - dx) > min(g.XLim))
            h.XData = h.XData - dx;
        end        
    end
end

close all