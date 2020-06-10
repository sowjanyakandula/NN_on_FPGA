%To compute cost of final output for a given epoch
%Input: AL (Predicted labels)
%       Y (True labels)

function cost = compute_cost(AL, Y)
    m = length(Y);
    Y = reshape(Y, size(AL));
    cost = -sum((Y .* log(AL)) + ((1 - Y) .* (log(1 - AL))))/m;
end