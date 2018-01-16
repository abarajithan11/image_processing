function im = Clamp(imName, Imin, Imax)

im = imread(imName);
im = rgb2gray(im);

imSize = size(im);

% im = min(im, Imin);
% im = max(im, Imax);

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

imshow(im)