function out_img = blur_edge(in_img)
    IN = fft2(in_img); 
    
    h = fspecial('gaussian', 60, 10);
    H = psf2otf(h, [size(in_img,1), size(in_img,2)]);
    
    blurred_img = abs(ifft2(H.*IN));
    
    wm = ones(70,70);
    wm = padarray(wm, [1 1], 0);
    wm2 = imresize(wm, [size(in_img,1), size(in_img,2)], 'bilinear');
    
    %imshow(wm2);
    
    wm2 = mat2gray(wm2, [0,1]);
    
    Ones = ones(size(in_img,1), size(in_img,2));
    out_img = in_img.*wm2 + blurred_img.*(Ones-wm2);
    
    %imshow(in_img.*wm2); %OK
    %imshow(blurred_img.*(Ones-wm2));
    %imshow(blurred_img);
    
end
