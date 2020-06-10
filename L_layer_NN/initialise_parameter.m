%%Contains Helper functions for the main Multilayer code


%%Function to initialise parameters (Weights and biases of all layers)
%Arguments : layer_dims - COntains dimensions of all layers
%Returns : Weights and biases of all Layers
function parameters = initialise_parameter(layer_dims)
    
    parameters = containers.Map();
    L = length(layer_dims);
    %L = size(layer_dims)
    for i = 2:L
        parameters(strcat('W', num2str(i - 1))) = randn(layer_dims(i), layer_dims(i - 1));
        parameters(strcat('B', num2str(i - 1))) = randn(layer_dims(i), 1);
    end
end