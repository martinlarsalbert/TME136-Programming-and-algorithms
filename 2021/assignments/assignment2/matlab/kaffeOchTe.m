clear all
close all
clc

utskrift = true;
kortis = false;

if kortis
    data = load('kaffeTeKort.txt');
else
    data = load('kaffeTe.txt');
end

year = data(:,1);
kaffe = data(:,2);
te = data(:,3);

figure
yyaxis left
h1a = plot(year,kaffe,'-b','LineWidth',2);
h1b = ylabel('kaffe [kg per person och år]');
h2 = gca;
h2.YColor = [0 0 1];
yyaxis right
h2a = plot(year,te,':r','LineWidth',2);
h2b = ylabel('te [kg per person och år]');
h3 = xlabel('år');
h4 = gca;
h4.FontSize = 14;
h4.XMinorTick = 'on';
h4.YColor = [1 0 0];
h4.XTickLabelRotation = 90;
h5 = title(sprintf('Konsumtion av kaffe och te i Sverige %i - %i',year(1),year(end)));
h5.FontName = 'Times New Roman';

grid on
set(gca,'Color',[255 230 200]/255);

if utskrift
    fprintf('Konsumtion i kg per person och år\n\n')
    fprintf('%-4s  %18s  %18s  %32s %i]\n','År','Kaffe [kg/person]','Te [kg/person]','Ack kaffe [kg/person sedan',year(1));
    fprintf('====================================================================================\n');
    
    for i=1:length(year)
        fprintf('%4i  %18.2f  %18.2f  %18.2f\n',year(i),kaffe(i),te(i),sum(kaffe(1:i)));
    end
    
    fprintf('====================================================================================\n');
end