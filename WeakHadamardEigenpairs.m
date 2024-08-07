function [V, D, WHD] = WeakHadamardEigenpairs(L)
    WHD = true;
    [V, D, multis] = EigenpairsByMultiplicity(L);
    numEigvals = length(multis);
    if not(any(multis ~= 1))
        for j = 1:numEigvals
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
            d = uniquetol2(diag(D));
            basis = V(:, 1:k);
            for j = k+1:numEigvals
                [basis_h, hasBasis_h] = WHEigenbasis(L, d(j), multis(j));
                if hasBasis_h == 0
                    basis = NaN;
                    break
                end
                basis = [basis, basis_h];
            end
        end
    end

    V = basis;
    if isnan(V)
        WHD = false;
    end
    
    function scalable = scalable101(v)
        scalable = true;
        nonzeros = v(not(ismembertol(v, 0)));
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
        i = 1;
        firstnz = v(1);
        while isequaltol(firstnz, 0)
            i = i + 1;
            firstnz = v(i);
        end
        scaled = v/firstnz;
    end
end