%%Creating files which contain the correct values. They have to be verified
%%against FPGA results.

%%invec file creation

fid = fopen('D:\NN_on_FPGA\Verification\invec_read_matlab.txt', 'wt');

%Creating invec and writing into file
D = 'D:\NN_on_FPGA\mnist\fpga_train\1';
S = dir(fullfile(D,'*.jpg'));
invec = [];
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
%im1 = rgb2gray(im1);
im1 = im1(:);
x = im1;
for i = 1:length(x)
    fprintf(fid, sprintf('%s,\n',dec2bin(x(i),8)));
end
invec = [invec im1];
end

D = 'D:\NN_on_FPGA\mnist\fpga_train\0';
S = dir(fullfile(D,'*.jpg'));
for k = 1:numel(S)
file1 = fullfile(D,S(k).name);
im1 = double(imread(file1));
%im1 = rgb2gray(im1);
im1 = im1(:);
x = im1;
for i = 1:length(x)
    fprintf(fid, sprintf('%s,\n',dec2bin(x(i),8)));
end
invec = [invec im1];
end
fclose(fid);

%%weight file creation
%going for weights initialised to zero for simplicity
wid = fopen('D:\NN_on_FPGA\Verification\weight_read_matlab.txt', 'wt');
n = size(invec);
w = randn(n(1),1);
x = w;
num = dec2bin(typecast(int32(256 * x),'uint32'));
num = num(:, 21:32);
for i = 1:length(x)
    fprintf(wid, sprintf('%s,\n',num(i, :)));
end
fclose(wid);

%%Creation of Z file
zid = fopen('D:\NN_on_FPGA\Verification\z_read_matlab.txt', 'wt');
z = ((invec).')*(w);
x = z;
x = x(:);
num = dec2bin(typecast(int64(256 * x),'uint64'));
num = num(:, 33:64);
for i = 1:length(x)
    fprintf(zid, sprintf('%s,\n',num(i, :)));
end
fclose(zid);

%%Creation of sigmoid read file
sid = fopen('D:\NN_on_FPGA\Verification\sigout_read_matlab.txt', 'wt');
ycap = 1./(1+exp(-z));
x = ycap;
x = x(:);
num = dec2bin(typecast(int32(256 * x),'uint32'), 32);
num = num(:, 21:32);
for i = 1:length(x)
    fprintf(sid, sprintf('%s,\n',num(i, :)));
end
fclose(sid);

%%Creation of back prop file
alpha = 1/16;
uid = fopen('D:\NN_on_FPGA\Verification\updatedweight_read_matlab.txt', 'wt');
y = [ones(20,1); zeros(20,1)];
updated_weights = w - alpha*((invec)*(ycap - y));
x = updated_weights;
num = dec2bin(typecast(int32(256 * x),'uint32'));
num = num(:, 21:32);
for i = 1:length(x)
    fprintf(uid, sprintf('%s,\n',num(i, :)));
end
fclose(uid);