%backward of relu

%needs Z and dA in input
%for Z > 0, dZ will be dA
%for Z <0, dZ will be 0

function dZ = relu_backward(dA, Z)
    dZ = dA;
    dZ(Z <= 0) = 0;
end