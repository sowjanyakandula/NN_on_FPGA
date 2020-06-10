
%Preparing the data set
%Getting input from images. Loading the dataset into workspace directly
X = load('verilog_trainSet.mat');      %gives a struct as output
invec = X.invec;
%normalising
invec = invec/255;
%defining hyper parameters
a = X.a;
b = X.b;
alpha = 0.0078125;
epochs = 1000;
n = size(invec);
Y = [ones(a,1); zeros(b,1)];

%initialising weights and biases
layer_dims = [size(invec, 1) 1];
parameters = initialise_parameter(layer_dims);
c = [];
%performing the training
for i = 1 : epochs
    [AL, A_cache, Z_cache] = L_model_forward(invec, parameters);
    cost = compute_cost(AL, Y);
    grads = L_model_backward(AL, Y, parameters, Z_cache, A_cache);
    parameters = update_parameters(parameters, grads, alpha);
    
    %disp(i);
    if (mod(i, 100) == 0)
        disp(strcat("cost after ", num2str(i), "iterations = ", num2str(cost)));
        c = [c cost];
    end
end

%plotting c to see how cost decreased over the iterations
plot(c);
ylabel('cost');
xlabel('iterations per hundred');
title(strcat('learning rate = ', num2str(alpha)));