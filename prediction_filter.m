D = 'D:\NN_on_FPGA\v_data\test\cars\15.jpg';
im1 = double(imread(D));
im1 = rgb2gray(im1);
im1 = im1(:);

z = ((im1).')*(w);
ycap = 1./(1+exp(-z));