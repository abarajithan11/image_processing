function TempMatchRot

im = imread('a3.jpg');
im = rgb2gray(im);

q = imread('q3.ppm');
q = rgb2gray(q);

t = 45;
rotIm = imrotate(q,t);

rotImWidth = size(rotIm,1);
cropImWidth = floor(rotImWidth/(1+2*sin(t)));

offset = floor(0.5*(rotImWidth-cropImWidth));

cropIm = rotIm(offset : offset+cropImWidth , offset : offset+cropImWidth);

figure
subplot(1,3,1)
imshow(q);
subplot(1,3,2)
imshow(rotIm);
subplot(1,3,3)
imshow(cropIm);