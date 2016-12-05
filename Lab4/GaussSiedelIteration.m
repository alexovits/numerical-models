function [x,iter] = GaussSiedelIteration( A,b,eps )
    n = length(A);
    U = zeros(n,n);
    D = zeros(n,n);
    L = zeros(n,n);
    x = zeros(n,1);

    for i=1:n
        D(i,i) = A(i,i);% Lehetne diag(diag(A))
        U(i,i+1:n) = -A(i,i+1:n);%triu(A,1) az 1 kell a foatlo kiugrasara
        L(i,1:i-1) = -A(i,1:i-1);%tril(A,-1) -||-
    end

    %P = D-L;
    B = inv(D-L) * U;
    f = inv(D-L) * b;
    x_prev = x;
    x = B*x - f;

    %For counting iterations
    iter = 1;

    stop_cond = eps*(1-norm(B))/norm(B);
    while(norm(x-x_prev)>=stop_cond)
        iter = iter + 1;
        x_prev = x;
        x = B*x + f;
    end
    iter
end

