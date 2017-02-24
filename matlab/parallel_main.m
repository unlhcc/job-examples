% This MATALB program ("parallel_main.m") calls for a number of MATLAB workers
% according to that specified in the slurm submit scritp ('--ntasks_per_node').
% Each MATLAB worker is then asked to print to the screen (MATLAB command)
% their assigned for-loop index "i". 

% Retrieve the number of tasks_per_node from the scheduler
number = str2num(getenv('SLURM_TASKS_PER_NODE'));

% create cluster object and point JobStorageLocation to the tmp folder
pc = parcluster('local');
pc.JobStorageLocation = strcat('/tmp/',getenv('SLURM_JOB_ID'));

% 
poolObj = parpool(number);

parfor i=1:poolObj.NumWorkers   
   i
end

delete(gcp('nocreate'));

