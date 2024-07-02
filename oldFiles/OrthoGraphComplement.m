% Computes the adjacency matrix of the complement of the orthogonality
% graph of X. (This method is more efficient for the
% 'isQuasiOrthogonalizable' algorithm than computing and subsequently
% modifying the adjacency of the orthogonality graph of X itself.)
function A = OrthoGraphComplement(X)
    [~, n] = size(X); A = zeros(n);
    for j = 1:(n-1)
        if any(not(ismembertol(X(:, j), 0)))
            for k = (j+1):n
                if not(isequaltol(X(:, j)'*X(:, k), 0))
                    A(j, k) = 1;
                    A(k, j) = 1;
                end
            end
        end
    end
end