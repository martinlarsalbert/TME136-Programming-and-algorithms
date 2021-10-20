function [transaction, money] = simulateStrategy(stock)

time = 1:length(stock.close);  % Index för att hålla koll på dagar

mask = stock.range <=0.1;  % detta ger en vector där värdet är 1 när det är läge att köpa
                           % Ex: mask = [0, 0, 1, 0,...] betyder att den 3:e
                           % dagen bör vi köpa.
                           
mask(end-4:end) = [0,0,0,0,0]; % Vi köper inget de sista 5 dagarna så vi sätter 0 på dessa.

% Det fina med att ha en sådan vektor som mask är att man kan använda den
% som index, där vi endast väljer värden där mask är 1:
% Ex: 
% mask = [0,1,1]
% a = [4,6,7]
% b = a[mask]
% --> b är [6,7] (Du kan prova detta exempel själv i Command Window)

% Vi använder mask för att välja close price och tidpunkter för våra köp:
buy_prices = stock.close(mask);
buy_times = time(mask);

% Så här kan vi göra en vektor med structs som vi sedan ska fylla (va
% kanske detta du funderade på).
transaction(length(buy_prices)) = struct('buy',[],'sell',[],'days',[]);

% Nu loopar vi igenom våra köp och bestämmer när vi ska sälja:
for i=1:length(buy_prices)
    
    buy_time = buy_times(i);
    transaction(i).buy = buy_prices(i);
    mask = stock.close(buy_time+1:buy_time+4) > transaction(i).buy;
    if sum(mask) > 0
        days = find(mask, 1, 'first');
    else
        days = 5;
    end;
    
    index = buy_time + days;
    transaction(i).sell = stock.close(index);
    transaction(i).days = days;
        
    
end;

a = 1;
