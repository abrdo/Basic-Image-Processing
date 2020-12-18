function LUT = step2_assignment(S, k, LUT, M) % k = size(M,1)
    for i = 1:size(S,1)
        d = ones(1, size(M,1));
        for j = 1:k  % = size(M,1)
            % Calculate distance
            d(1,j) = sum((S(i,:)-M(j,:)).^2);
        end
        [val, ind] = min(d);
        LUT(i) = ind;
    end
    
end
