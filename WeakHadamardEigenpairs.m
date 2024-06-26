function [V, D, WHD] = WeakHadamardEigenpairs(L)
    WHD = true;
    m = size(L, 1);
    [V, D, multis] = EigenpairsByMultiplicity(L);
    d = length(multis);
    if not(any(multis ~= 1))
        for j = 1:d
            if not(scalable101(V(:, j)))
                basis = NaN;
                break
            end
            V(:, j) = scale101(V(:, j));
        end
    else
        k = sum(multis == 1);
        scalable = true;
        for j = 1:k
            if not(scalable101(V(:, j)))
                scalable = false;
                basis = NaN;
                break
            end
            V(:, j) = scale101(V(:, j));
        end
        
        if scalable == true
            idxs = [k; zeros(d-1, 1)];
            slices = {1:k};
            multisNew = [k; multis(multis ~= 1)];
            e = length(multisNew);
            for j = 2:e
                idxs(j) = idxs(j-1) + multisNew(j);
                sliceStart = idxs(j-1) + 1;
                sliceEnd = idxs(j);
                slices(j) = {sliceStart:sliceEnd};
            end
            
            basis = V(:, 1:k);
            for j = 2:e
                slice = cell2mat(slices(j));
                [basis_h, hasBasis_h] = WeakHadamardBases(V(:, slice));
                if hasBasis_h == 0
                    basis = NaN;
                    break
                end
                basis = [basis, basis_h];
            end
        end
        
        V = basis;
        if isnan(V)
            WHD = false;
        end
    end
    
    function scalable = scalable101(v)
        scalable = true;
        nonzeros = v(v ~= 0);
        a = length(nonzeros);
        if a > 1
            magnitude = abs(nonzeros(1));
            for b = 2:a
                if not(isequaltol(abs(nonzeros(b)), magnitude))
                    scalable = false;
                    break
                end
            end
        end
    end
    
    function scaled = scale101(v)
        nonzeros = v(v ~= 0);
        c = nonzeros(1);
        scaled = v/c;
    end
end