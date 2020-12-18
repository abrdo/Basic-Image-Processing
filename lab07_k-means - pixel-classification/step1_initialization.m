function [LUT, M] = step1_initialization(S, k)
    LUT = zeros(1,k);
    M = zeros(k, size(S,2));
    
    for i = 1:k
        M(i,:) = S(1 + (i-1) * floor(size(S,1)/k), :);
    end
end
