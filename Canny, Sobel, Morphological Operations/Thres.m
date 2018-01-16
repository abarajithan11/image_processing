im = imread('SobAbs.jpg');

thres = 200;

Ans = im > 190;

name = 'Thres 190';


figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(mat2gray(Ans));
title 'Output';

imwrite(mat2gray(Ans), name);