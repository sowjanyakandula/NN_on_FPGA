%Computes the linear forward output
%Input: A_prev, W, B
%Output: Z. Store this Z in a cache library used for storing Z and A

function Z = linear_forward(A, W, B)
    Z = W * A + B;
end