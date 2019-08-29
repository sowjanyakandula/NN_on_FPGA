%Checking for Cars
D = 'D:\NN_on_FPGA\v_data\test\cars';
S = dir(fullfile(D,'*.jpg'));
result = 0;
total = 0;
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
im1 = rgb2gray(im1);
im1 = im1(:);
z = ((im1).')*(w);
ycap = 1./(1+exp(-z));
if ycap > 0.5
    result = result+1;
end
end

total = k;
%Checking for Planes
D = 'D:\NN_on_FPGA\v_data\test\planes';
S = dir(fullfile(D,'*.jpg'));
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
im1 = rgb2gray(im1);
im1 = im1(:);
z = ((im1).')*(w);
ycap = 1./(1+exp(-z));
if ycap < 0.5
    result = result+1;
end
end

total = total + k;
accuracy = result/total*100;
