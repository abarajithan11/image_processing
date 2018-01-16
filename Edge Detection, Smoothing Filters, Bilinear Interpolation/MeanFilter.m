function HistEq(imName)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);

imIn2 = uint8(zeros(h+2,w+2));
imIn2[2:h+1, 2:w+1] = imIn;

% Kernel

H = [
    1   1   1;
    1   1   1;
    1   1   1;
    ]

H = H/9;

% Moving the kernel

for i = 2:h+1
    for j = 2:w+1
        sum = 0;
        
        for k = -1:1
            for l = -1:1
                
        