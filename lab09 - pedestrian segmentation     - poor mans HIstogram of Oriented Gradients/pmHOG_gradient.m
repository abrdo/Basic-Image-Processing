function [PHI, MAG] = pmHOG_gradient(I)   
    % 1
    I = double(I);
    % 2
    H_x = [-1 0 1];
    H_y = [-1; 0; 1];
    % 3
    X = imfilter(I,H_x,'replicate','same');
    Y = imfilter(I,H_y,'replicate','same');
    PHI = rad2deg(atan(Y./X));
    MAG = sqrt(X.^2+Y.^2);
    
end
