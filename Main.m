clear;
clc;
%Getting input for car images
D = 'D:\NN_on_FPGA\v_data\train\cars';
S = dir(fullfile(D,'*.jpg'));
invec = [];
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
im1 = rgb2gray(im1);
im1 = im1(:);
invec = [invec im1];
end

%Getting input for plane images
D = 'D:\NN_on_FPGA\v_data\train\planes';
S = dir(fullfile(D,'*.jpg'));
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
im1 = rgb2gray(im1);
im1 = im1(:);
invec = [invec im1];
end

alpha = 0.00000035;
epochs = 100;
n = size(invec);
y = [ones(n(2)/2,1); zeros(n(2)/2,1)];
w = zeros(n(1),1);

w = Binary_Classi_NN(invec, w, epochs, y, alpha);