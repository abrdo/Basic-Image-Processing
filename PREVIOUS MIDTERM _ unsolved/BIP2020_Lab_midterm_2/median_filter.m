% For the description of the exercise please see the slides.

% -------------------------------------------------------------------------
% BEGIN of initialization, please DO NOT EDIT
close all;
clear;

input_img = imread('./input/AndreKertesz_Paris_ManOnBicycle_part.jpg');
input_img = mat2gray(input_img);

noisy_img = imnoise(input_img,'salt & pepper');

% END of initialization 
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of your code:

filtered_img = 0; %TODO


% END of your code
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of final steps (plot, validation), please DO NOT EDIT

figure(3);
subplot(1, 2, 1);
imshow(noisy_img);
title('Original, noisy image');
subplot(1, 2, 2);
imshow(filtered_img);
title('Median filtered image');