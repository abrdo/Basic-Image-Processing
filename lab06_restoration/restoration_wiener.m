function [x_tilde] = restoration_wiener(y, h, n)
    Y = fft2(y);
    H = psf2otf(h, [size(Y,1), size(Y,2)]);
    N = psf2otf(n, [size(Y,1), size(Y,2)]);
    
    P_XX_appr = Y.*conj(Y);
    P_NN = N.*conj(N);
    
    
    P_NN./P_XX_appr;
    abs(H).^2 + P_NN./P_XX_appr;
    R = conj(H) ./ (abs(H).^2 + P_NN./P_XX_appr);
    
    x_tilde = abs(ifft2(R.*Y));
end
