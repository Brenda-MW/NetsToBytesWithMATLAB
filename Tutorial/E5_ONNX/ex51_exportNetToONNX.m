clear; 
% Script: export network created in earlier exercises to ONNX format

% load saved network to validate the use
load("squeezeNetTransferLearn.mat"); 

net_transferlearn = trainedNetwork; 

exportONNXNetwork(net_transferlearn, "squeezenet1.onnx"); 

% export models from hyperparameter tuned candidates


% export models from compression
% note that quantization information on models would be removed 
% based on the MATLAB Online version

% list all onnx files