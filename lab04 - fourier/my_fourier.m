function [F] = my_fourier(I)
    F = complex(zeros(size(I, 1), size(I, 2)));
    for k1 = 0:size(F, 1)-1
        for k2 = 0:size(F, 2)-1
            for n1 = 0:size(I, 1)-1
                for n2 = 0:size(I, 2)-1
                    F(k1+1, k2+1) = F(k1+1, k2+1) + I(n1+1, n2+1)*exp(-1j*(2*pi/size(I, 1))*k1*n1)*exp(-1j*(2*pi/size(I, 2))*k2*n2);
                end
            end
        end
    end
end
