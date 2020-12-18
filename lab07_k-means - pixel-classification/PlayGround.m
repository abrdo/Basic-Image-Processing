% Test the image segmenter implementation
clear; close all; clc;

I = imread('input/duck.jpg');
%I = imread('input/pine.jpg');
%I = imread('input/cat.jpg');
%I = imread('input/Hoci.jpg');
%I = imread('input/greenbox.jpg');
%I = imread('input/bagazs.png');




OriginalImg = I;
I = double(I);
k = 3;


RAND = zeros(k,size(I,3));
for i = 1:k
    for j = 1:size(I,3)
        RAND(i,j) = floor(256*rand());
    end
end








I = OriginalImg;
subplot(2, 2, 1); imshow(uint8(I)); title(['Input (bluring=',num2str(0),')']);
O = image_segmenter(I, k);
subplot(2, 2, 2); imshow(uint8(O)); title(['k=',num2str(k)]);


b = 3;

I = myBlurImg(OriginalImg,b);
subplot(2, 2, 3); imshow(uint8(I)); title(['Input (bluring=',num2str(b),')']);
O = image_segmenter(I, k);
subplot(2, 2, 4); imshow(uint8(O)); title(['k=',num2str(k)]);
    






% figure(1);
% for b = 0:2:4
%     I = myBlurImg(OriginalImg,b);
%     subplot(3, 5, 1+b/2*5); imshow(uint8(I)); title(['Input (bluring=',num2str(b),')']);
%     for k = 2:5
%         O = image_segmenter(I, k);
%         subplot(3, 5, 1+b/2*5 + k-1); imshow(uint8(O)); title(['k=',num2str(k)]);
%     end
% end




% 
% O = image_segmenter(I, k);
% 
% subplot(221); imshow(uint8(I)); title('Input image');
% subplot(222); imshow(uint8(O)); title(['RGB segmented image (k=',num2str(k),')']);
% 
% 
% 
% % blured -------------------------------------------------------
% I = myBlurImg(I,3);
% 
% O = image_segmenter(I, k);
% 
% subplot(223); imshow(uint8(I)); title('Input image');
% subplot(224); imshow(uint8(O)); title(['RGB segmented image (k=',num2str(k),')']);

