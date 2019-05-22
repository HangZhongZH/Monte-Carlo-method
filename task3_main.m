%Task 3 using Way1
clc
clear all

%52 weeks
N = 52;
%number of estimates
M = 500;
Samp = 50;
%range of possible y and r
ymin = 0;
ymax = 6;
rmin = 0;
rmax = 6;

[costfee_average_total, costfee_average, costfee_var, r_optimal, y_optimal] = MC_result1(N, M, Samp, ymin, ymax, rmin, rmax)

%Draw a three-dimensional histogram of cost with respect to y and r under different conditions
task31 = figure('Name', 'the cost fee under different value of y and r');
r = rmin: rmax;
y = ymin: ymax;
bar3(costfee_average_total)
set(gca,'xticklabel',r,'yticklabel',y)
xlabel('r')
ylabel('y')
zlabel('costfee')
saveas(task31, 'task31.png')

%Draw the point of optimal y and r
task32 = figure('Name', 'the value of the optimal y and r');
plot(r_optimal, y_optimal, 'O','color','k')
xlabel('r')
ylabel('y')
saveas(task32, 'task32.png')

costfee_averageSE = costfee_average_total(y_optimal - ymin + 1, r_optimal - rmin + 1)

%the average std among all samples in one estimate 
costfee_varttl = zeros(M, 9);
for i = 1: M
    costfee_varttl(i, 1) = costfee_var(y_optimal - ymin + 1, r_optimal - rmin + 1, i);
end
costfee_var_average = mean(costfee_varttl);
costfee_std_average = sqrt(costfee_var_average)

