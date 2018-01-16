function Edge

%Read Image

im = imread('a1.jpg');
im = rgb2gray(im);

imEdge = edge(im,'canny', 0.3, 1.5);

% edge(im,'canny', thresh, sigma);
% Increase Threshold  ->  Less edges
% Increase Sigma  -> Less edges






f = figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(imEdge);
title 'Output';

%imwrite(uint8(edge45), 'a3 sobel grad 45.jpg');