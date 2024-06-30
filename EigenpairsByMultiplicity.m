function [V, D, multis] = EigenpairsByMultiplicity(L)
% EIGENPAIRSBYMULTIPLICITY  Compute and sort the eigenpairs of a matrix by multiplicity (with tolerance).
%   V = EigenpairsByMultiplicity(L) returns the eigenvectors of the matrix L.
%   [V, D] = EigenpairsByMultiplicity(L) returns the eigenvectors and eigenvalues of the matrix L.
%   [V, D, multis] = EigenpairsByMultiplicity(L) returns the eigenvectors, eigenvalues, and multiplicities of the matrix L.

    % Computes the standard normal eigenvectors and eigenvalues of the matrix L.
    [V, D] = eig(L);
    % Stores the number of rows of L.
    n = size(L, 1);
    % Initializes the matrix VD as a 3D array with dimensions n x n x 2.
    VD = zeros(n, n, 2);
    % Assigns the eigenvectors and eigenvalues to the first and second 2D slices of VD, respectively.
    VD(:, :, 1) = V; VD(:, :, 2) = D;
    
    % Creates a 1D array of the eigenvalues of L (with repetitions included).
    d = diag(D);
    % Meow
    eigvals = uniquetol(d); k = length(eigvals);
    multis = zeros(k, 1);
    for i = 1:k
	    multis(i) = sum(ismembertol(d, eigvals(i)));
    end
    me = [multis, eigvals];
    
    md = [zeros(n, 1), d];
    for i = 1:n
        for j = 1:k
            if isequaltol(d(i), me(j, 2))
                md(i, 1) = me(j, 1);
                break
            end
        end
    end
    [~, index] = sortrows(md, 1);
    
    P = zeros(n);
    for i = 1:n
        j = index(i);
        P(i, j) = 1;
    end
    V = VD(:, :, 1)*P';
    D = P*VD(:, :, 2)*P';
    multis = sort(multis);
end