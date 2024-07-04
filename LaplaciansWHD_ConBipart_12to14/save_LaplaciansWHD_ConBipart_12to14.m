addpath(genpath("WeakHadamardEigenpairs"))
addpath(genpath("WeakHadamardEigenpairs/isequaltol.m"))
addpath(genpath("WeakHadamardEigenpairs/npermutek"))
%% 
addpath(genpath("LaplaciansWHD_ConBipart_12to14"))
for n = 12:14
    varname = "LaplaciansIntegral_ConBipart_" + num2str(n);
    filename = "LaplaciansWHD_ConBipart_" + num2str(n) + ...
        "/" + varname + ".mat";
    load(filename)
end
relpath = pwd + "/LaplaciansWHD_ConBipart_12to14/";
%% 
LaplaciansIntegral_ConBipart_12 = double(LaplaciansIntegral_ConBipart_12);
numIntegral_ConBipart_12 = size(LaplaciansIntegral_ConBipart_12, 3);
idxsWHD_ConBipart_12 = [];
eigvecsWHD_ConBipart_12 = []; eigvalsWHD_ConBipart_12 = [];

for k = 1:numIntegral_ConBipart_12
    L = LaplaciansIntegral_ConBipart_12(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConBipart_12 = [idxsWHD_ConBipart_12, k];
        eigvecsWHD_ConBipart_12 = cat(3, eigvecsWHD_ConBipart_12, V);
        eigvalsWHD_ConBipart_12 = cat(3, eigvalsWHD_ConBipart_12, D);
    end
end

LaplaciansWHD_ConBipart_12 = LaplaciansIntegral_ConBipart_12( ...
    :, :, idxsWHD_ConBipart_12);
filename = relpath + "LaplaciansWHD_ConBipart_12" + ...
    "/LaplaciansWHD_ConBipart_12.mat";
save(filename, "LaplaciansWHD_ConBipart_12", "eigvecsWHD_ConBipart_12", ...
    "eigvalsWHD_ConBipart_12")
%% 
LaplaciansIntegral_ConBipart_13 = double(LaplaciansIntegral_ConBipart_13);
numIntegral_ConBipart_13 = size(LaplaciansIntegral_ConBipart_13, 3);
idxsWHD_ConBipart_13 = [];
eigvecsWHD_ConBipart_13 = []; eigvalsWHD_ConBipart_13 = [];

for k = 1:numIntegral_ConBipart_13
    L = LaplaciansIntegral_ConBipart_13(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConBipart_13 = [idxsWHD_ConBipart_13, k];
        eigvecsWHD_ConBipart_13 = cat(3, eigvecsWHD_ConBipart_13, V);
        eigvalsWHD_ConBipart_13 = cat(3, eigvalsWHD_ConBipart_13, D);
    end
end

LaplaciansWHD_ConBipart_13 = LaplaciansIntegral_ConBipart_13( ...
    :, :, idxsWHD_ConBipart_13);
filename = relpath + "LaplaciansWHD_ConBipart_13" + ...
    "/LaplaciansWHD_ConBipart_13.mat";
save(filename, "LaplaciansWHD_ConBipart_13", "eigvecsWHD_ConBipart_13", ...
    "eigvalsWHD_ConBipart_13")
%% 
LaplaciansIntegral_ConBipart_14 = double(LaplaciansIntegral_ConBipart_14);
numIntegral_ConBipart_14 = size(LaplaciansIntegral_ConBipart_14, 3);
idxsWHD_ConBipart_14 = [];
eigvecsWHD_ConBipart_14 = []; eigvalsWHD_ConBipart_14 = [];

for k = 1:numIntegral_ConBipart_14
    L = LaplaciansIntegral_ConBipart_14(:, :, k);
    [V, D, WHD] = WeakHadamardEigenpairs(L);
    if WHD
        idxsWHD_ConBipart_14 = [idxsWHD_ConBipart_14, k];
        eigvecsWHD_ConBipart_14 = cat(3, eigvecsWHD_ConBipart_14, V);
        eigvalsWHD_ConBipart_14 = cat(3, eigvalsWHD_ConBipart_14, D);
    end
end

LaplaciansWHD_ConBipart_14 = LaplaciansIntegral_ConBipart_14( ...
    :, :, idxsWHD_ConBipart_14);
filename = relpath + "LaplaciansWHD_ConBipart_14" + ...
    "/LaplaciansWHD_ConBipart_14.mat";
save(filename, "LaplaciansWHD_ConBipart_14", "eigvecsWHD_ConBipart_14", ...
    "eigvalsWHD_ConBipart_14")