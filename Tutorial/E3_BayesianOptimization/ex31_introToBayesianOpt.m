% This example shows how to create a BayesianOptimization object by using bayesopt to minimize cross-validation loss.
% Optimize hyperparameters of a KNN classifier for the ionosphere data, 
% that is, find KNN hyperparameters that minimize the cross-validation loss. 
% Have bayesopt minimize over the following hyperparameters:
% Nearest-neighborhood sizes from 1 to 30
% Distance functions 'chebychev', 'euclidean', and 'minkowski'.
load ionosphere
rng default
num = optimizableVariable('n',[1,30],'Type','integer');
dst = optimizableVariable('dst',{'chebychev','euclidean','minkowski'},'Type','categorical');
c = cvpartition(351,'Kfold',5);
fun = @(x)kfoldLoss(fitcknn(X,Y,'CVPartition',c,'NumNeighbors',x.n,...
    'Distance',char(x.dst),'NSMethod','exhaustive'));
results = bayesopt(fun,[num,dst],'Verbose',0,...
    'AcquisitionFunctionName','expected-improvement-plus')