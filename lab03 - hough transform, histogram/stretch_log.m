function SL = stretch_log(I, c)
    I = double(I);
    SL = c .* log(I+1);
    SL = uint8(SL);
    
    x_min = min(min(SL)) % x is the intensity
    x_max = max(max(SL))
    
    SL = (255.0/double(x_max-x_min)) .* (SL-x_min);
    SL = cast(SL, 'uint8');
end