function [result] = runner()

% Read data
filename = 'TELIA-2012-01-25-2019-07-02.csv';
stock = readStockData(filename);
result=stock;

% Simulate strategy
transaction = simulateStrategy(stock);

try
    result.buy=[transaction.buy];
    result.sell=[transaction.sell];
    % result.days=[transaction.days];
    result.gain=[transaction.gain];
catch

    result.buy=transaction.buy(1:end-1);
    result.sell=transaction.sell(1:end-1);
    result.gain=transaction.gain(1:end-1);

end