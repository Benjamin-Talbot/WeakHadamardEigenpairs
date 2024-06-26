function equalArray = isequaltolLogArr(vec, val)
    n = length(vec);
    tol = 1e-10;
    equalArray = zeros(1, n);
    for i = 1:n
        if vec(i) - val < tol   % replace with isequaltol
            equalArray(i) = 1;
        end
    end
end