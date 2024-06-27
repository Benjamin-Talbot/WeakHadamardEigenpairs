addpath(genpath('isequaltol.m'))

v1 = [1; 0; 0; 0];
v2 = [1; 0; 1; 0];
v3 = [0; 1; 1; 0];
v4 = [-1; -1; 0; 0];
v5 = [0; 0; 0; 1];
V = [v1 v2 v3 v4 v5]
n = 5;
k = 4;
isQuasiOrthogonalizable([v1 v2 v3 v4 v5])
% basis = randCheck(V, n, k);

% 1 1 0 0
% 0 0 1 0
% 0 1 1 0
% 0 0 0 1