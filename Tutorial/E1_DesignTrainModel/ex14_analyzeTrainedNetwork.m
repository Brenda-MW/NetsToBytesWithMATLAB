% Script: analyze a trained network
clear; 
load("handwrittenNet.mat"); 

analyzeNetwork(net); 

estimateNetworkMetrics(net)