%This MATALB program ("parallel_main.m") calls for a number of MATLAB workers
%according to that specified in the slurm submit scritp ('--ntasks_per_node').
%Each MATLAB worker is then asked to print to the screen (MATLAB command)
%their assigned for-loop index "i". 

number = getenv('SLURM_NTASKS_PER_NODE');
matlabpool(number);
parfor i=1:matlabpool('size')   
   i
end
matlabpool close;

