function M = step3_update(S, k, LUT, M)
%     M
    for j = 1:k
        S_j = S(LUT==j , :); % the rows of S (samples), which are assigned to 'i' cluster
        %M(j,:) = sum(S_j, 1) ./ size(S,1);
        M(j,:) = mean(S_j, 1);
    end
    
%     LUT
%     S
%     S_j
end
