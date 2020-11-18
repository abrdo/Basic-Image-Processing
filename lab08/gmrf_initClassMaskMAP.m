function mrf=gmrf_initClassMaskMAP(mrf)

 cmap = load('MRF_colormap.mat'); % the colormap
    h = mrf.imagesize(1);         % height of the image
    w = mrf.imagesize(2);         % width of the image
 cnum = mrf.classnum;             % number of classes

    for y=1:h
        for x=1:w

            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             BELOW THIS LINE            %
            %                                        %
            % ====================================== %
            
            
            
            tmpvector = zeros(mrf.classnum,1); % init the tmp vector for store the classvalues at each pixel
            for cind = 1:mrf.classnum
                tmpvector(cind) = mrf.logProbs{cind}(y,x);
            end
            [minval, minind] = min(tmpvector); 
            
            
            
            
            
            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             ABOVE THIS LINE            %
            %                                        %
            % ====================================== %             
            
            mrf.classmask(y,x) = minind;
            
        end
    end
    
    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));

end