function sobelFilter

%Read Image

im = imread('10.png');
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

edgeX = conv2(sobX, double(im));
edgeY = conv2(sobY, double(im));
edgeabs = (edgeX.^2 + edgeY.^2).^0.5;
edge45 = (edgeX + edgeY)/sqrt(2);

%Derivative of Gaussian

sigma = 0.5;

 gau = fspecial('gaussian', ceil(sigma*3),sigma);
 gauX = conv2(gau, sobX);
% gauY = conv2(gau, sobY);
% 
 gauedgeX = conv2(gauX, im);
% gauedgeY = conv2(gauX, im);
% 
% gauedgeabs = conv2(gau,edgeabs);
% gauedge45 = conv2(edge45, gau);

Ans = gauedgeX;
name = 'Gau x 0.5.jpg';

figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(uint8(Ans));
title 'Output';

imwrite(uint8(Ans), name);