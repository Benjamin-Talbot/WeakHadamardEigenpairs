function [V, D, WHD] = WeakHadamardEigenpairs(L)
    WHD = true;
    [V, D, multis] = EigenpairsByMultiplicity(L);
    multisOneIdxs = find(multis == 1);
    multisRepIdxs = find(multis ~= 1);
    numOnes = length(multisOneIdxs);
    numReps = length(multisRepIdxs)

    for j = 1:numOnes
        if not(scalable101(V(:, multisOneIdxs(j))))
            WHD = false;
            basis = NaN;
            break
        end
        V(:, multisOneIdxs(j)) = scale101(V(:, multisOneIdxs(j)));
    end

    if WHD == false
        V = basis;
        return
    end
    
    d = uniquetol(diag(D));
    for i = 1:numReps
        [basis_h, hasBasis_h] = WHEigenbasis(L, d(multisRepIdxs(i)), multis(multisRepIdxs(i)));
        if hasBasis_h == 0
            WHD = false;
            basis = NaN;
            break
        end
        basis = [basis, basis_h];
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
        i = 1;
        firstnz = v(1);
        while isequaltol(firstnz, 0)
            i = i + 1;
            firstnz = v(i);
        end
        scaled = v/firstnz;
    end
end