clear; close all; clc;

%I = imread('input/duck.jpg');
%I = imread('input/pine.jpg');
I = imread('input/cat.jpg');

subplot(121); imshow(I);
I = myBlurImg(I,10);
subplot(122); imshow(I);

%imshow(I);