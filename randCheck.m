% V is the set of all possible -1, 0, 1 eigenvectors, n is the total number of 
% these vectors, and k is the number of vectors we need to form a basis
function basis = randCheck(V, n, k)
    basis = V(:, 1:k);
    otherVs = V(:, k+1:n);
    orank1 = OrthogonalityRank(basis);
    % if quasi-orthogonal, return
    for i = 1:1000000
        idx = randi(k);
        vec = randi(n-k) + k;
        [basis, otherVs] = swap(basis, idx, otherVs, vec);
        orank2 = OrthogonalityRank(basis);
        if orank2 > orank1
            orank1 = orank2;
            % if quasi-orthogonal, return
        else
            [basis, otherVs] = swap(basis, idx, otherVs, vec);
        end
    end

    function [V1, V2] = swap(V1, idx1, V2, idx2)
        temp = V1(:, idx1);
        V1(:, idx1) = V2(:, idx2);
        V2(:, idx2) = temp;
    end
end