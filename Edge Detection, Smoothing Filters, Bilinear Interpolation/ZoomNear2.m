function ZoomNear2(imName, scale)

% Reading the Image
imIn = imread(imName);

[h,w,d] = size(imIn);

imOut = uint8(zeros(h*scale, w*scale, d));

for i = 1:h*scale
    for j = 1:w*scale
        imOut(i,j,:) = imIn( min(floor(i/scale)+1, h), min(floor(j/scale)+1, w), :);
    end
end

figure
subplot(1,2,1);
imshow(imIn);
title('Original');

subplot(1,2,2);
imshow(imOut);
title('Zoomed');