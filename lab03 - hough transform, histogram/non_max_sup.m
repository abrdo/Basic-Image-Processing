function [r_vect, t_vect] = non_max_sup(H, k, p)
    
r_vect = zeros(k);
t_vect = zeros(k);

    for i = 1:k
        [max_values_in_columns, arg_of_max_values_in_columns] = max(H); % the reult is 2 rowvectors
        [maxima, t_max] = max(max_values_in_columns);
        r_max = arg_of_max_values_in_columns(t_max);
        r_vect(i) = r_max;
        t_vect(i) = t_max;
        
        % Kinullazasa H-nak r,t_max középponttal p körnnyezetben
        x1 = max([r_max-p, 1]);
        x2 = min([r_max+p, size(H, 1)]); 
        y1 = max([t_max-p, 1]);
        y2 = min([t_max+p, size(H, 2)]); 
        H(x1:x2, y1:y2) = 0;
    end
    
end