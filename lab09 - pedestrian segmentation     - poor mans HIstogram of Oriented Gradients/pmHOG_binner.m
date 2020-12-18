function H = pmHOG_binner(PHI, MAG)
    % 1
    H = zeros(1,9);
    % 2
    for binindex = 1:9
        mini = -90 + (binindex-1)*20; % min and max value of the specific interval
        maxi = -90 + binindex*20;
        LOG_MASK = (PHI >= mini & PHI < maxi);% select the proper elements from the phi matrix which belong to this bin
        H(binindex) = sum(MAG(LOG_MASK)); % store the corresponding magnitude elements in the actual bin of the histogram
    end
end
