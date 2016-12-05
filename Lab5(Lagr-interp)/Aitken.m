function [Q] = Aitken(X,Y,desired_x,eps)
k = length(X);
Q = zeros(k,k);
got_accuracy = false;

dist_x = zeros(1,k);
%Creating the distance vector
for i=1:k
    dist_x(i) = abs(X(i) - desired_x);
end

[dist_x,indices] = sort(dist_x);

%Switching the X & Y vectors as well
X_new = zeros(1,k);
Y_new = zeros(1,k);
for i=1:k
    X_new(i) = X(indices(i));
    Y_new(i) = Y(indices(i));
end
Y = Y_new;
X = X_new;

for i=1:k
    Q(i,1) = Y(i); 
end

for j=2:k
    for i=j:k
        Q(i,j) = ((Q(j-1,j-1)*(X(i)-desired_x)) - (Q(i,j-1)*(X(j-1)-desired_x)))/(X(i)-X(j-1));        
    end
    
    %Halt if we reached the given accuracy
    if(abs(Q(j,j)-Q(j-1,j-1))<eps) 
        abs(Q(j,j)-Q(j-1,j-1))
        got_accuracy = true;
        break;
    end
end

if(~got_accuracy)
    disp('Error! Accuracy not reached');
end

end

