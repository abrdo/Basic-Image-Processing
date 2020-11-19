function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        summa_deltaE = 0;
        cycle = cycle +1;
        for y = 1:h
            for x = 1:w
                % ACTUAL
                classlabel_act = mrf.classmask(y,x);
                y1 = max([1 y-1]);
                y2 = min([h y+1]);
                x1 = max([1 x-1]);
                x2 = min([w x+1]);
                neighbors_act = mrf.classmask(y1:y2,x1:x2); % it contains the original point
                neighbors_act = neighbors_act(:);
        
                posteriorprobability_act = mrf.logProbs{classlabel_act}(y,x);
                priorprobability_act = 0; % init prior
                for i = 1:size(neighbors_act)
                    if neighbors_act(i) == classlabel_act
                        priorprobability_act = priorprobability_act - beta;
                    elseif neighbors_act(i) ~= classlabel_act
                        priorprobability_act = priorprobability_act + beta;
                    end
                end
                priorprobability_act = priorprobability_act + beta; % compensate the original point
                
                % NEW
                classlabel_new = classlabel_act; % pick a label which is different from currentclasslabel
                while classlabel_new == classlabel_act
                    classlabel_new = randi(cnum);
                end
                posteriorprobability_new = mrf.logProbs{classlabel_new}(y,x);
                priorprobability_new = 0; % init prior
                for i = 1:size(neighbors_act)
                    if neighbors_act(i) == classlabel_new
                        priorprobability_new = priorprobability_new - beta;
                    elseif neighbors_act(i) ~= classlabel_new
                        priorprobability_new = priorprobability_new + beta;
                    end
                end
                priorprobability_new = priorprobability_new + beta; % compensate the original point
                
                % COMPUTE ENERGY
                U_act = posteriorprobability_act + priorprobability_act;
                U_new = posteriorprobability_new + priorprobability_new;
                dU = U_new - U_act;
                
                if dU < 0 || (dU > 0 && rand < exp(-dU/T))
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y,x) = classlabel_new;
                end
            end
        end
        T = T*c;
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
