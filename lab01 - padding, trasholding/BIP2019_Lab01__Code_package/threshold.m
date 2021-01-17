function [TH] = threshold(IMG, level)
    simg = size(IMG);
    dim = squeeze(size(simg))
    if dim(2) > 2
        warning('the input img is not grayscale');
        IMG = rgb2gray(IMG);
    end
    
    TH = IMG > level;
    TH = TH * 255;
end