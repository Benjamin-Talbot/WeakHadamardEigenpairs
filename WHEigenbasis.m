function [basis, hasBasis]  = WHEigenbasis(L, lambda, dim)
    [V, ct] = Eigenvecs101(L, lambda);

    if size(V, 2) < dim
        basis = NaN;
        hasBasis = false;
    elseif dim <= 2
        basis = V(:, 1:dim);
        hasBasis = true;
    else
        idxsAll = 1:ct;
        idxsStartOptions = nchoosek(idxsAll, 2);
        numStart = size(idxsStartOptions, 1);
        
        for j = 1:numStart
            idxsCombo = idxsStartOptions(j, :);
            [idxsBasis, hasBasis] = dfs(ct, dim, idxsCombo, V);
            if hasBasis == true
                break
            end
        end

        if hasBasis == true
            basis = V(:, idxsBasis);
        end
    end
    
    function [idxsFinal, quasi] = dfs(n, k, idxsCombo, X)
        sizeCombo = length(idxsCombo); combo = X(:, idxsCombo);
        if not(isQuasiOrthogonalizable(combo))
            idxsFinal = NaN;
            quasi = false;
            return;
        elseif sizeCombo == k
            idxsFinal = idxsCombo;
            quasi = true;
            return;
        end
        
        last = idxsCombo(end);
        for idxNext = last+1:n
            [idxsFinal, quasi] = dfs(n, k, [idxsCombo, idxNext], X);
            if quasi == true
                return;
            end
        end
    end

    function [V, ct] = Eigenvecs101(L, lambda)
        m = size(L, 2);
        [V, ct] = LinearlyIndependent101s(m);
        idxsDelete = []; max = ct;
        for v = 1:max
            vec = V(:, v);
            if not(isequaltol(L*vec, lambda*vec))
                idxsDelete = [idxsDelete, v];
                ct = ct - 1;
            end
        end
        V(:, idxsDelete) = [];
    end
end