clear;
% Script: set up for C code generation with models
load("squeezeNetTransferLearn.mat"); 

% configuration
cfg = coder.config('lib');
cfg.TargetLang = 'C++';
cfg.GenCodeOnly = true;

dlcfg = coder.DeepLearningConfig('arm-compute');
dlcfg.ArmArchitecture = 'armv8';
dlcfg.ArmComputeVersion = '20.02.1';
cfg.DeepLearningConfig = dlcfg;

codegen -args {ones(227,227,3,'single')} -config cfg squeezenet_predict -launchreport
