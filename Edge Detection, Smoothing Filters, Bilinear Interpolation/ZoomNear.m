function ZoomNear(imName, scale)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);

h2 = ceil(h*sqrt(scale*w))
w2 = ceil(h2*(w/h));

hScale = ceil(h2/h);
wScale = ceil(w2/w);

imOut = uint8(zeros(h2, w2));

for i = 1:h
    for j = 1:w
        sq = (zeros(hScale,wScale) + 1) * imIn(i,j);
        
        imOut((i-1)*hScale:i*hScale , (j-1)*wScale:i*wScale) = sq;
    end
end

figure
subplot(1,2,1);
imshow(imIn);
title('Original');

subplot(1,2,2);
imshow(imOut);
title('Zoomed');
