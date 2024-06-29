% Determines whether the adjacency matrix A represents a subgraph of a
% path. (This assumes that A is real symmetric and thus a valid adjacency.)
function path = isPathSubgraph(A)
    path = true;
    n = size(A, 2);
    
    row_sums = zeros(1, n);
    for k = 1:n
        row_sums(k) = sum(A(k, :));
    end
    
    if any(row_sums > 2)
        path = false;
    elseif sum(row_sums <= 1) < 2
        path = false;
    else
        visited = zeros(1, n);
        for k = 1:n
            if row_sums(k) == 1
                visited = travelPath(A, visited, k);
            end
        end
        for k = 1:n
            if visited(k) == 0 && row_sums(k) ~= 0
                path = false;
                break
            end
        end
    end

    % Iteratively visits and marks each node of A (if not
    % all nodes are marked, then A is not a path subgraph)
    function visited = travelPath(A, visited, j)
        n = size(A, 2); visited(j) = true;
        ct = 1;
        while ct <= n
            for k = 1:n
                if A(j, k) == 1 && visited(k) == false
                    visited(k) = true;
                    j = k;
                    break
                end
            end
            ct = ct + 1;
        end
    end
end