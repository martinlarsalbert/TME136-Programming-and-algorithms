function printAndPlotResult(stock, transaction, money)

fprintf(1,' __          __   __   __        ___ ___ ___ \n');
fprintf(1,'|__) | |__/ /  \\ /__` /  ` |__| |__   |   |  \n');
fprintf(1,'|  \\ | |  \\ \\__/ .__/ \\__, |  | |___  |   |  \n');

fp = fopen('myResult.txt','w');

for i=[1 fp]
    fprintf(i,'Totalt antal dagar i data: %i\n',length(stock.close));
    fprintf(i,'Antal rikoschett-lägen: %i (%.2f%%)\n',length(transaction),100*length(transaction)/length(stock.close));
    fprintf(i,'Genomsnittligt utfall: %.2f%%\n',100*mean([transaction.gain]));
    fprintf(i,'Genomsnittlig träffsäkerhet: %i%%\n',round(100*sum([transaction.gain] > 0)/length(transaction)));
    fprintf(i,'Genomsnittligt antal dagar i affär: %.2f\n',mean([transaction.days]));
end

fclose(fp);

figure(1)
hist(100*[transaction.gain])
xlabel('resultat [%]')
ylabel('frekvens')
set(gca,'FontSize',14)

figure(2)
plot([0:length(transaction)],money,'-k','LineWidth',2)
xlabel('trades')
ylabel('kapital')
set(gca,'FontSize',14)

end