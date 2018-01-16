im = [
    1 2 3
    10 20 30
    1 2 3
    ];

size1 = size(im);
M = size1(1);
N = size1(2);

scale = 2;
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
        y = nIn*scale;
        
        if(y == N+1)
            continue
        end
        
        imOut (x, y) = im(x1,y_)*(x2-x)/(x2-x1) + im(x2,y_)*(x-x2)/(x2-x1);
    end
end


im
imOut