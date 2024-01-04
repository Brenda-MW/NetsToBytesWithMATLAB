% Script: use pretrained network for prediction, an imae classification
% example
img = imread("peppers.png"); 
net = googlenet; 

inputSizeToNet = net.Layers(1).InputSize;

img = imresize(img,"outputSize", inputSizeToNet(1:2)); 

[outLabel, outprob] = net.classify(img); 

outLabel