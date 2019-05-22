%Task 2
clc
clear all

%52 weeks
N = 52;
%choose y and r by intuition
%set y = 3, r = 1
y = 3;
r = 1;

%500 Estimates
M = 500;
%Each estimate contains 50 samples
Samp1 = 1;
Samp2 = 50;

%just need to consider the specified combination of y and r
[~, costfee_average,~, ~, ~] = MC_result1(N, M, Samp1, y, y, r, r);
[~, costfee_average2,~, ~, ~] = MC_result1(N, M, Samp2, y, y, r, r);

%plot the histogram of distribution of the cost fees in M estimates, each
%estimate contains 1 sample
task2_1 = figure('Name', 'Task 2');
costfee_average_31 = reshape(costfee_average(1, 1, :), M, 1);
costfee_mean = mean(costfee_average_31)
costfee_var = var(costfee_average_31)
hist(costfee_average_31)
xlabel('the average cost of 52 weeks(1 sample in each estimate)')
ylabel('the number of estimates')
saveas(task2_1, 'task21.png')

%plot the histogram of distribution of the cost fees in M estimates, each
%estimate contains 50 samples
task2_2 = figure('Name', 'Task 2');
costfee_average2_31 = reshape(costfee_average2(1, 1, :), M, 1);
costfee_mean2 = mean(costfee_average2_31)
costfee_var2 = var(costfee_average2_31)
hist(costfee_average2_31)
xlabel('the average cost of 52 weeks(50 sample in each estimate)')
ylabel('the number of estimates')
saveas(task2_2, 'task22.png')

