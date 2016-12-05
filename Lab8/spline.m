function [Q] = hermite(X,Y,desired_x)
n = length(X);
Q = zeros(n,n);

%Creating the distance vector
Q(:,1) = Y;
m = n;
for j=2:n
    m = m - 1;
    for i=1:m
        Q(i,j) = (Q(i+1,j-1) - Q(i,j-1))/(X(i+j-1)-X(i));
    end
end

%Osztott diferencial altali kiszamitasa a Lagrange polinom newton alakkal
sum = 0;
for i=2:n
    prod = 1;
    for j=1:i-1
        prod = prod * (desired_x - X(j));
    end
    prod = prod * Q(1,i);
    sum = sum + prod;
end
sum = sum + Y(1)

end

