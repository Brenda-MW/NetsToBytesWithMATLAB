clear; 
% Script to transfer learn with a new dataset from a pretrained network
net = squeezenet; 

% use merch dataset
deepNetworkDesigner(net); 

% Set up dataset; 
% Unlock layers and set up for transfer learn

% load saved network to validate the use
load("squeezeNetTransferLearn.mat"); 

net_transferlearn = trainedNetwork; 

% pull out a test data
I = imread("merchTest.jpg");
I = imresize(I, [227 227]); 
[YPred,probs] = classify(net_transferlearn,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");
