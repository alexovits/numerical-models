function [integration_approx] = Romberg(Func, a, b, epsilon, iter_max)
    %The initialization of h step between points in [a,b]
    h=b-a;
    h=h/2;
    
    %Calcualte first two element of the recursive function
    Q_prev = h * (Func(a)+Func(b));
    Q_current = ((1/2) * Q_prev)+(h*Func(a+h));
    %Since the first two are already calculated
    k=2;
    h=h/2;
    
    %Until we reach a certain accuracy we keep increasing the splits
    while ((abs(Q_current - Q_prev) >= epsilon) && (k<=iter_max))
        Q_prev=Q_current;
        approximation_sum=0;
        %Go through every part of the new split up
        for j=1:2^(k-1)
            approximation_sum = approximation_sum + Func(a+(2*j-1)*h);
        end
        
        %Applying the recursive function
        Q_current = 1/2*Q_prev+(approximation_sum*h); 
        h=h/2;
        
        %Increase number if splits
        k = k+1;
    end
    
    integration_approx = Q_prev;
end

%Romberg(@(x) x.^2, 2,8,0.01, 1000)