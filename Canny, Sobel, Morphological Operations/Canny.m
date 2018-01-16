
im = imread('2.png');
im = rgb2gray(im);

Ans = edge(im,'Canny',0.3);





name = '2 Canny 0.01.jpg';

figure
subplot(1,2,1);
imshow(im);
title 'Input';

subplot(1,2,2);
imshow(mat2gray(Ans));
title 'Output';

imwrite(mat2gray(Ans), name);