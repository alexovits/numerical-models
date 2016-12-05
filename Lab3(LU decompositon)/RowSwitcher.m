function [U,c,P] = RowSwitcher(A,b,)
    n = size(A);
    n = n(1,1);
    P = eye(n,n);
    
        [val, ind] = max(A(j:n,j));
        
        if val == 0
            fprintf('Problem with the max, it is 0\n');
            return;
        end
        
        if ind ~= j
            A([j,j-1+ind],:) = A([j-1+ind,j],:);
            b([j,j-1+ind],:) = b([j-1+ind,j],:);
            P([j,j-1+ind],:) = P([j-1+ind,j],:);
        end
    end
    
    U = A;
    c = b;
end

