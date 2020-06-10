%ReLU function

function A = relu(Z)
    A = max(0, Z);
    A = reshape(A, size(Z));
end