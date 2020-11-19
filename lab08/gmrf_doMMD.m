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
        cycle = cycle + 1;
        
        for y = 1:h
            for x = 1:w
                % CURRENT
                currLabel = mrf.classmask(y,x);
                %%%
                
                neighbourLabels = zeros(3,3);
                y1 = 1;
                y2 = 3;
                x1 = 1;
                x2 = 3;
                if y-1 < 1
                    y1 = 2;
                end
                if mrf.imagesize(1) < y+1
                    y2 = 2;
                end
                if x-1 < 1
                    x1 = 2;
                end
                if mrf.imagesize(2) < x+1
                    x2 = 2;
                end
                neighbourLabels(y1:y2, x1:x2) = mrf.classmask(max([y-1 1]) : min(y+1,mrf.imagesize(1)),   max([x-1 1]) : min(x+1, mrf.imagesize(2)));
                
                
                
                curr_posterior = mrf.logProbs{currLabel}(y, x);
                tmp = -beta .* (neighbourLabels == currLabel) + beta .* (neighbourLabels ~= currLabel & neighbourLabels ~= 0);
                curr_prior = beta +    sum(sum(tmp));
                
                % NEW TRIAL
                tryalLabel = currLabel;
                while isequal(tryalLabel, currLabel)
                    tryalLabel = randi(cnum);
                end
                
                
                tryal_posterior = mrf.logProbs{tryalLabel}(y,x);
                tryal_prior = beta +    sum(sum(-beta .* (neighbourLabels == tryalLabel) + beta .* (neighbourLabels ~= tryalLabel & neighbourLabels ~= 0)));
               
                % ENERGY FUNCTION
                curr_U = curr_posterior + curr_prior;
                tryal_U = tryal_posterior + tryal_prior;
                
                dU = tryal_U - curr_U;
                
                % accept?
                if dU < 0 || (dU > 0 && rand < exp(-dU/T))
                    mrf.classmask(y,x) = tryalLabel;
                    summa_deltaE = summa_deltaE + abs(dU);
                end
                
            end
        end
        T = c*T;
        
        
        
        
        
%                 % NEW TRIAL
%                 while true
%                     changeY = ceil(3*rand);
%                     changeX = ceil(3*rand);
%                     if (~(changeX == 2 & changeY == 2) & neighbourLabels(changeY, changeX)~=0)
%                         break;
%                     end
%                 end
%                 
%                 
%                 tryal_neighbourLabels = neighbourLabels;
%                 while isequal(tryal_neighbourLabels, neighbourLabels)
%                     tryal_neighbourLabels(changeY, changeX) = ceil(mrf.classnum*rand);
%                 end
%                 
%                 
%                 tryal_posterior = curr_posterior;
%                 tryal_prior = beta +    sum(sum(-beta .* (tryal_neighbourLabels == currLabel) + beta .* (tryal_neighbourLabels ~= currLabel & tryal_neighbourLabels ~= 0)));
%                
%                 % ENERGY FUNCTION
%                 curr_U = curr_posterior + curr_prior;
%                 tryal_U = tryal_posterior + tryal_prior;
%                 
%                 dU = tryal_U - curr_U;
%                 
%                 % accept?
%                 if dU < 0 || (dU > 0 && rand < exp(-dU/T))
%                     mrf.classmask(y+changeY-2, x+changeX-2) = tryal_neighbourLabels(changeY, changeX);
%                     summa_deltaE = summa_deltaE + abs(dU);
%                 end
        
        
        
        
        
        
        
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
