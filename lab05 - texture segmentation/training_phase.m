function MODEL = training_phase(T_cell) % training texture-cell
% Computes the texturemodel based on the laws kernels
    % num_of_training_samples - N :
    N = size(T_cell, 2); %size according to 2. dim, because T_cell is a rowvector
    
    MODEL = zeros(N,9); % model init
    
    for n = 1:N
        for k = 1:9
            A = conv2(T_cell{n}, laws_kernel(k), 'same');
            MODEL(n,k) = 1/(size(T_cell{n}, 1)*size(T_cell{n}, 2)) * sum(sum(A.*A));
        end
    end
    
end
