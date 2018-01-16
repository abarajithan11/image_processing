classdef Kernel
    
    properties (Constant)
        sobelX = [
            1 0 -1;
            2 0 -2;
            1 0 -1;
            ];
        
        sobelY = sobelX';        
    end
    
    
end