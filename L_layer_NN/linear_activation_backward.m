%This calculates back prop for the activation present
%Cumulate with linear_backward to get back prop for a single layer

%Input: dA - (dL/dA) of layer L given from the layer L+1. A is the output
%of this layer
%       A_prev - Input to the layer
%       W - weights of the layer
%       B - Biases of the layer
%Output:dA_prev - (dL/dA_prev) for next layer
%       dW - Store it for back prop
%       dB - Store it for back prop

function [dA_prev, dW, dB] = linear_activation_backward(dA, A_prev, Z, W, B, activation)
    if activation == "relu"
        dZ = relu_backward(dA, Z);
        [dA_prev, dW, dB] = linear_backward(dZ, A_prev, W, B);
    end
    
    if activation == "sigmoid"
        dZ = sigmoid_backward(dA, Z);
        [dA_prev, dW, dB] = linear_backward(dZ, A_prev, W, B);
    end
end