function imOut = ConStrech(imName, x1,y1, x2,y2)

% Line equations

% For L1
% y = (y1/x1)*x
% Hence: m1 = (y1/x1)

% For L2
% y = ((y2-y1)/(x2-x1)) * (x-x1) + y1
% Hence: m2 = (y2-y1)/(x2-x1)     |         c2 = -x1*m2 +y1

% For L3
% y = ((255-y2)/(255-x2)) * (x-x2) + y2
% Hence: m3 = (255-y2)/(255-x2)   |         c3 = -x2*m3 +y2


% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);
imOut = uint8(zeros(h,w));

% main fucntion

m1 = (y1/x1);
c1 = 0;
m2 = (y2-y1)/(x2-x1);
c2 = -x1*m2 +y1;
m3 = (255-y2)/(255-x2);
c3 = -x2*m3 +y2;

for i = 1:h
    for j = 1:w
        m = 0;
        c = 0;
        p = imIn(i,j);
        
        if p < x1
            m = m1;
            c = c1;
        elseif p < x2
            m = m2;
            c = c2;
        else
            m = m3;
            c = c3;
        end
        
        imOut(i,j) = m * p + c;
    end
end

% Showing the Image

subplot (1,2,1)
imshow(imIn);
title('Original');

subplot (1,2,2)
imshow(imOut);
title('Processed');

imwrite(imOut, 'conStreched.jpg');

% Plotting the Transfer Function

inp = 0:1:255;
outp = 0:1:255;

for i = 1:255
    m = 0;
    c = 0;
    p = inp(i);
    
        if p < x1
            m = m1;
            c = c1;
        elseif p < x2
            m = m2;
            c = c2;
        else
            m = m3;
            c = c3;
        end
     outp(i) = m* p + c;
end

figure
plot(inp,outp)
title 'Transfer Fucntion';
axis ([0 255 0 255])