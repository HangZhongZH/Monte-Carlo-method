function [stock_end, penalty] = stock(N, y, r)
%Input:
%   'N' is the number of weeks to be evaluated, 
%   'y' is the fixed order number,
%   'r' is the fixed number to decide whether need to order
%Output:
%   'stock_end' is the stock at the end of each week
%   'penalty' is whether this week will be 'Short of Stock Penalty', 1 means
%       wiil be punished, 0 means will not.

%The stock at the begining of each week, including the week before start
stock_initial = zeros(N + 1, 1);
%The stock at the end of each week, including the week before start
stock_end = zeros(N + 1, 1);
%start with 0 initial stock
stock_end(1, 1) = 0;
%Called the function 'demand_weekly'
demand = demand_weekly(N);
penalty = zeros(N, 1);

for i = 2: N + 1
    %to decide whether need to order at the end of last week
    if stock_end(i - 1, 1) <= r
        %the stock at the begining of this week
        stock_initial(i, 1) = stock_end(i - 1, 1) + y;
    elseif stock_end(i - 1, 1) > r
        stock_initial(i, 1) = stock_end(i - 1, 1);
    end
    
    %the stock at the end of this week
    stock_end(i, 1) = stock_initial(i, 1) - demand(i - 1, 1);
    %whether will be punished this week
    if stock_end(i, 1) < 0
        stock_end(i, 1) = 0;
        penalty(i - 1, 1) = 1; 
    end
end

%delete the week before start
stock_end = stock_end(2: N + 1, 1);
end

    
    