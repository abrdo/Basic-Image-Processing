
%I = imread('input/Hoci.jpg');
%I = imread('input/greenbox.jpg');
%I = imread('input/duck.jpg');

I = imread('input/cat.jpg');

S = zeros(size(I,1)*size(I,2), 3);
for i = 1:size(I,1)
    for j = 1:size(I,2)
        S((i-1)*size(I,2) + j, :) = I(i,j,:);
    end
end

plot3(S(:,1), S(:,2), S(:,3), '.');
xlabel('red');
ylabel('green');
zlabel('blue');
grid on;