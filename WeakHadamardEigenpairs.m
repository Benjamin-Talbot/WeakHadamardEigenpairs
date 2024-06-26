function [V, D, WHD] = WeakHadamardEigenpairs(L)
    WHD = true;
    [V, D, multis] = EigenpairsByMultiplicity(L);
    oneMultisIdxs = find(isequaltolLogArr(multis, 1));
    repMultisIdxs = find(isnotequaltolLogArr(multis, 1));
    numOnes = length(oneMultisIdxs);
    numReps = length(repMultisIdxs);

    for i = 1:numOnes
        if not(scalable101(V(:, oneMultisIdxs(i))))
            WHD = false;
            V = NaN;
            return
        end
        V(:, oneMultisIdxs(i)) = scale101(V(:, oneMultisIdxs(i)));
    end
    
    d = uniquetol2(diag(D));
    % basis = V(:, oneMultisIdxs);
    for i = 1:numReps
        % check that this works (don't think so)
        [V(:, repMultisIdxs(i)), hasBasis_h] = WHEigenbasis(L, d(repMultisIdxs(i)), multis(repMultisIdxs(i)));
        if hasBasis_h == false
            WHD = false;
            V = NaN;
            return
        end
    end

    D = [D(:, oneMultisIdxs), D(:, repMultisIdxs)];
    %V = basis;
    
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
        idx = 1;
        firstnz = v(1);
        while isequaltol(firstnz, 0)
            idx = idx + 1;
            firstnz = v(idx);
        end
        scaled = v/firstnz;
    end
end