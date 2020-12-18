function [LUT, M] = mykmeans(S, k)
    
    [LUT, M] = step1_initialization(S,k);
    
    t = 1;
    while true
        M_prev = M;
        LUT = step2_assignment(S,k,LUT,M);
        M = step3_update(S,k,LUT,M);
        
        if sum(sum((M-M_prev).^2)) < 0.02   % converged
            fprintf('Iteration finished after %d steps.\n', t);
            break;
        elseif  t == 100
            fprintf('Iteration finished after %d steps. So not converged with eps = 0.02 error rate.\n', t);
            break;
        end
        t = t+1;
    end
    

end
