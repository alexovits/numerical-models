function [] = LUP_decomp()
    %A = [1 3 5;2 4 7;1 1 0];
    %A = [11 9 24 2; 1 5 2 6; 3 17 18 1; 2 5 7 1];
    %b = [1 2; 1 2; 1 9];
    %A = [3 1 6; 2 1 3; 1 1 1];
    A = [10 20 30; 8 1 3; 2 3 9];
    b = [2;3;7];
    
    [U,P,L] = ModGauss(A);

    P*A;
    L*U;
    
    y = InvertedTriangSolve(L,P*b)
    L\(P*b)
    U\y
    x = UTriangSolve(U,y)
end

