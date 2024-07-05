% cd ~/git/WeakHadamardEigenpairs
addpath(genpath('isequaltol.m'))

% A = [0 1 0 0;
%      1 0 1 0;
%      0 1 0 0;
%      0 0 0 1];

% [quasi, order] = isQuasiOrthogonalizable(A)
% if quasi
%     A
%     Aorder = A(:, order)

%     isQO = isQuasiOrthogonal(A)
%     isQO2 = isQuasiOrthogonal(Aorder)
% end

v1 = [1; 0; 0; 0];
v2 = [1; 0; 1; 0];
v3 = [0; 1; 1; 0];
v4 = [-1; -1; 0; 0];
v5 = [0; 0; 0; 1];
V = [v1 v2 v3 v4 v5]
n = 5;
k = 4;

A = [v1 v2 v3 v5];
[isQOable, order] = isQuasiOrthogonalizable(A)
if isQOable
    A
    Aorder = A(:, order)
    I4 = eye(4);
    permA = I4(:, order) * A

    isQO = isQuasiOrthogonal(A)
    isQOorder = isQuasiOrthogonal(Aorder)
end


% isQuasiOrthogonalizable([v1 v2 v3 v5])
% isQuasiOld([v1 v2 v3 v5])
% basis = randCheck(V, n, k);

% [isquasi, orank] = isQuasiwithRank([v1 v2 v3 v4])
% [isquasi, orank] = isQuasiwithRank([v1 v2 v3 v5])

% 1 1 0 0
% 0 0 1 0
% 0 1 1 0
% 0 0 0 1