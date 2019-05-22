function demand = demand_weekly(N)
%Input:
%   'N' is the number of weeks
%Output:
%   'demand' is the probability distributions of this 'N' weeks

demand = zeros(N, 1);
for i = 1: N
    % p~U(0,1)
    p = rand;
    %The probability distribution of the demand per week
    if p <= 0.04
        demand(i, 1) = 0;
    elseif (0.04 < p) && (p <= 0.14)
        demand(i, 1) = 1;
    elseif (0.14 < p) && (p <= 0.4)
        demand(i, 1) = 2;
    elseif (0.4 < p) && (p <= 0.8)
        demand(i, 1) = 3;
    elseif (0.8 < p) && (p <= 0.96)
        demand(i, 1) = 4;
    elseif (0.96 < p) && (p <= 0.98)
        deamnd(i, 1) = 5;
    elseif (0.98 < p) && (p <=1)
        demand(i, 1) = 6;
    end
end
end

        
