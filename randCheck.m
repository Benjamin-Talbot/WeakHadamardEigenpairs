% V is the set of all possible -1, 0, 1 eigenvectors, n is the total number of 
% these vectors, and k is the number of vectors we need to form a basis

% add a reset feature where if doesn't find better ortho rank after so many tries it shuffles vectors
% also add if x many resets have happened, exit the function
% these numbers could be based on the size of the problem
function basis = randCheck(V, n, k)
    % Start with basis as the first k vectors of V
    % otherVs is the rest of the vectors in V
    basis = V(:, 1:k);
    otherVs = V(:, k+1:n);
    basisLen = size(basis, 2);
    otherVsLen = size(otherVs, 2);
    
    [isquasi, orank1] = isQuasiwithRank(basis)
    if isquasi == false
        % Keep swapping random vectors from basis with random vectors from 
        % otherVs until the basis is quasi-orthogonalizable
        while isquasi == false
        % for i = 1:10
            idx = randi(basisLen);
            vec = randi(otherVsLen);
            
            % swap the two vectors
            temp = basis(:, idx);
            basis(:, idx) = otherVs(:, vec);
            otherVs(:, vec) = temp;
            
            % Check if orthogonality rank increased, and if so keep the swap
            % Otherwise, swap back
            [isquasi, orank2] = isQuasiwithRank(basis)
            if orank2 > orank1
                orank1 = orank2;
                % if isquasi == true
                %     break
                % end
            else
                temp = basis(:, idx);
                basis(:, idx) = otherVs(:, vec);
                otherVs(:, vec) = temp;
            end
        end
    end
end
