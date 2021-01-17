function output_img = myconv(input_img, kernel)
    output_img = input_img;
    a = (size(kernel, 1)-1)/2;
    b = (size(kernel, 2)-1)/2;
    input_img = padarray(input_img, [a,b], 0);
    kernel = rot90(kernel, 2);
    
    for i = a+1:(size(input_img, 1)-a)
        for j = b+1:(size(input_img, 2)-b)
            product_mx = input_img(i-a:i+a, j-b:j+b) .* kernel;
            output_img(i-a,j-b) = sum(product_mx, [1,2]);
        end
    end
end
