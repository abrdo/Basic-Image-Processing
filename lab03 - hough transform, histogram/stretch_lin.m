function S = stretch_lin(I) % 'I' must be a grayscale img
    x_min = min(min(I)) % x is the intensity
    x_max = max(max(I))
    
    S = (255.0/double(x_max-x_min)) .* (I-x_min);
    S = cast(S, 'uint8');
    
    
    %S = cast(S, 'uint8');
    %S = uint8(S);
    
%     for i = 1:sI(1)
%         for j = 1:sI(2)
%            S(i,j) = I(i,j)
%         end
%     end
    
end