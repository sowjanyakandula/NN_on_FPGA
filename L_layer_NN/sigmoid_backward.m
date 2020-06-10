%To calculate derivative of sigmoid

%gives dZ. gradient of dA. 
%input dA (from the L+1 layer)
%Needs to get Z of Lth layer
%returns dZ. Which is further used to compute dW, dB, dA of Lth layer
function dZ = sigmoid_backward(dA, Z)
    s = sigmoid(Z);
    dZ = dA .* s .* (1-s);
end