function [y, h, n] = degradation(x)
    h = fspecial('motion', 42, 30);
    n = randn(size(x,1), size(x,2), size(x,3), 'double').*sqrt(0.001);
    
    y = imfilter(x, h, 'replicate', 'same', 'conv') + n;
    
    
    

%     class(n)
%     class(y)
%     class(x)
    
    
%     size(n)
%     size(x)
%     size(imfilter(x, h, 'replicate', 'same', 'conv'))
end
   