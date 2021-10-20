function stock = readStockData(filename)

stockdata = importdata(filename);

% Clean up data
% stockdata(1:2) = [];
stockdata(1) = []

for i=1:length(stockdata)
    tmp = strsplit(stockdata{i},';');
    tmp{5}(regexp(tmp{5},',')) = '.';
    stock.high(i) = str2double(tmp{5}); 
    tmp{6}(regexp(tmp{6},',')) = '.';
    stock.low(i) = str2double(tmp{6});
    tmp{7}(regexp(tmp{7},',')) = '.';
    stock.close(i) = str2double(tmp{7});
    stock.range(i) = (stock.close(i) - stock.low(i))/(stock.high(i) - stock.low(i));
end

stock.high = fliplr(stock.high);
stock.low = fliplr(stock.low);
stock.close = fliplr(stock.close);
stock.range = fliplr(stock.range);

end