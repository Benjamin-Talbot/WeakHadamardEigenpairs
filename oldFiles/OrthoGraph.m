% Computes the adjacency matrix of the orthogonality graph of X. (This is
% not necessary for the 'isQuasiOrthogonalizable' algorithm, but I thought
% I would include it in this package nonetheless.)
function A = OrthoGraph(X)
    [~, n] = size(X); A = zeros(n);
    for j = 1:(n-1)
        if any(not(ismembertol(X(:, j), 0)))
            for k = (j+1):n
                if isequaltol(X(:, j)'*X(:, k), 0)
                    A(j, k) = 1;
                    A(k, j) = 1;
                end
            end
        else
            for k = [1:(j-1), (j+1):n]
                A(j, k) = 1;
                A(k, j) = 1;
            end
        end
    end
end