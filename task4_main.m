%Task 4
clc
clear all

%52 weeks
N = 52;
%choose optimal y and r from task3
%set y = 3, r = 1
y = 3;
r = 1;
%500 Estimates
M = 500;
%Each estimate contains 50 samples
Samp = 500;

%get the variance of the cost under M estimates
costfee_var = zeros((Samp-100)/50, 1);
for i = 100: 50: Samp
    [~, costfee_average,~, ~, ~] = MC_result1(N, M, i, y, y, r, r);
    costfee_average_31 = reshape(costfee_average(1, 1, :), M, 1);
    costfee_var((i-100)/50 + 1, 1) = var(costfee_average_31);
end

task41 = figure();
%plot the variance of the cost under M estimates with respect to the number
%of samples in each estimate
plot(100: 50: Samp, costfee_var)
xlabel('The number of samples in each estumate')
ylabel('Variance of the cost')
saveas(task41, 'task41.png')

