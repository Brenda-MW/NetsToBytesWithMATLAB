clear; 
% script to parse and plot layer results from saved excel file
X = readtable('squeezenet1-execution-time.csv')
bar(X.layer_c_id, X.duration_ms);
