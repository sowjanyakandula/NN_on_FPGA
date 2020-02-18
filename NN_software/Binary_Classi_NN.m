function wnew = Binary_Classi_NN(invec, w, epochs, y, alpha)
for i = 1:epochs
    max_weight = 0;
    max_z = 0;
    n = size(invec);
    z = ((invec).')*(w);
    ycap = 1./(1+exp(-z));
    %disp(ycap(1));
    %disp(ycap);
    %L = -(y.*log(ycap) + (1-y).*log(1-ycap));
    %disp(L(1));
    w = w - alpha*((invec)*(ycap - y));
    disp(invec(1,1:n(2))*(ycap - y));
    %disp(i);
    temp = max(w);
    if temp>max_weight
        max_weight = temp;
    end
    temp = max(z);
    if temp>max_z
        max_z = temp;
    end
end
wnew = w;
disp(max_weight);
disp(max_z);
end