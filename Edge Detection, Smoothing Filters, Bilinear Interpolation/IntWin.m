function im = IntWin(imName, Imin, Imax)

im = imread(imName);
im = rgb2gray(im);

imwrite(im, 'IW_org.jpg');

imSize = size(im);

for i = 1:1:imSize(1)
    for j = 1:1:imSize(2)
        if im(i,j) < Imin
            im(i,j) = 0;
        end
        if im(i,j) > Imax
            im(i,j) = 255;
        end
    end
end

figure
hist(im)

imshow(im)

imwrite(im, 'IW_fin.jpg');