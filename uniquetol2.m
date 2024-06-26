function result = uniquetol2(vec)
    n = length(vec);
    result = [vec(1)];
    for i = 2:n
        if not(ismembertol(result, vec(i)))
            result = [result, vec(i)];
        end
    end
end