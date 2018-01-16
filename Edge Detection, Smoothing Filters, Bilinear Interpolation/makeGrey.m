 dp = imread('dp.jpg');
 
 sizedp = size(dp);
 
 m = sizedp(1);
 n = sizedp(2);
 
 dpGray = zeros(m,n);
 dpGray = uint8(dpGray);
 
 for i = 1:1:m
     for j = 1:1:n
         dpGray(i,j) = mean(dp(i,j));
     end
 end
 
 imwrite(dpGray, 'dpGray.jpg');
 
     