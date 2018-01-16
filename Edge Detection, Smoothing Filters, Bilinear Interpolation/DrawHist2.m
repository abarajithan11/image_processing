function DrawHist2(imName, numBins)

% Reading the Image
imIn = imread(imName);
imIn = rgb2gray(imIn);
imSize = size(imIn);
h = imSize(1);
w = imSize(2);


binbounds = linspace(0,255, numBins +1);  % Divide 0:255 into numBins range for ease of addition
cumhist = zeros(numBins +1 , 1);          % Initialize array for histY

for i = 2: numBins +1
    cumhist(i) = sum(sum(imIn <= binbounds(i)));    % sum twice to return the entire sum of logical matrix
end

hist = cumhist(2:end) - cumhist(1:end-1);
bincenters = (binbounds(2:end) + binbounds(1:end-1))/2;

bar(bincenters', hist, 0.2);

title 'Manual Histogram';

% Verify

figure
imhist(imIn);