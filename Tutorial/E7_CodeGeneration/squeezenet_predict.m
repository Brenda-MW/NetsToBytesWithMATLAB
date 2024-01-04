function out = squeezenet_predict(in) 
%#codegen

% A persistent object mynet is used to load the DAG network object.
% At the first call to this function, the persistent object is constructed and
% set up. When the function is called subsequent times, the same object is reused 
% to call predict on inputs, avoiding reconstructing and reloading the
% network object.

persistent mynet;
if isempty(mynet)
       mynet = coder.loadDeepLearningNetwork('squeezenet','squeezenet');
end

out = mynet.predict(in);