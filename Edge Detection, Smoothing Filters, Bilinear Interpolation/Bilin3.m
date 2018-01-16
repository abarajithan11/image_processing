function Bilin

%Read Image

im = imread('dp50.jpg');
im = rgb2gray(im);

sizeIn = size(im);
M = sizeIn(1);
N = sizeIn(2);
scale = 10;
invscale = 1/scale;

Mout = ceil(M*scale);
Nout = ceil(M*scale);
imOut = zeros(Mout, Nout);

datalineM = ceil(double(im(:,1)).*scale);
datalineN = ceil(double(im(1,:)).*scale);

for mOutInd = 1:size(datalineM)
    for nOutInd = 1:size(datalineN)
        
        x1 = datalineM(mOutInd);
        y1 = datalineN(nOutInd);
        try
            x2 = datalineM(mOutInd+1);
            y2 = datalineN(nOutInd+1);
        catch
            imOut(x1,y1) = im( mOutInd , nOutInd );
            continue;
        end
        Q = double([im(mOutInd,nOutInd) , im(mOutInd,nOutInd+1) , im(mOutInd+1,nOutInd), im(mOutInd+1,nOutInd+1)].');
        Mat = double([
            1 x1 y1 x1*y1
            1 x1 y2 x1*y2
            1 x2 y1 x2*y1
            1 x2 y2 x2*y2
            ])
        
        A = Mat\ Q;
        
        try
            imOut(x1,y1) = im( ceil(x1*invscale) , ceil(y1*invscale) );
        catch
            try
                imOut(x1,y1) = im( M , N );
                continue;
            catch
                
                continue;
            end
        end
        
        if(mOut == 0 || nOut ==0)
            continue;
        end
        
        box = imOut(mOut:datalineM(mOutInd+1), nOut:datalineM(nOutInd+1));
        
        sizebox = size(box);
        
        for m2 = 1:sizebox(1)
            for n2 = 1: sizebox(2)
                B = [1 m2 n2 m2*n2].';
                
                imOut(m2,n2) = A * B;
            end
        end
        
        
    end
end

imshow(uint8(imOut));
