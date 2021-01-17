function [BGR] = swap_RB_dump(RGB)
    srgb = size(RGB);
    BGR = RGB;
    for i = 1:srgb(1)
        for j = 1:srgb(2)
            BGR(i,j,1) = RGB(i,j,3);
            BGR(i,j,3) = RGB(i,j,1);
        end
    end
end