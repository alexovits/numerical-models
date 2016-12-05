function [x] = InvertedTriangSolve(U,b)
    n = length(U);
    x = zeros(1,n);
    x(1) = b(1)/U(1,1);
    count = 1;
    for i=2:n
        U(i,i+1:n);
        count = count + 1;
        x(count) = (b(i)-x(1:(count-1))*transpose(U(i,1:i-1)))/U(i,i);
    end
    x = x';
end
