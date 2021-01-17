function output_img = myconv(input_img, kernel)
    output_img = input_img;
    k = (size(kernel, 1)-1)/2;
    input_img = padarray(input_img, [k,k], 0);
    kernel = rot90(kernel, 2);
    
    for i = k+1:(size(input_img, 1)-k)
        for j = k+1:(size(input_img, 2)-k)
            product_mx = input_img(i-k:i+k, j-k:j+k) .* kernel;
            output_img(i-k,j-k) = sum(product_mx, [1,2]);
        end
    end
end
