function [vector] = revert(v)
%REVERT Summary of this function goes here
%   Detailed explanation goes here
    n = length(v);
    vector = zeros(1,n);
    for i=1:n
        vector(i) = v(n-i+1);
    end

end

