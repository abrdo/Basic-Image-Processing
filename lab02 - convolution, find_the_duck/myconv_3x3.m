function output_img = myconv(input_img, kernel)
    output_img = input_img;
    input_img = padarray(input_img, [1,1], 0);
    kernel = rot90(kernel, 2);
    
    for i = 2:(size(input_img, 1)-1)
        for j = 2:(size(input_img, 2)-1)
            product_mx = input_img(i-1:i+1, j-1:j+1) .* kernel;
            output_img(i-1,j-1) = sum(product_mx, [1,2]);
        end
    end
    
end
