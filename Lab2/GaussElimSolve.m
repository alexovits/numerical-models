function [] = GaussElimSolve(A,b)
    A = [10 20 30; 8 1 3; 2 3 9];
    b = [2;3;7];
    if(rank(A) == length(b))
        A\b
        [U,c] = GaussElim(A,b);
        UTriangSolve(U,c)
    else
        fprintf('There was an error. Equation is incompatible.\n')
    end
end

