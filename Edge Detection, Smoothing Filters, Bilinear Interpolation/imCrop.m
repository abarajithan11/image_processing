function imCrop

im = imread('i.png');
im = rgb2gray(im);
imSize = size(im) % Show size

imshow(im);
title 'Input';

startC = [80,300];
endC = [120,350];

imOut = im(startC(1):endC(1),startC(2):endC(2));

imshow(imOut);