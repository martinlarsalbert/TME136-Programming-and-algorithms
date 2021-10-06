function [transaction, money] = simulateStrategy(stock)

Nt = sum((stock.range(1:end-5) <= 0.1));

transaction(Nt) = struct('buy',[],'sell',[],'days',[]);
[~,ids] = sort((stock.range(1:end-5) <= 0.1),'descend');

money = zeros(1,length(transaction)+1);
money(1) = 100;

for i=1:length(transaction)
    transaction(i).buy = stock.close(ids(i));
    
    if ((ids(i)+5) <= length(stock.close))
        % there is data to check 5 days ahead
        for k=1:5
            if ((stock.close(ids(i)+k) > transaction(i).buy) || (k == 5))
                transaction(i).sell = stock.close(ids(i)+k);
                transaction(i).days = k;
                transaction(i).gain = (transaction(i).sell - transaction(i).buy)/transaction(i).buy;
                money(i+1) = money(i)*(1 + transaction(i).gain);
                break;
            end
        end
    else
        % there is not enough data to check this transaction
    end
end

end