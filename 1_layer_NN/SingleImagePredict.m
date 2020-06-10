D = 'D:\NN_on_FPGA\mnist\testSet\0\img_40008.jpg';
im1 = double(imread(D));
%im1 = rgb2gray(im1);
im1 = im1(:);
z = ((im1).')*(w);
ycap = 1./(1+exp(-z));
if ycap > 0.5
    result = 1;
else
    result = 0;
end