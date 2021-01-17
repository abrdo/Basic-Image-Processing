function [PAD] = pad_image(varargin)
    if nargin == 1
        r = 10;
    elseif nargin == 2
        r = varargin{2};
    else
        warning('Unexpected number of arguments.')
    end
    img = varargin{1};
    %imshow(img);
    imgS = size(img);
    dim = squeeze(size(imgS));
    %disp(imgS);
    if dim(2) > 2
        warning('The input img is not grayscale');
        img = rgb2gray(img);
    end
        
    PAD = zeros(imgS(1)+2*r, imgS(2)+2*r);
    PAD(r+1:end-r, r+1:end-r) = img;
        %PAD = PAD*255;
    %PAD(100:200, 100:200) = 10;
%     PAD = img;
%     imshow(img);
%     size(PAD)
%     size(img)
    
    
end