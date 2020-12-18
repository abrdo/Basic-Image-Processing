function norm_HOG = pmHOG_extractHOG(I)
    % 1
    H = size(I,1);
    W = size(I,2);
    h = H/8;
    w = W/8;
    % 2
    norm_HOG = zeros(h-1,w-1,36);
    % 3
    for j = 1:size(norm_HOG,1)
        for i = 1:size(norm_HOG,2)
            y_start = (j-1)*8+1;
            y_end = (j-1)*8+16;
            x_start = (i-1)*8+1;
            x_end = (i-1)*8+16;
            sub_matrix = I(y_start:y_end,x_start:x_end); % get the block from the image
            sub_matrix = imgaussfilt(sub_matrix,0.1);
            feature_vector = zeros(36,1); % init feature vector
            position = 1; % position in the feature vector
            for cell_idx_j = 1:2 % calculate histogram in every cell in the block
                for cell_idx_i = 1:2
                    cell_y_start = (cell_idx_j-1)*8+1;
                    cell_y_end = (cell_idx_j-1)*8+8;
                    cell_x_start = (cell_idx_i-1)*8+1;
                    cell_x_end = (cell_idx_i-1)*8+8;
                    cell = sub_matrix(cell_y_start:cell_y_end,cell_x_start:cell_x_end); % one cell matrix inside the block
                    [PHI, MAG] = pmHOG_gradient(cell);
                    feature_vector(position:position+8) = pmHOG_binner(PHI, MAG); % append histogram to the feature vector
                    position = position + 9;
                end
            end
            feature_vector = feature_vector / sum(feature_vector); % normalize
            norm_HOG(j,i,:) = feature_vector; % save into the norm_HOG matrix
        end
    end
end
