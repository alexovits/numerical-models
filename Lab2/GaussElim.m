function [U,c] = GaussElim(A,b)

    n = size(A);
    n = n(1,1);
    
    %We need to preprocess our Matrix have max elements on it's diag.
    for j=1:n-1
        [val, ind] = max(A(j:n,j));
        
        if val == 0
            fprintf('Problem with the max, it is 0\n');
            return;
        end
        
        if ind ~= j
            A([j,j-1+ind],:) = A([j-1+ind,j],:);
            b([j,j-1+ind],:) = b([j-1+ind,j],:);
        end
    end
 
    %Eliminate rows under the diag.
    for j=1:n-1
        for i=j+1:n
            b(i) = b(i)-(A(i,j)/A(j,j))*b(j);
            A(i,:) = A(i,:)-(A(i,j)/A(j,j))*A(j,:);
        end
    end
    U = A;
    c = b;
    
    
    
    
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
            b([j,j-1+ind],:) = b([j-1+ind,j],:);
        end
        
        
        for i=j+1:n
            l = A(i,j)/A(j,j);
            A(i,:) = A(i,:)-l*A(j,:);
        end
    end
    
    U = A;
    c = b;
end

