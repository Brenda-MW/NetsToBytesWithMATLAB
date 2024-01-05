clear; 
% Script to quantize a network using Deep Network Quantizer
net = squeezenet; 

load("squeezeNetTransferLearn.mat"); 

net_transferlearn = trainedNetwork; 

% setup data store
imdsTrain = imageDatastore("../utils/MerchData","IncludeSubfolders",true,"LabelSource","foldernames");
[imdsTrain, imdsValidation] = splitEachLabel(imdsTrain,0.7);

% Resize the images to match the network input layer.
augimdsTrain = augmentedImageDatastore([227 227 3],imdsTrain);
augimdsValidation = augmentedImageDatastore([227 227 3],imdsValidation);

% collect instrumentation data
quantizer = dlquantizer(net_transferlearn); 
calResult = quantizer.calibrate(augimdsTrain); 
% save quantizer here
save("quantizerObj.mat", "quantizer"); 

q_net = quantizer.quantize(); 
validateResults = quantizer.validate(augimdsValidation); 

save("quantizedNet.mat", "q_net"); 

% pull out a test data
I = imread("merchTest.jpg");
I = imresize(I, [227 227]); 
[YPred,probs] = classify(net_transferlearn,I);
imshow(I)
label = YPred;
title(string(label) + ", " + num2str(100*max(probs),3) + "%");

figure
[qYPred,qprobs] = classify(q_net,I);
imshow(I)
label = qYPred;
title(string(label) + newline + "of Quantized Network, " + num2str(100*max(qprobs),3) + "%");
