# Monte-Carlo-method

 Introduction:
     There are 7 parts in this project, they are demand_weekly, stock,
       costfee_get, MC_result1, task2_main, task3_main, task4_main
     
     1: 'demand_weekly .m' is a function, used to expreee the probability distribution of
     the demand per week.
 
     2: 'stock.m' is a function, used to calculate the stock at the end
     of each week, and whether will be punished by short of stock in each
     week.
 
     3: 'costfee_get.m' is a function, calculates the total cost fee of each week
 
     4: 'MC_result1.m' is a function, calculates the the average cost fees of each possible 
     combination of y and r in each estimate and total M estimates, and can get the optimal choice of y and r from
     the M estimates. The optimal y and r is the choice of y and r which corresponds to the minimal average cost

     5: 'task2_main.m' is the main program of task2
 
     6: 'task3_main.m' is the main program of task3

     7: 'task4_main.m' is the main program of task4


 Usage:
   1: 'demand_weekly.m': 
       demand = demand_weekly(N)
           Input:
               'N' is the number of weeks
           Output:
               'demand' is the probability distributions of this 'N' weeks
 
 	2: 'stock.m':
       [stock_end, penalty] = stock(N, y, r)
           Input:
               'N' is the number of weeks to be evaluated, 
               'y' is the fixed order number,
               'r' is the fixed number to decide whether need to order
           Output:
               'stock_end' is the stock at the end of each week
               'penalty' is whether this week will be 'Short of Stock Penalty', 1 means wiil be punished, 0 means will not.

   3: 'costfee_get.m':
       costfee = costfee_get(N, y, r)
           Input:
               'N' is the number of weeks to be evaluated, 
               'y' is the fixed order number,
               'r' is the fixed number to decide whether need to order
           Output:
                'costfee' is the total cost fee of each week

	4: 'MC_result1.m':
       [costfee_average_total, costfee_average, r_optimal, y_optimal] = MC_result1(N, M, Samp, ymin, ymax, rmin, rmax)
           Input:
               'N' is the number of weeks to be evaluated
               'M' is the number of estimates
               'Samp' is the number of samples each estimate contains
               'ymin' and 'ymax' are the range of possible y
               'rmin' and 'rmax' are the range of possible r
           Output:
               'costfee_average_total' is the average cost fees of each possible combination of y and r in M estimates
               'costfee_average' is the average cost fees of each possible combination of y and r in each estimates
               'costfee_var' is the variance of cost fees of each possible combination of y and r in each estimates
               'r_optimal' is the choice of r which corresponds to the minimal average cost
               'y_optimal' is the choice of y which corresponds to the minimal average cost

 	5: 'task2_main.m':
       All parameters of functions can be assigned and changed in this program, and  
           you can run the program, and then will get:
               (1): the averages and the variances of the total cost fees in M estimates under conditons of 
                   1 sample and 50 samples in each estimate, 
               (2): the histograms of distribution of the cost fees in M estimates under the two conditions 
           
   6: 'task3_main.m':
       All parameters of functions can be assigned and changed in this program, and you can run the program, and 
           then will get£º 
               (1): optimal y and r
               (2): a three-dimensional histogram of cost with respect to y and r under different conditions
               (3): the plot of point of optimal y and r
               (4): the average std among all samples in one estimate 

   7: 'task4_main.m':
       All parameters of functions can be assigned and changed in this, and you can run the program, and 
           then will get: 
               (1): the variance of the cost under M estimates with respect to the number
                   of samples in each estimate


 Written by Hang Zhong.
