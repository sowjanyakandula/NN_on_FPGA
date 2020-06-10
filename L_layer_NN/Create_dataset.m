%Getting input for car images
D = 'D:\NN_on_FPGA\mnist\trainingSet\verilog_1';
S = dir(fullfile(D,'*.jpg'));
invec = [];
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
[rows, columns, numberOfColorChannels] = size(im1);
if numberOfColorChannels == 3
    im1 = rgb2gray(im1);
end
% [rows, columns, numberOfColorChannels] = size(im1);
% if (rows ~= 1024) || (columns ~= 1024)
%     disp(file1);
% end
im1 = im1(:);
invec = [invec im1];
disp(k);
end
a = k;
%Getting input for plane images
D = 'D:\NN_on_FPGA\mnist\trainingSet\verilog_0';
S = dir(fullfile(D,'*.jpg'));
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
[rows, columns, numberOfColorChannels] = size(im1);
if numberOfColorChannels == 3
    im1 = rgb2gray(im1);
end
% [rows, columns, numberOfColorChannels] = size(im1);
% if (rows ~= 1024) || (columns ~= 1024)
%     disp(file1);
% end
im1 = im1(:);
invec = [invec im1];
disp(k);
end
b = k;