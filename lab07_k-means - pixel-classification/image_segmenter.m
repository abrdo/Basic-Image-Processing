function [OUT] = image_segmenter(I, k, RAND)
    %S = reshape(I, [size(I,1)*size(I,2), 3]);
    
    % I to S vector conversion
    S = zeros(size(I,1)*size(I,2), 3);
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            S((i-1)*size(I,2) + j, :) = I(i,j,:);
        end
    end
    
    % kmeans segmentatoion
    [LUT, M] = mykmeans(S,k);
    
    % The output LUT (LookUpTable), M (matrix of centroids == mean values) --> OUT img
    OUT = I;
    
    
    %% RANDOM M values
    if nargin == 3
        M = RAND;
    end

    %%
    for i = 1:size(LUT, 2) % = size(I,1)*size(I,2)
        OUT(floor(1+i/size(I,2)), 1+mod(i,size(I,2)), :) = M(LUT(i), :);
    end
end
