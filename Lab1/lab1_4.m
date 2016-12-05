function lab1_4 = lab1_4()
    A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
    B = transpose([32 23 33 31]);
    disp('Eredmeny:')
    x = A\B
    disp('Inverz:')
    inv(A)
    disp('Determinant:')
    det(A)
    disp('Perturbe:')
    %A = [10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.89];
    pB = transpose([32.1 22.9 33.1 30.9]);
    px = A\pB
    disp('Rel. bemeno hiba: ')
    disp(norm(pB-B)/norm(B))
    disp('Rel. kimeno hiba: ')
    disp(norm(px-x)/norm(x))
    disp('Mert a kondicioszam: ')
    disp(norm(A)*norm(inv(A)))
    
    
    
    
    
    