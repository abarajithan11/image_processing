function Bilin

%Read Image

im = imread('dp50.jpg');
im = rgb2gray(im);

size = im.size();
M = size(1);
N = size(2);
scale = 10;
invscale = 1/scale;

imOut = zeros(M*scale,M*scale);

% Linear interpolation
for mOut = 1:M*scale                    % Along each datapoint column (nIn), traversing rows; in output image
    for nIn = 1:N
        mIn1 = floor(mOut*invscale);
        mIn2 = ceil(mOut*invscale);
        
        if(mIn1 == 0)                   % Handle the extreme points
            mIn1 = 1;
        end
        if(mIn2 == M+1)
            mIn1 = M;
        end

        if(mIn1    ==   mIn2)           % Handle Datapoints
            imOut(mOut,nIn) = im( mIn1 , nIn );
            continue;
        end
        
        x = mOut;
        x1 = mIn1;
        x2 = mIn2;
        y_ = nIn;
        
        imOut (x, y_) = im(x1,y_)*(x2-x)/(x2-x1) + im(x2,y_)*(x-x2)/(x2-x1);
    end
end

% Bilinear Interpolation

for mOut = 1:M*scale                    %Going Down on input
    for nOut = 1:N*scale                %Going Right on output
        nIn1 = floor(nOut*invscale);
        nIn2 = ceil(nOut*invscale);
        
        mIn1 = floor(mOut*invscale);
        mIn2 = ceil(mOut*invscale);
        
        if isinteger(nOut*invscale)                                         % Skip editing the already filled data columns
            continue
        end
        
        if(mIn1 == 0)                                                       % Handle the extreme points
            mIn1 = 1;
        end
        if(mIn2 == M+1)
            mIn1 = M;
        end
        if(nIn1 == 0)                                                       % Handle the extreme points
            nIn1 = 1;
        end
        if(nIn2 == M+1)
            nIn1 = M;
        end

        if(mIn1    ==   mIn2)                                               % Handle Datapoints
            imOut(mOut,nIn) = im( mIn1 , nIn );
            continue;
        end
        if(nIn1 == nIn2)
            continue
        end
        
        % Linear Interpolation on Y direction (right)
        
        y = nOut;
        y1 = nIn1;
        y2 = nIn2;
        x = mOut;
        
        imOut(x,y) = imOut(x,y1)*(y2-y)/(y2-y1) + imOut(x,y2)*(y-y1)/(y2-y1);
    end
end
     

imshow(imOut);
        
    
    
    