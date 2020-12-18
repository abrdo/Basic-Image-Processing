function ClassMap = recognition_phase(I, MODEL)
    BB = zeros(size(I,1), size(I, 2), 9);
    for k = 1:9
        B = conv2(I, laws_kernel(k), 'same');
        B_squared_avg = conv2(B.^2, (1/(15*15)).*ones(15), 'same');
        BB(:, :, k) = B_squared_avg;
    end

    
    ClassMap = zeros(size(I,1), size(I,2));
    sum_abs_diff = zeros(size(MODEL,1),1);
    for x = 1:size(I,1)
        for y = 1:size(I,2)
            for n = 1:size(MODEL, 1) % texture classes
%                 aa = transpose(squeeze(BB(x,y,:)));
%                 bb = squeeze(MODEL(n,:));
%                 a = transpose(squeeze(BB(x,y,:))) - squeeze(MODEL(n,:));
%                 b = sum(a);
                sum_abs_diff(n)  =  sum(abs( transpose(squeeze(BB(x,y,:))) - squeeze(MODEL(n,:)) ));
            end
            [minval, TextureClassIndex] = min(sum_abs_diff);
            ClassMap(x,y) = TextureClassIndex;
            
        end
    end
end
