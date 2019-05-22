%Way1, for every possible y and r, test M times. The optimal y and r is
%the corresponding value in the minimal average cost fees in M estimates 
function [costfee_average_total, costfee_average, costfee_var, r_optimal, y_optimal] = MC_result1(N, M, Samp, ymin, ymax, rmin, rmax)
% Input:
%     'N' is the number of weeks to be evaluated
%     'M' is the number of estimates
%     'Samp' is the number of samples each estimate contains
%     'ymin' and 'ymax' are the range of possible y
%     'rmin' and 'rmax' are the range of possible r
% Output:
%     'costfee_average_total' is the average cost fees of each possible combination of y and r in M estimates
%     'costfee_average' is the average cost fees of each possible combination of y and r in each estimates
%     'costfee_var' is the variance of cost fees of each possible combination of y and r in each estimates
%     'r_optimal' is the choice of r which corresponds to the minimal average cost
%     'y_optimal' is the choice of y which corresponds to the minimal average cost

costfee_average_total = zeros(ymax - ymin + 1, rmax - rmin + 1);
costfee_average = zeros(ymax - ymin + 1, rmax - rmin + 1, M);
costfee_var = zeros(ymax - ymin + 1, rmax - rmin + 1, M);

%all possible combinations of y and r
for y = ymin: ymax
    for r = rmin: rmax
        %M estimates
        for j = 1: M
            costfee_total_temp = zeros(Samp, 1);
            %Samp samples in each estimate
            for i = 1: Samp
                costfee = costfee_get(N, y, r);
                %the cost of N weeks of one sample when y and r
                costfee_total_temp(i, 1) = sum(costfee);
            end
            %the average and variance of cost fees of each possible combination of y and r in each estimates
            costfee_average(y - ymin + 1, r - rmin + 1, j) = mean(costfee_total_temp);
            costfee_var(y - ymin + 1, r - rmin + 1, j) = var(costfee_total_temp);
        end
        %the average cost fees of each possible combination of y and r in M estimates
        costfee_average_total(y - ymin + 1, r - rmin + 1) = mean(costfee_average(y - ymin + 1, r - rmin + 1, :));
    end
end

%get the y and r corresponds to the minimal average cost
[cost_minimal_y, idx_y] = min(costfee_average_total);
[~, idx_r] = min(cost_minimal_y);
idx_y = idx_y(idx_r);
y_optimal = idx_y - 1;
r_optimal = idx_r - 1;
end
