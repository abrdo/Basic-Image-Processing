function duck = find_the_duck(I)
    duck = ((I(:,:,3)<100) + (I(:,:,1)>100))>0;
end