%Predict the accuracy of NN by testing the test set with forward prop
X = load('verilog_trainSet.mat');      %gives a struct as output
testData = X.invec;
a = X.a;
b = X.b;
k = a + b;
Y = [ones(a,1); zeros(b,1)];
%normalising
testData = testData/255;

%performing forward prop on given data
[AL, A_cache, Z_cache] = L_model_forward(testData, parameters);

Y = reshape(Y, size(AL));
predicted_values = zeros(size(Y));
predicted_values (AL >= 0.5) = 1;

error = abs(predicted_values - Y);
accuracy = (k - sum(error))/k * 100;