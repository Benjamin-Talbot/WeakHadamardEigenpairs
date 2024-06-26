% Determines whether the columns of X are permutable as a quasi-
% orthogonalizable tuple.
function quasi = isQuasiOrthogonalizable(X)
    % Checks whether the orthogonality complement is a path subgraph
    A = OrthoGraphComplement(X);
    quasi = isPathSubgraph(A);
end