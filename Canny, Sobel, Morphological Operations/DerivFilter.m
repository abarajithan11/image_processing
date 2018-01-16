function DerivFilter

%Read Image

im = imread('dp500.jpg');
im = rgb2gray(im);
imSize = size(im);


w = imSize(1);
h = imSize(2);

%Define a Kernel

k = [
    1 0 -1
    2 0 -2
    1 0 -1 
];



% Convolution, return same size

imOut = uint8(conv2(double(im), double(k), 'same'));

figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(imOut);
title 'Output';