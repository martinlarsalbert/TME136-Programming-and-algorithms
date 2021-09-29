function stock = readStockData(filename)

stockdata = importdata(filename);

% Clean up data
stockdata(1:2) = [];

for i=1:length(stockdata)
    tmp = strsplit(stockdata{i},';');
    tmp{5}(regexp(tmp{5},',')) = '.';
    stock.high(i) = str2double(tmp{5}); 
    tmp{6}(regexp(tmp{6},',')) = '.';
    stock.low(i) = str2double(tmp{6});
    tmp{7}(regexp(tmp{7},',')) = '.';
    stock.close(i) = str2double(tmp{7});
end

stock.high = fliplr(stock.high);
stock.low = fliplr(stock.low);
stock.close = fliplr(stock.close);

% K and SlowK
stock.K(1) = 100*(stock.close(1) - min(stock.low(1)))/(max(stock.high(1)) - min(stock.low(1)));
for i=2:length(stock.close)
    stock.K(i) = 100*(stock.close(i) - min(stock.low(i-1:i)))/(max(stock.high(i-1:i)) - min(stock.low(i-1:i)));
end
stock.SlowK(1) = stock.K(1);
stock.SlowK(2) = sum(stock.K(1:2))/2;
for i=3:length(stock.close)
    stock.SlowK(i) = sum(stock.K(i-2:i))/3;
end

end