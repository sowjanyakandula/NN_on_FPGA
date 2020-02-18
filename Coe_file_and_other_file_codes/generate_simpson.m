


clear all
close all
clc

D = 'D:\NN_on_FPGA\mnist\fpga_train\1';
S = dir(fullfile(D,'*.jpg'));

fid = fopen('D:\NN_on_FPGA\values_fpga_40im.coe', 'wt');

fprintf(fid, sprintf('memory_initialization_radix=2;\n\n'));

fprintf(fid, sprintf('memory_initialization_vector=\n\n'));


for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
x = im1(:);
    for i = 1:length(x)
        fprintf(fid, sprintf('%s,\n',dec2bin(x(i),8)));
    end
end

D = 'D:\NN_on_FPGA\mnist\fpga_train\0';
S = dir(fullfile(D,'*.jpg'));

for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
x = im1(:);
    for i = 1:length(x)
        fprintf(fid, sprintf('%s,\n',dec2bin(x(i),8)));
    end
end

fclose(fid);

