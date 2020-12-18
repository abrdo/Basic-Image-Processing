close all;
clear; clc;

%I = imread('./input/gt.png');
I = imread('./input/sample1.png');
I(4,:) = 0;
I(:,4) = 255;

H = pmHOG_extractHOG(I);

figure;
imshow(I, 'InitialMagnification', 'fit');
hold on;
plotHOG(H);
