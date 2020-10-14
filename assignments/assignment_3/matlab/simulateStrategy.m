function transaction = simulateStrategy(stock)

transaction = struct('buy',[],'sell',[],'days',[],'gain',[],'active',[],'index',[]);

j = 1;
transaction(j).active = false;

for i=1:length(stock.close)
    if ((stock.SlowK(i) < 30) && (~transaction(j).active))
        transaction(j).buy = stock.close(i);
        transaction(j).active = true;
        transaction(j).index = i;
    end
    if (transaction(j).active && ((stock.SlowK(i) > 70) || (((i - transaction(j).index) >= 5) && (stock.SlowK(i) > 30))))
        transaction(j).sell = stock.close(i);
        transaction(j).days = i - transaction(j).index;
        transaction(j).gain = (transaction(j).sell - transaction(j).buy)/transaction(j).buy;
        transaction(j).active = false;
        j = j + 1;
        transaction(j).active = false;
    end
end

if (transaction(j).active)
    transaction(j).sell = stock.close(end);
    transaction(j).days = length(stock.close) - transaction(j).index;
    transaction(j).gain = (transaction(j).sell - transaction(j).buy)/transaction(j).buy;
    transaction(j).active = false;
end

end
