function inspan = isinspan(v, A)
    if rank(A) == rank([A, v])
        inspan = true;
    else
        inspan = false;
    end
end