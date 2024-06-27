function [basis, hasBasis]  = WeakHadamardBases(X)
    [m, n] = size(X);
    [V, ct] = LinearlyIndependent101s(m);
    idxsDelete = [];
    for k = 1:ct
        if not(isinspan(V(:, k), X))
            idxsDelete = [idxsDelete, k];
            ct = ct - 1;
        end
    end
    
    V(:, idxsDelete) = [];

    if size(V, 2) < n
        basis = NaN;
        hasBasis = false;
    elseif n <= 2 
        basis = V(:, 1:n);
        hasBasis = true;
    else
        idxsAll = 1:ct;
        idxsStartOptions = nchoosek(idxsAll, 2);
        numStart = size(idxsStartOptions, 1);
        
        for j = 1:numStart
            idxsCombo = idxsStartOptions(j, :);
            [idxsBasis, hasBasis] = dfs(ct, n, idxsCombo, V);
            if hasBasis == true
                break
            end
        end

        if hasBasis == true
            basis = V(:, idxsBasis);
        end
    end
    
    function [idxsFinal, quasi] = dfs(ct, n, idxsCombo, X)
        sizeCombo = length(idxsCombo); combo = X(:, idxsCombo);
        if not(isQuasiOrthogonalizable(combo))
            idxsFinal = NaN;
            quasi = false;
            return;
        elseif sizeCombo == n
            idxsFinal = idxsCombo;
            quasi = true;
            return;
        end
        
        last = idxsCombo(end);
        for idxNext = last:ct
            [idxsFinal, quasi] = dfs(ct, n, [idxsCombo, idxNext], X);
            if quasi == true
                return;
            end
        end
    end
end