%To update the parameters W and B
%Input: parameters (Contains W and B for all layers)
%       grads (dW, dB for all layers)
%       alpha (learning rate)
%Output:parameters (New weights and new biases)

function parameters = update_parameters(parameters, grads, alpha)
    n = size(parameters);
    n = n(1)/2;               %Num of layers
    
    for i = 1:n
        parameters(strcat('W', num2str(i))) = parameters(strcat('W', num2str(i))) - alpha * grads(strcat('dW', num2str(i)));
        parameters(strcat('B', num2str(i))) = parameters(strcat('B', num2str(i))) - alpha * grads(strcat('dB', num2str(i)));
    end
end