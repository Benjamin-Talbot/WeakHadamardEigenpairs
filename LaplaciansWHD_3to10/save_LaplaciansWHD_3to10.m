addpath(genpath("WeakHadamardEigenpairs"))
addpath(genpath("WeakHadamardEigenpairs/isequaltol.m"))
addpath(genpath("WeakHadamardEigenpairs/npermutek"))
%% 
addpath(genpath("LaplaciansWHD_3to10"))
for n = 3:10
    varname = "LaplaciansIntegral_" + num2str(n);
    filename = "LaplaciansWHD_" + num2str(n) + "/" + varname + ".mat";
    load(filename)
end
relpath = pwd + "/LaplaciansWHD_3to10/";
%% 
LaplaciansIntegral_3 = double(LaplaciansIntegral_3);
numIntegral3 = size(LaplaciansIntegral_3, 3);
idxsWHD_3 = [];
eigvecsWHD_3 = []; eigvalsWHD_3 = [];

for k = 1:numIntegral3
    L = LaplaciansIntegral_3(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_3 = [idxsWHD_3, k];
        eigvecsWHD_3 = cat(3, eigvecsWHD_3, V);
        eigvalsWHD_3 = cat(3, eigvalsWHD_3, D);
    end
end

LaplaciansWHD_3 = LaplaciansIntegral_3(:, :, idxsWHD_3);
filename = relpath + "LaplaciansWHD_3/LaplaciansWHD_3.mat";
save(filename, "LaplaciansWHD_3", "eigvecsWHD_3", "eigvalsWHD_3")
%% 
LaplaciansIntegral_4 = double(LaplaciansIntegral_4);
numIntegral4 = size(LaplaciansIntegral_4, 3);
idxsWHD_4 = [];
eigvecsWHD_4 = []; eigvalsWHD_4 = [];

for k = 1:numIntegral4
    L = LaplaciansIntegral_4(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_4 = [idxsWHD_4, k];
        eigvecsWHD_4 = cat(3, eigvecsWHD_4, V);
        eigvalsWHD_4 = cat(3, eigvalsWHD_4, D);
    end
end

LaplaciansWHD_4 = LaplaciansIntegral_4(:, :, idxsWHD_4);
filename = relpath + "LaplaciansWHD_4/LaplaciansWHD_4.mat";
save(filename, "LaplaciansWHD_4", "eigvecsWHD_4", "eigvalsWHD_4")
%% 
LaplaciansIntegral_5 = double(LaplaciansIntegral_5);
numIntegral5 = size(LaplaciansIntegral_5, 3);
idxsWHD_5 = [];
eigvecsWHD_5 = []; eigvalsWHD_5 = [];

for k = 1:numIntegral5
    L = LaplaciansIntegral_5(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_5 = [idxsWHD_5, k];
        eigvecsWHD_5 = cat(3, eigvecsWHD_5, V);
        eigvalsWHD_5 = cat(3, eigvalsWHD_5, D);
    end
end

LaplaciansWHD_5 = LaplaciansIntegral_5(:, :, idxsWHD_5);
filename = relpath + "LaplaciansWHD_5/LaplaciansWHD_5.mat";
save(filename, "LaplaciansWHD_5", "eigvecsWHD_5", "eigvalsWHD_5")
%% 
LaplaciansIntegral_6 = double(LaplaciansIntegral_6);
numIntegral6 = size(LaplaciansIntegral_6, 3);
idxsWHD_6 = [];
eigvecsWHD_6 = []; eigvalsWHD_6 = [];

for k = 1:numIntegral6
    L = LaplaciansIntegral_6(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_6 = [idxsWHD_6, k];
        eigvecsWHD_6 = cat(3, eigvecsWHD_6, V);
        eigvalsWHD_6 = cat(3, eigvalsWHD_6, D);
    end
end

LaplaciansWHD_6 = LaplaciansIntegral_6(:, :, idxsWHD_6);
filename = relpath + "LaplaciansWHD_6/LaplaciansWHD_6.mat";
save(filename, "LaplaciansWHD_6", "eigvecsWHD_6", "eigvalsWHD_6")
%% 
LaplaciansIntegral_7 = double(LaplaciansIntegral_7);
numIntegral7 = size(LaplaciansIntegral_7, 3);
idxsWHD_7 = [];
eigvecsWHD_7 = []; eigvalsWHD_7 = [];

for k = 1:numIntegral7
    L = LaplaciansIntegral_7(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_7 = [idxsWHD_7, k];
        eigvecsWHD_7 = cat(3, eigvecsWHD_7, V);
        eigvalsWHD_7 = cat(3, eigvalsWHD_7, D);
    end
end

LaplaciansWHD_7 = LaplaciansIntegral_7(:, :, idxsWHD_7);
filename = relpath + "LaplaciansWHD_7/LaplaciansWHD_7.mat";
save(filename, "LaplaciansWHD_7", "eigvecsWHD_7", "eigvalsWHD_7")
%% 
LaplaciansIntegral_8 = double(LaplaciansIntegral_8);
numIntegral8 = size(LaplaciansIntegral_8, 3);
idxsWHD_8 = [];
eigvecsWHD_8 = []; eigvalsWHD_8 = [];

for k = 1:numIntegral8
    L = LaplaciansIntegral_8(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_8 = [idxsWHD_8, k];
        eigvecsWHD_8 = cat(3, eigvecsWHD_8, V);
        eigvalsWHD_8 = cat(3, eigvalsWHD_8, D);
    end
end

LaplaciansWHD_8 = LaplaciansIntegral_8(:, :, idxsWHD_8);
filename = relpath + "LaplaciansWHD_8/LaplaciansWHD_8.mat";
save(filename, "LaplaciansWHD_8", "eigvecsWHD_8", "eigvalsWHD_8")
%% 
LaplaciansIntegral_9 = double(LaplaciansIntegral_9);
numIntegral9 = size(LaplaciansIntegral_9, 3);
idxsWHD_9 = [];
eigvecsWHD_9 = []; eigvalsWHD_9 = [];

for k = 1:numIntegral9
    L = LaplaciansIntegral_9(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_9 = [idxsWHD_9, k];
        eigvecsWHD_9 = cat(3, eigvecsWHD_9, V);
        eigvalsWHD_9 = cat(3, eigvalsWHD_9, D);
    end
end

LaplaciansWHD_9 = LaplaciansIntegral_9(:, :, idxsWHD_9);
filename = relpath + "LaplaciansWHD_9/LaplaciansWHD_9.mat";
save(filename, "LaplaciansWHD_9", "eigvecsWHD_9", "eigvalsWHD_9")
%% 
LaplaciansIntegral_10 = double(LaplaciansIntegral_10);
numIntegral10 = size(LaplaciansIntegral_10, 3);
idxsWHD_10 = [];
eigvecsWHD_10 = []; eigvalsWHD_10 = [];

for k = 1:numIntegral10
    L = LaplaciansIntegral_10(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_10 = [idxsWHD_10, k];
        eigvecsWHD_10 = cat(3, eigvecsWHD_10, V);
        eigvalsWHD_10 = cat(3, eigvalsWHD_10, D);
    end
end

LaplaciansWHD_10 = LaplaciansIntegral_10(:, :, idxsWHD_10);
filename = relpath + "LaplaciansWHD_10/LaplaciansWHD_10.mat";
save(filename, "LaplaciansWHD_10", "eigvecsWHD_10", "eigvalsWHD_10")