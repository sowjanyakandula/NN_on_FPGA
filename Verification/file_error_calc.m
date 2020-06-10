%file 1
uid = fopen('D:\NN_on_FPGA\Verification\updatedweight_read_matlab.txt', 'r');
up1 = fscanf(uid, '%s');
up1 = split(up1, ',');
up1 = up1(1:784);
up1 = string(up1);
up1 = split(up1, '');
up1 = up1(:, 2:13);
fclose(uid);
X = linspace(11, 0, 12);
X = power(2, X);
X(1) = -1 * X(1);
w1 = str2double(up1) * (X.');
w1 = w1/256;
%fclose(uid);

%file 2
uid2 = fopen('D:\NN_on_FPGA\Verification\FPGA_read_data\updatedweight_read.txt', 'r');
up1 = fscanf(uid2, '%s');
up1 = split(up1, ',');
up1 = up1(1:784);
up1 = string(up1);
up1 = split(up1, '');
up1 = up1(:, 2:13);
fclose(uid);
X = linspace(11, 0, 12);
X = power(2, X);
X(1) = -1 * X(1);
w2 = str2double(up1) * (X.');
w2 = w2/256;
%fclose(uid2);

diff = abs(w1 - w2);
diff2 = power(diff, 2);
error = sum(diff2)/size(up1, 1);