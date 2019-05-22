function costfee = costfee_get(N, y, r)
%Input:
%   'N' is the number of weeks to be evaluated, 
%   'y' is the fixed order number,
%   'r' is the fixed number to decide whether need to order
%Output:
%   'costfee' is the total cost fee of each week

%Called funtion 'stock'
[stock_end, penalty] = stock(N, y, r);
costfee = zeros(N, 1);

%cost from the first week to second to last week
for i = 1: N - 1
    %was punished by 20 coins/week if short of stock
    if penalty(i, 1) == 1
        costfee(i, 1) = 20;
    %charge 5 coins/unit/week for warehouse cost
    elseif stock_end(i, 1) >= 0
        costfee(i, 1) = stock_end(i, 1) * 5;
    end
end

%cost in the last week
%Return cost: 10 coins/unit at the last week
if stock_end(N, 1) >= 0
    costfee(N, 1) = stock_end(N, 1) * 10;
elseif penalty(N, 1) == 1
    costfee(N, 1) = 20;
end



