function [V, D, multis] = EigenpairsByMultiplicity(L)
    % n = size(L, 1);
    [V, D] = eig(L);
    % VD = zeros(n, n, 2);
    % VD(:, :, 1) = V;
    % VD(:, :, 2) = D;
    
    d = diag(D);
    eigvals = uniquetol2(d);
    k = length(eigvals);

    counts = zeros(k, 1);
    map = containers.Map(eigvals, 1:k);
    for i = 1:n
        counts(map(d(i))) = counts(map(d(i))) + 1;
    end
    multis = zeros(n, 1);
    for i = 1:n
	    multis(i) = counts(map(d(i)));
    end
    % me = [multis, eigvals];
    
    % md = [zeros(n, 1), d];
    % for i = 1:n
    %     for j = 1:k
    %         if isequaltol(d(i), me(j, 2))
    %             md(i, 1) = me(j, 1);
    %             break
    %         end
    %     end
    % end
    % [~, index] = sortrows(md, 1);
    
    % P = zeros(n);
    % for i = 1:n
    %     j = index(i);
    %     P(i, j) = 1;
    % end
    % V = VD(:, :, 1)*P';
    % D = P*VD(:, :, 2)*P';
    % multis = sort(multis);
end