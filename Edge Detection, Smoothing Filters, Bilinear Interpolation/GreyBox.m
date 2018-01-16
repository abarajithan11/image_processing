m = 120;
n=160;
im = zeros(m, n);
im = uint8(im);
for i = 21:1:100
    for j = 41:1:120
        im(i,j) = 255;
    end
end;
imwrite(im, 'gbox.jpg');