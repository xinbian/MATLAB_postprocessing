function [spec] = calcSpec(pi)
    cascLen = length(pi);
    spec(1:cascLen-1) = 0 ;
    for i = 1: cascLen -1
        spec(i) = pi(i+1) - pi(i);    
    end
        
end
