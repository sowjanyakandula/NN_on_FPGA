%max is <3, thus, 1 bit for sign, 1 bit for integer and 8 bits for decimal
%
clear all
close all
clc

fid = fopen('D:\NN_on_FPGA\weight_40.coe', 'wt');

w = randn(784,1);
plot(w);

fprintf(fid, sprintf('memory_initialization_radix=2;\n\n'));

fprintf(fid, sprintf('memory_initialization_vector=\n\n'));

for i = 1:784
    if w(i) >= 0
        fprintf(fid, sprintf('%s,\n',strcat('0',dec2bin(abs(w(i))*256,11))));
    else
        fprintf(fid, sprintf('%s,\n',strcat('1',dec2bin(abs(w(i))*256,11))));
    end
end