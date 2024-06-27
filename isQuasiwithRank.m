function [quasi, rank] = isQuasiwithRank(X)
    n = size(X, 2);
    quasi = true;
    rank = n*(n - 1)/2;

    % BEGIN: OrthoGraphComplement
    adjList = zeros(n, 2);
    for j = 1:(n-1)
        %if any(not(ismembertol(X(:, j), 0)))
        for k = (j+1):n
            if not(isequaltol(X(:, j)'*X(:, k), 0))
                rank = rank - 1;
                for idx = [j, k]
                    if adjList(idx, 1) == 0
                        adjList(idx, 1) = 1;
                    elseif adjList(idx, 2) == 0
                        adjList(idx, 2) = 1;
                    else
                        quasi = false;
                    end
                end
            end
        end
        %end
    end
    % END: OrthoGraphComplement

    if quasi == true
        % BEGIN: isPathSubgraph
        % Determines whether the adjacency list A represents a subgraph of a path.
        path = true;
        row_sums = zeros(1, n);
        for i = 1:n
            for j = 1:2
                if adjList(i, j) ~= 0
                    row_sums(i) = row_sums(i) + 1;
                end
            end
        end

        % row_sums > 2 already checked in orthograph complement section above
        if sum(row_sums <= 1) < 2
            path = false;
        else
            visited = zeros(1, n);
            for i = 1:n
                if row_sums(i) == 1
                    visited = travelPath(adjList, visited, i);
                end
            end
            for i = 1:n
                if visited(i) == 0 && row_sums(i) ~= 0
                    path = false;
                    break
                end
            end
        end

        quasi = path;
    end
    
    % Iteratively visits and marks each node of A (if not
    % all nodes are marked, then A is not a path subgraph)
    function visited = travelPath(adjList, visited, j)
        n = size(adjList, 1);
        visited(j) = true;
        ct = 1;
        while ct <= n
            for ind = 1:2
                if adjList(j, ind) ~= 0 && visited(adjList(j, ind)) == false
                    visited(adjList(j, ind)) = true;
                    j = adjList(j, ind);
                    break
                end
            end
        end
    end

    % END: isPathSubgraph
end
