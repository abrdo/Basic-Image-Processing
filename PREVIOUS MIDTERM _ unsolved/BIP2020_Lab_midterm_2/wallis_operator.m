% For the description of the exercise please see the slides.

% -------------------------------------------------------------------------
% BEGIN of initialization, please DO NOT EDIT

close all;
clear;

input_img = imread('./input/AndreKertesz_Paris_ManOnBicycle_part.jpg');

preprocessed_img = mat2gray(input_img);


len = 5; theta = 10; % 5 pixel shift, 10 degress rotate ccw
psf = fspecial('motion', len, theta);
blurred_img = imfilter(preprocessed_img, psf, 'conv', 'replicate');

desired_mean = 128/255;
desired_contrast = 100/255;
A_max = 4;
p = 0.2;
r = 4; % neighborhood radius
label = strcat('$\bar{x}_d=', num2str(desired_mean), ...
    ', \sigma_d=', num2str(desired_contrast), ...
    ', A_{max}=', num2str(A_max), ...
    ', p=', num2str(p), ', r=', num2str(r), '$');

% END of initialization 
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of your code:

local_mean_img = 0; %TODO

local_contrats_img = 0; %TODO

processed_img = 0; %TODO




% END of your code
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% BEGIN of final steps (plot, validation), please DO NOT EDIT

figure;
subplot(1, 3, 1);
imshow(preprocessed_img);
title('original input', 'FontSize', 12, 'FontWeight', 'bold');
subplot(1, 3, 2);
imshow(blurred_img);
title('blurred image', 'FontSize', 12, 'FontWeight', 'bold');
subplot(1, 3, 3);
imshow(processed_img);
title('Wallis filtered image', 'FontSize', 12, ...
    'FontWeight', 'bold');
xlabel(label, 'Interpreter', 'Latex');

% END of final steps
% -------------------------------------------------------------------------

