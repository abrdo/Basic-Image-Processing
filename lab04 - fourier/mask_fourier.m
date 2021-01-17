function newF = mask_fourier(F, x, y, r)
    F = fftshift(F);
    x = round(x); % x, y are vectors
    y = round(y);
    
    for i = 1:max(size(x))
        x_1 = max([1 x(i)-r]);
        x_2 = min([x(i)+r size(F,1)]);
        y_1 = max([1 y(i)-r]);
        y_2 = min([y(i)+r size(F,2)]);
        F(y_1:y_2, x_1:x_2) = 0+0i;
    end
    newF = ifftshift(F);
end
