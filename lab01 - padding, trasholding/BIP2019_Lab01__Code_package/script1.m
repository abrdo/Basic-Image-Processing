im = imread('input/AlfredoBorba_TuscanLandscape.jpg');
%imshow(im);
size_im = size(im);
isColor = size_im(3) == 3;

grayim = rgb2gray(im);
%imshow(grayim);

imwrite(grayim, 'output/AlfredoBorba_TuscanLandscape_GRAY.jpg');