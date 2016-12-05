function [U,P,L] = ModGauss(A)
    n = size(A);
    n = n(1,1);
    P = eye(n,n);
    L = zeros(n,n);
    
    %Eliminate rows under the diag.
    for j=1:n-1
        
        [val, ind] = max(abs(A(j:n,j)));
        
        if val == 0
            fprintf('Problem with the max, it is 0\n');
            return;
        end
        
        if j-1+ind ~= j
            A([j,j-1+ind],:) = A([j-1+ind,j],:);
            P([j,j-1+ind],:) = P([j-1+ind,j],:);
            L([j,j-1+ind],:) = L([j-1+ind,j],:);
        end
        
        for i=j:n
            l = A(i,j)/A(j,j);
            L(i,j) = l;
        end
        
        for i=j+1:n
            l = A(i,j)/A(j,j);
            A(i,:) = A(i,:)-l*A(j,:);
            %A(i,j) = l;
        end
    end
    
    U = A;
    L(n,n) = 1;
    
end
