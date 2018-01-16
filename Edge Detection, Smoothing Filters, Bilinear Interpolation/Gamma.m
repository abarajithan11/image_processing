function result = Gamma(imName, gamma)

im = imread(imName);

imGrayD = im2double(rgb2gray(im));
imGrayDNormal = imGrayD/255.0;

c = 1 / (1.0^gamma);
c255 = 255.0*c;

result = (c255) * (imGrayDNormal .^ gamma);

subplot (1,2,1)
imshow(imGrayD);
title('Original');

subplot (1,2,2)
imshow(result);
title('Processed');

imwrite(result, 'dpGammaOut.jpg');