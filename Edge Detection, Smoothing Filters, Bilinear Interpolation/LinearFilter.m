function LinearFilter

%Read Image

im = imread('i.png');
im = rgb2gray(im);
imSize = size(im);


w = imSize(1);
h = imSize(2);

%Define a Kernel

k = [

    0	0	0  
    0   2   0	
    0   0   0  
];

k2 = ones(3,3) / 9;

k = k - k2;
k = double(k)/sum(sum(k));

% Convolution, return same size

imOut = uint8(conv2(double(im), double(k), 'same'));

% Median filter

d = zeros(9,9);
d(5,5) = 1;

g = 2*d - fspecial('gaussian', 9,1.5xsx);
imOut = imfilter(im, g);

figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(imOut);
title 'Output';