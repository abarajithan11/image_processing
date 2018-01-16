function GaussianSmooth(imName, hsize, sigma)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);


% Gaussian Kernel
H = fspecial('gaussian', hsize, sigma);

% Apply filter

imOut = imfilter(imIn, H, 'replicate');

figure
subplot(1,2,1);
imshow(imIn);
title('Original');

subplot(1,2,2);
imshow(imOut);
title('Gaussian');

imwrite(imIn, 'g1.jpg');
imwrite(imOut, 'g2.jpg');