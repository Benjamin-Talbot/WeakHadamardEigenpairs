function quasi = isQuasiNew(X)
    n = size(X, 2);
    adjList = zeros(n, 2);
    for j = 1:(n-1)
        if any(not(ismembertol(X(:, j), 0)))
            for k = (j+1):n
                if not(isequaltol(X(:, j)'*X(:, k), 0))
                    for idx = [j, k]
                        if adjList(idx, 1) == 0
                            adjList(idx, 1) = 1;
                        elseif adjList(idx, 2) == 0
                            adjList(idx, 2) = 1;
                        else
                            quasi = false;
                            return
                        end
                    end
                end
            end
        end
    end

    meow
end