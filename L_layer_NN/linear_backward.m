%To compute linear backward
%Input: dZ - (dL/dZ)
%       A_prev - Input to the layer
%       W - weights of the layer
%       B - Biases of the layer
%Output:dA_prev - (dL/dA_prev) for next layer
%       dW - Store it for back prop
%       dB - Store it for back prop

function [dA_prev, dW, dB] = linear_backward(dZ, A_prev, W, B)
    m = size(A_prev, 2);
    
    dW = (dZ * (A_prev.'))/m;
    dB = sum(dZ, 2)/m;
    dA_prev = (W.') * dZ;
end