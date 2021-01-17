function pine = find_the_pine(I)
    %cast(I, 'double');
    %I = I./255;
    I = rgb2hsv(I);
    % I is in hsv color space
    pine = ((I(:,:,1)<0.15)) > 0;
    
%     figure(1)
%     subplot(311)
%     histogram(I(:,:,1))
%     subplot(312)
%     histogram(I(:,:,2))
%     subplot(313)
%     histogram(I(:,:,3))
end