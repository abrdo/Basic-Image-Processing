function hist_vector = calc_hist_vector(input_img) % the img must be a grayscale img
    hist_vector = zeros(256);
    sI = size(input_img);
    for i = 1:sI(1)
        for j = 1:sI(2)
            hist_vector(input_img(i,j)+1) = hist_vector(input_img(i,j)+1) + 1;
        end
    end
    
end