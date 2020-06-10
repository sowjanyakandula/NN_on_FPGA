%Script to write verilog code of sigmoid 
clear all
close all
clc

fid = fopen('D:\NN_on_FPGA\sigmoid_implementation.txt', 'wt');

fprintf(fid, sprintf('always @(in)\n'));
fprintf(fid, sprintf('begin\n'));
fprintf(fid, sprintf('\tcase(in)\n'));
for i= 0:((2^11)-1)
    fprintf(fid, sprintf('\t\t11''b%s: out = 8''b%s;\n', dec2bin(i,11),dec2bin((1/(1+exp(-i/256))*256),8)));
end
fprintf(fid, sprintf('\tendcase\n'));
fprintf(fid, sprintf('end'));