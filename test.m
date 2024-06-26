A = [3, 4, 1, 7]
B = 1:4
C = containers.Map(A, B)
counts = zeros(4, 1)
for i = 1:4
    counts(C(A(i))) = counts(C(A(i))) + 1;
end
% C = containers.Map('KeyType', 'int32', 'ValueType', 'int32')
% for i = 1:4
%     C(A(i)) = B(i);
% end

% for i = 1:4
%     disp(C(A(i)))
% end
counts