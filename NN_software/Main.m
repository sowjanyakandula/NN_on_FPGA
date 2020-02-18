clear;
clc;
%Getting input for car images
D = 'D:\NN_on_FPGA\mnist\trainingSet\1';
S = dir(fullfile(D,'*.jpg'));
invec = [];
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
%im1 = rgb2gray(im1);
im1 = im1(:);
invec = [invec im1];
end
a = k;
%Getting input for plane images
D = 'D:\NN_on_FPGA\mnist\trainingSet\0';
S = dir(fullfile(D,'*.jpg'));
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
%im1 = rgb2gray(im1);
im1 = im1(:);
invec = [invec im1];
end
b = k;
alpha = 0.001;
epochs = 10;
n = size(invec);
y = [ones(a,1); zeros(b,1)];
w = randn(n(1),1);

w = Binary_Classi_NN(invec, w, epochs, y, alpha);