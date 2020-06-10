%L model backward
%Calculates the whole backward model for a NN
%Input: Al - predicted labels
%       Y - True labels
%       parameters - contains W and B of all the layers
%       Z_cache - Contains Z of all layers
%       A_cache - Conatains A of all layers. A0 is X (invec)
%Output:grads - Dictionary containing dW and dB of all the layers

function grads = L_model_backward(AL, Y, parameters, Z_cache, A_cache)
    grads = containers.Map();
    n = size(parameters);
    n = n(1)/2;               %Num of layers
    
    m = size(AL, 2);
    Y = reshape(Y, size(AL));
    
    %Calculating derivative of cost function
    dAL = -((Y ./ AL) - ((1 - Y) ./ (1 - AL)));
    
    %Performing Backprop for nth layer
    Z = Z_cache(strcat('Z', num2str(n)));
    A_prev = A_cache(strcat('A', num2str(n-1)));
    W = parameters(strcat('W', num2str(n)));
    B = parameters(strcat('B', num2str(n)));
    [dA_prev, dW, dB] = linear_activation_backward(dAL, A_prev, Z, W, B, "sigmoid");
    grads(strcat('dW', num2str(n))) = dW;
    grads(strcat('dB', num2str(n))) = dB;
    
    %Performing Backprop for (n-1)th layer to 1st layer
    i = 1: n-1;
    for i = flip(i)
        Z = Z_cache(strcat('Z', num2str(i)));
        A_prev = A_cache(strcat('A', num2str(i-1)));
        W = parameters(strcat('W', num2str(i)));
        B = parameters(strcat('B', num2str(i)));
        [dA_prev, dW, dB] = linear_activation_backward(dA_prev, A_prev, Z, W, B, "relu");
        grads(strcat('dW', num2str(i))) = dW;
        grads(strcat('dB', num2str(i))) = dB;
    end
end