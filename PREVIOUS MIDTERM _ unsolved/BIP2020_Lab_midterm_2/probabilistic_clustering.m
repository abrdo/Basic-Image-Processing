% For the description of the exercise please see the slides.

% -------------------------------------------------------------------------
% BEGIN of initialization, please DO NOT EDIT
close all;
clear;

input_img = imread('./input/trin3.bmp');

% END of initialization 
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of your code:

regions = []; % Define them as you wish

clustered_img = 0; %TODO


% END of your code
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of final steps (plot, validation), please DO NOT EDIT

figure(2);
subplot(121);
imshow(input_img);
title('Input image');
subplot(122);
imagesc(clustered_img);
title('Clustered image');
axis off equal;
colormap gray;