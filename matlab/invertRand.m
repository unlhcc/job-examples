function t = invertRand(n)

% generate a matrix of random numbers between 0 and 1 of size n x n
n = str2num(n);
H = rand(n,n);

% create cluster object
i=str2num(getenv('SLURM_TASKS_PER_NODE'));
pc = parcluster('local');

% direct storage to tmp folder
pc.JobStorageLocation = strcat('/tmp/',getenv('SLURM_JOB_ID'));

% create parallel pool on cluster
poolObj = parpool(pc,i);
poolSize = poolObj.NumWorkers;

% check for existance of pool
if isempty(gcp('nocreate'))
    error('parallel:demo:poolClosed', ...
        'This demo needs an open MATLAB pool to run.');
end
fprintf('This demo is running on %d PARPOOL workers.\n', poolSize);

% invert matrix H
tic;
H_inv = inv(H);
t = toc;

% remove cluster object
delete(gcp('nocreate'));

% output running time of matrix inversion
fprintf('The parallel matrix inversion executed in %8.8f seconds\n',t);

end
    
