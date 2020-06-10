%Computes A for the given activation function

%Input : A_prev, W, B, activation
%Output: A

function [A, Z] = linear_activation_forward(A_prev, W, B, activation)
    if activation == "sigmoid"
        Z = linear_forward(A_prev, W, B);
        A = sigmoid(Z);
    end
    
    if activation == "relu"
        Z = linear_forward(A_prev, W, B);
        A = relu(Z);
    end
end