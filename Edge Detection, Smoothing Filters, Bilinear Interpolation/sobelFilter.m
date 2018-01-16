function sobelFilter

%Read Image

im = imread('a3.jpg');
im = rgb2gray(im);
imSize = size(im);


w = imSize(1);
h = imSize(2);

%Define a Kernel

sobX = [ 
    -1 -2 -1;
    0 0 0;
    1 2 1 ];

sobY = [
    -1 0 1;
    -2 0 2;
    -1 0 1 ];

edgeX = conv2(sobX, im);
edgeY = conv2(sobY, im);

absEdge = (edgeX.^2 + edgeY.^2).^0.5;

edge45 = (edgeX + edgeY)/sqrt(2);

% Derivative of Gaussian

gau = fspecial('gaussian', 3,2);
gauX = conv2(gau, sobX);
gauY = conv2(gau, sobY);

absgau = (gauX.^2 + gauY.^2).^0.5;

gauedge = conv2(absgau, im);

figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(uint8(gauedge));
title 'Output';

%imwrite(uint8(edge45), 'a3 sobel grad 45.jpg');