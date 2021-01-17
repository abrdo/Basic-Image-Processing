function [H] = my_hough(input_img)
    I = input_img;
    sI = size(I); % n x m -- matrix-like representation
    r_max = round(sqrt(sI(1)*sI(1) + sI(2)*sI(2))) + 1;
    H = zeros(r_max, 180); % r x theta
    
    for x = 1:sI(1)
        for y = 1:sI(2)
            if(I(x,y) ~= 0)
                for theta = 1:180
                    r_val = round(x*cosd(theta) + y*sind(theta));
                    %if r_val == 0
                    %    r_val = 1;
                    %end
                    if(r_val > 0)
                        H(r_val,theta) = H(r_val,theta) + 1;
                    end
                end
            end
        end
    end
    
            
    
end