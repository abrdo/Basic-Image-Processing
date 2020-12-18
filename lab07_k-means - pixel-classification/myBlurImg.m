function [OUT] = myBlurImg(I,w)
    OUT = I;
    if w <= 0
        return;
    end
    
    I = padarray(I, [w,w], 'replicate');
    
    for i = 1+w : size(I,1)-w
        for j = 1+w : size(I,2)-w
            OUT(i-w,j-w,:) = (mean(mean( I(i-w:i+w, j-w:j+w, :))));
        end
    end
end

