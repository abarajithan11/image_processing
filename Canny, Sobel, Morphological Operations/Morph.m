im = imread('man.png');
try
    im = rgb2gray(im);
catch
end

K = [
    0 0 0 1 0 0 0
    0 0 1 1 1 0 0
    0 1 1 1 1 1 0
    1 1 1 1 1 1 1
    0 1 1 1 1 1 0
    0 0 1 1 1 0 0
    0 0 0 1 0 0 0 ];

K2 = [
    1 1 1
    1 1 1
    1 1 1 ];

im = medfilt2(im, [5 5]);

s = ones(5,5);
Ans = imerode(im,s);



Ans = bwmorph(im, 'skel', 15);
name = 'Skel.jpg';





figure
subplot(1,2,1);
imshow(mat2gray(im));
title 'Input';

subplot(1,2,2);
imshow(mat2gray(Ans));
title 'Output';

imwrite(mat2gray(Ans), name);