function TempMatch

im = imread('a3.jpg');
im = rgb2gray(im);

q = imread('q3.ppm');
q = rgb2gray(q);


c = normxcorr2(q,im);           %Shows the 3d map
figure, surf(c), shading flat

[ypeak, xpeak ] = find( c == max(c(:)));     % Find the peak point

yoffSet = ypeak-size(q,1);                   % Matching is done orderly, so returns the 
xoffSet = xpeak-size(q,2);                   % bottom right corner

hFig = figure;
hAx  = axes;                                 % To show a rectangle
imshow(im,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(q,2), size(q,1)]);






% Ans;
% name = 'Temp Match.jpg';
% 
% figure
% subplot(1,2,1);
% imshow(mat2gray(im));
% title 'Input';
% 
% subplot(1,2,2);
% imshow(mat2gray(Ans));
% title 'Output';
% 
% imwrite(mat2gray(Ans), name);
% c = c + 1;