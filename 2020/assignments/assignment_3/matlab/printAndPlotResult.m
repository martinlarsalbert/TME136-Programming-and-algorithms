function printAndPlotResult(stock, transaction)

fprintf(1,' __  __            __ _     _             _  __  \n');
fprintf(1,'|  \\/  |  __ _    / _` |   (_)     __    | |/ /  \n');
fprintf(1,'| |\\/| | / _` |   \\__, |   | |    / _|   | '' <   \n');
fprintf(1,'|_|__|_| \\__,_|   |___/   _|_|_   \\__|_  |_|\\_\\  \n');
fprintf(1,'_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| \n');
fprintf(1,'"`-0-0-''"`-0-0-''"`-0-0-''"`-0-0-''"`-0-0-''"`-0-0-'' \n');

fp = fopen('myResult.txt','w');

for i=[1 fp]
    fprintf(i,'Totalt antal dagar i data: %i\n',length(stock.close));
    fprintf(i,'Antal MagicK-lägen: %i (%.2f%%)\n',length(transaction),100*length(transaction)/length(stock.close));
    fprintf(i,'Genomsnittligt utfall: %.2f%%\n',100*mean([transaction.gain]));
    fprintf(i,'Genomsnittlig träffsäkerhet: %i%%\n',round(100*sum([transaction.gain] > 0)/length(transaction)));
    fprintf(i,'Genomsnittligt antal dagar i affär: %.2f\n',mean([transaction.days]));
end

fclose(fp);

figure(1)
histogram(100*[transaction.gain])
xlabel('resultat [%]')
ylabel('frekvens')
set(gca,'FontSize',14)

X = 29;

figure(2)
subplot(2,1,1)
plot(stock.close(end-X:end),'-k','LineWidth',2)
ylabel('Stängningskurs')
set(gca,'FontSize',14)
subplot(2,1,2)
plot(stock.SlowK(end-X:end),'-b','LineWidth',2)
hold on
plot([1 length(stock.SlowK(end-X:end))],[30 30],':r')
plot([1 length(stock.SlowK(end-X:end))],[70 70],':r')
ylabel('SlowK(2,3)')
axis([0 (X+1) 0 100])
set(gca,'FontSize',14)

end