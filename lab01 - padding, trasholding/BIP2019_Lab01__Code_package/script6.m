I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
I = rgb2gray(I);
imgS = size(I)
imshow(I);

row = 150;


figure(1);
subplot(211);
imshow(I);
line([1 imgS(2)],[row, row], 'Color', 'red')

subplot(212);
I(150,:)
plot([1:imgS(2)], I(row,:), 'Color', 'red')
xlabel('column index');
ylabel('pixel intensity value');