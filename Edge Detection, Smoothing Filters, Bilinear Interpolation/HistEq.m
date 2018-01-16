function HistEq(imName)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);

% Calculate Histogram

histX = 0:255;
histY = zeros(256);
histT = zeros(256);

for i = 1:h
    for j = 1:w
        I = imIn(i,j)+1;
        histY(I) = histY(I) + 1;
    end
end

% PDF 
% pr = histY/(w*h);

%Transfer Function

Tr = zeros(256);

sum = 0;
for i = 0:255
    sum = sum + histY(i+1);
    Tr(i+1) = sum;
end

Tr = Tr*(255/(w*h));
Tr = uint8(Tr);

% Applying Transfer Function

imOut = uint8(zeros(imSize));

for i = 1:h
    for j = 1:w
        outInt = Tr(imIn(i,j)+1);
        
        imOut(i,j) = outInt;
        histT(outInt+1)  = histT(outInt+1) +1;
    end
end

% Show

figure
subplot(1,2,1);
%plot(histX, histY)
imhist(imIn);
title('Original');

subplot(1,2,2);
%plot(histX, histT)
imhist(imOut);
title('Equalized');

figure
subplot(1,3,1);
imshow(imIn);
title('Original');

subplot(1,3,2);
imshow(imOut);
title('Equalized');

subplot(1,3,3);
imshow(histeq(imIn));
title('Matlab');


% Write

imwrite(imOut, 'dpHistEq.jpg');
imwrite(imIn, 'dpHistEq0.jpg');
    