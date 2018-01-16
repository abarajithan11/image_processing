function DrawHist(imName)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);


% Main Function

histX = 0:255;
histY = zeros(256);

for i = 1:h
    for j = 1:w
        I = imIn(i,j)+1;
        histY(I) = histY(I) + 1;
    end
end

plot(histX, histY)
title 'Manual Histogram';

% Verify

figure
imhist(imIn);