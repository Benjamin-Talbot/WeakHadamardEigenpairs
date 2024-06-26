function [Perms, numPerms] = LinearlyIndependent101s(n)
    w = [-1 0 1]; numPerms = (3^n - 1)/2;
    Perms = zeros(n, numPerms); colStart = 1;
    for k = 1:n
        numPerms_k = 3^(k - 1);
        rowStart = n - k + 1; colEnd = colStart + numPerms_k - 1;
        Perms(rowStart, colStart:colEnd) = ones(1, numPerms_k);
        Perms_k = transpose(npermutek(w, k-1));
        Perms(rowStart+1:end, colStart:colEnd) = Perms_k;
        colStart = colEnd + 1;
    end
end