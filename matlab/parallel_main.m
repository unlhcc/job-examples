%This MATALB program ("parallel_main.m") calls for a number of MATLAB workers
%according to that specified in the slurm submit scritp ('--ntasks_per_node').
%Each MATLAB worker is then asked to print to the screen (MATLAB command)
%their assigned for-loop index "i". 

number = str2num(getenv('SLURM_NTASKS_PER_NODE'));
poolObj = parpool(number);
parfor i=1:poolObj.NumWorkers   
   i
end
delete(gcp('nocreate'));

