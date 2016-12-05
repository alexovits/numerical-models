function [isConvergent] = Convergent(A)
    isConvergent = 1;
    n = length(A);
    %Soronkentin dominancia
    for i=1:n
        rowSum = sum(abs(A(i,:)))-abs(A(i,i));
        if rowSum > abs(A(i,i))
            isConvergent = 0;
            break
        end
    end
end

