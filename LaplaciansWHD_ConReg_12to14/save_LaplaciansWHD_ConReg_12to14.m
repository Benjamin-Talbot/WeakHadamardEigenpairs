addpath(genpath("WeakHadamardEigenpairs"))
addpath(genpath("WeakHadamardEigenpairs/isequaltol.m"))
addpath(genpath("WeakHadamardEigenpairs/npermutek"))
%% 
addpath(genpath("LaplaciansWHD_ConReg_12to14"))
for n = 12:14
    varname = "LaplaciansIntegral_ConReg_" + num2str(n);
    filename = "LaplaciansWHD_ConReg_" + num2str(n) + ...
        "/" + varname + ".mat";
    load(filename)
end
relpath = pwd + "/LaplaciansWHD_ConReg_12to14/";
%% 
LaplaciansIntegral_ConReg_12 = double(LaplaciansIntegral_ConReg_12);
numIntegral_ConReg_12 = size(LaplaciansIntegral_ConReg_12, 3);
idxsWHD_ConReg_12 = [];
eigvecsWHD_ConReg_12 = []; eigvalsWHD_ConReg_12 = [];

for k = 1:numIntegral_ConReg_12
    L = LaplaciansIntegral_ConReg_12(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConReg_12 = [idxsWHD_ConReg_12, k];
        eigvecsWHD_ConReg_12 = cat(3, eigvecsWHD_ConReg_12, V);
        eigvalsWHD_ConReg_12 = cat(3, eigvalsWHD_ConReg_12, D);
    end
end

LaplaciansWHD_ConReg_12 = LaplaciansIntegral_ConReg_12( ...
    :, :, idxsWHD_ConReg_12);
filename = relpath + "LaplaciansWHD_ConReg_12" + ...
    "/LaplaciansWHD_ConReg_12.mat";
save(filename, "LaplaciansWHD_ConReg_12", "eigvecsWHD_ConReg_12", ...
    "eigvalsWHD_ConReg_12")
%% 
LaplaciansIntegral_ConReg_13 = double(LaplaciansIntegral_ConReg_13);
numIntegral_ConReg_13 = size(LaplaciansIntegral_ConReg_13, 3);
idxsWHD_ConReg_13 = [];
eigvecsWHD_ConReg_13 = []; eigvalsWHD_ConReg_13 = [];

for k = 1:numIntegral_ConReg_13
    L = LaplaciansIntegral_ConReg_13(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConReg_13 = [idxsWHD_ConReg_13, k];
        eigvecsWHD_ConReg_13 = cat(3, eigvecsWHD_ConReg_13, V);
        eigvalsWHD_ConReg_13 = cat(3, eigvalsWHD_ConReg_13, D);
    end
end

LaplaciansWHD_ConReg_13 = LaplaciansIntegral_ConReg_13( ...
    :, :, idxsWHD_ConReg_13);
filename = relpath + "LaplaciansWHD_ConReg_13" + ...
    "/LaplaciansWHD_ConReg_13.mat";
save(filename, "LaplaciansWHD_ConReg_13", "eigvecsWHD_ConReg_13", ...
    "eigvalsWHD_ConReg_13")
%% 
LaplaciansIntegral_ConReg_14 = double(LaplaciansIntegral_ConReg_14);
numIntegral_ConReg_14 = size(LaplaciansIntegral_ConReg_14, 3);
idxsWHD_ConReg_14 = [];
eigvecsWHD_ConReg_14 = []; eigvalsWHD_ConReg_14 = [];

for k = 1:numIntegral_ConReg_14-1
    L = LaplaciansIntegral_ConReg_14(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConReg_14 = [idxsWHD_ConReg_14, k];
        eigvecsWHD_ConReg_14 = cat(3, eigvecsWHD_ConReg_14, V);
        eigvalsWHD_ConReg_14 = cat(3, eigvalsWHD_ConReg_14, D);
    end
end

L = LaplaciansIntegral_ConReg_14(:, :, numIntegral_ConReg_14);
[V, D] = EigenpairsByMultiplicity(L);

LaplaciansWHD_ConReg_14 = LaplaciansIntegral_ConReg_14( ...
    :, :, [idxsWHD_ConReg_14, numIntegral_ConReg_14]);
eigvecsWHD_ConReg_14 = cat(3, eigvecsWHD_ConReg_14, V);
eigvalsWHD_ConReg_14 = cat(3, eigvalsWHD_ConReg_14, D);

message = "The entry for K_14 has a non-weak Hadamard set of" + ...
    "eigenvectors due to the computational difficulty of computing" + ...
    "one, but we know that it must be WHD regardless.";
filename = relpath + "LaplaciansWHD_ConReg_14" + ...
    "/LaplaciansWHD_ConReg_14.mat";
save(filename, "LaplaciansWHD_ConReg_14", "eigvecsWHD_ConReg_14", ...
    "eigvalsWHD_ConReg_14", "message")