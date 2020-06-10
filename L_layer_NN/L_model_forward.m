%Compute the forward propagation for the entire model
%Input : X - invec
%        parameters

function [AL, A_cache, Z_cache] = L_model_forward(X, parameters)
    n = size(parameters);
    n = n(1)/2;               %Num of layers
    
    A_cache = containers.Map();
    Z_cache = containers.Map();
    
    A = X;
    A_cache(strcat('A0')) = A;
    
    %Forward prop for first n-1 layers
    for i = 1:n-1
        A_prev = A;
        W = parameters(strcat('W', num2str(i)));
        B = parameters(strcat('B', num2str(i)));
        [A, Z] = linear_activation_forward(A_prev, W, B, "relu");
        A_cache(strcat('A', num2str(i))) = A;
        Z_cache(strcat('Z', num2str(i))) = Z;
    end
    
    %Forward prop for the last layer
    W = parameters(strcat('W', num2str(n)));
    B = parameters(strcat('B', num2str(n)));
    [AL, Z] = linear_activation_forward(A, W, B, "sigmoid");
    A_cache(strcat('A', num2str(n))) = AL;
    Z_cache(strcat('Z', num2str(n))) = Z;
end