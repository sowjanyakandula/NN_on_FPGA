clear;
clc;
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

alpha = 0.5;
epochs = 5;
n = size(invec);
y = ones(n(2),1);
w = zeros(n(1),1);

w = Binary_Classi_NN(invec, w, epochs, y, alpha);