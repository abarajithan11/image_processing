im = imread('Open-Real.jpg');
try
    im = rgb2gray(im);
catch
end

% K = [
%     0 0 0 1 0 0 0
%     0 0 1 1 1 0 0
%     0 1 1 1 1 1 0
%     1 1 1 1 1 1 1
%     0 1 1 1 1 1 0
%     0 0 1 1 1 0 0
%     0 0 0 1 0 0 0 ];

K = [
    1 1 1
    1 1 1
    1 1 1 ];

%im = medfilt2(im, [5 5]);

s = ones(5,5);
Ans = imclose(im,s);
name = 'close.jpg';





figure
subplot(1,2,1);
imshow(mat2gray(im));
title 'Input';

subplot(1,2,2);
imshow(mat2gray(Ans));
title 'Output';

imwrite(mat2gray(Ans), name);