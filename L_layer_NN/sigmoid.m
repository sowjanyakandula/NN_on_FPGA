%sigmoid function
function A = sigmoid(Z)
    A = 1./(1 + exp(-Z));
    A = reshape(A, size(Z));
    A (A == 0) = 0.0000001;
    A (A == 1) = 0.9999;
end