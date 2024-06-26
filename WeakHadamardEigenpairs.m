function [V, D, WHD] = WeakHadamardEigenpairs(L)
    WHD = true;
    [V, D, multis] = EigenpairsByMultiplicity(L);

    % Can you change == and ~= to tol ones?
    multisOneIdxs = find(multis == 1);
    multisRepIdxs = find(multis ~= 1);
    numOnes = length(multisOneIdxs);
    numReps = length(multisRepIdxs);

    for i = 1:numOnes
        if not(scalable101(V(:, multisOneIdxs(i))))
            WHD = false;
            V = NaN;
            return
        end
        V(:, multisOneIdxs(i)) = scale101(V(:, multisOneIdxs(i)));
    end
    
    d = uniquetol2(diag(D));
    % basis = V(:, multisOneIdxs);
    for i = 1:numReps
        % check that this works (don't think it does)
        % also, multis is only k-dimensional, not n-dimensional, so indices in multisOneIdxs and multisRepIdxs won't reference correct things
        [V(:, multisRepIdxs(i)), hasBasis_h] = WHEigenbasis(L, d(multisRepIdxs(i)), multis(multisRepIdxs(i)));
        if hasBasis_h == false
            WHD = false;
            V = NaN;
            return
        end
    end

    D = [D(:, multisOneIdxs), D(:, multisRepIdxs)];
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