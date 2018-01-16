imOut = zeros(W,H,d);

for k = 1:3
    for i = 1:m-1
        for j = 1:n-1
            
            A = im(i,j,k);
            B = im(i,j+1,k);
            C = im(i+1, j, k);
            D = im(i+1, j+1, k);
            
            for jj = 0:factor
                ix = double(A+ (B-A) * (jj/factor));
                jx = double(C+ (D-C) * (jj/factor));
                
                for ii = 0:factor
                    imOut ((i-1)* factor +1 +ii+1, (j-1)*factor+1+jj+1,k) = double(ix+11*(jx-ix)/factor); 
                end
            end
        end
    end
end

imOut = uint8(imOut);


[y,x] = meshgrid(1:n, 1:n);
[t,r] = cart2pol(x-midx, y-midy);
t1 = radtodeg(t+deg);
t = degtorad(t1);
[x,y] = pol2cart(t,r);

tempx = round(x +midx);
tempy = round(y +midy);



%To Calculate Dimensions for the new image

if( min(tempx (:))<0)
    newx = max(tempx(:)) + abs(min(tempx(:)))+1;
    tempx = tempx + abs(min(tempx(:)))+1;
else
    newx = max(tempx(:));
end