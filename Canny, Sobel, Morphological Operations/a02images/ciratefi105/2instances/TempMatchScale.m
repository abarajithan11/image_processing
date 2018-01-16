function TempMatchScale

minscale = 0;
maxscale = 3;
increment = 0.5;


im = imread('a3.jpg');
im = rgb2gray(im);

q = imread('q3.ppm');
q = rgb2gray(q);

c = zeros(size(im));

scales = minscale: increment :maxscale;

for scaleIndex = 2: size(scales,2)
    
    scale = scales(scaleIndex);
    qscaled = imresize(q,1/scale);
    
    plane = normxcorr2(qscaled,im);
    plane = plane(size(qscaled,1): size(plane,1)  , size(qscaled,2): size(plane,2) );
    
    c(:,:,scaleIndex) = plane;
    
        
end

% Finding coordinates of maximum
[max_val, position] = max(c(:)); 

[ypeak ,xpeak ,rightscaleIndex] = ind2sub(size(c),position);
rightscale = scales(rightscaleIndex);

hFig = figure;
hAx  = axes;                                 % To show a rectangle
imshow(im,'Parent', hAx);
boxsize = size(q) ./ rightscale;


imrect(hAx, [xpeak+1, ypeak+1, boxsize(2), boxsize(1)]);

%%%%%%%%%%     OUTPUT

rightscale
