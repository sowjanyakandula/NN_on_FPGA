function wnew = Binary_Classi_NN(invec, w, epochs, y, alpha)
for i = 1:epochs
    n = size(invec);
    z = ((invec).')*(w);
    ycap = 1./(1+exp(-z));
    %disp(ycap(1));
    %disp(ycap);
    %L = -(y.*log(ycap) + (1-y).*log(1-ycap));
    %disp(L(1));
    w = w - alpha*((invec)*(ycap - y));
    disp(invec(1,1:n(2))*(ycap - y));
    disp(i);
end
wnew = w;
end