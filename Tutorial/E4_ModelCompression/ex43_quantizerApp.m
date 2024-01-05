clear; 
% Script to open the APP

load("quantizerObj.mat"); 
% load both quantizer 

deepNetworkQuantizer; 

% set up datastore again in preparation of validation calls
imdsTrain = imageDatastore("../utils/MerchData","IncludeSubfolders",true,"LabelSource","foldernames");
[imdsTrain, imdsValidation] = splitEachLabel(imdsTrain,0.7);

% Resize the images to match the network input layer.
augimdsTrain = augmentedImageDatastore([227 227 3],imdsTrain);
augimdsValidation = augmentedImageDatastore([227 227 3],imdsValidation);

