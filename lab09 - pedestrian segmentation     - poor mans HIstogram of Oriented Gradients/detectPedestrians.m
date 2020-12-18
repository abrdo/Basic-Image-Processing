function [score] = detectPedestrians(I, sample_HOG)
    % 1
    HOG = pmHOG_extractHOG(I);
    HOG = HOG.*sample_HOG;
    LOG_MASK = HOG < 0.01;
    HOG(LOG_MASK) = 0;
    score = nansum(HOG(:));
end
