function [V, D, multis] = EigenpairsByMultiplicity(L)
    % n = size(L, 1);
    [V, D] = eig(L);
    % VD = zeros(n, n, 2);
    % VD(:, :, 1) = V;
    % VD(:, :, 2) = D;
    
    d = diag(D);
    eigvals = uniquetol(d); k = length(eigvals);
    multis = zeros(k, 1);
    for i = 1:k
	    multis(i) = sum(ismembertol(d, eigvals(i)));
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