function [x] = UTriangSolve(U,b)
    n = length(U);
    x = zeros(1,n);
    x(1) = b(n)/U(n,n);
    count = 1;
    for i=n-1:-1:1
        U(i,i+1:n);
        count = count + 1;
        x(count) = (b(i)-x(count-1:-1:1)*transpose(U(i,i+1:n)))/U(i,i);
    end
    x = revert(x)';
end

