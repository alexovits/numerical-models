function x = NewtonModszer(F, Fd, x0, epsilon, N0)
    
    x=x0;
    
    if(N0>0)
        n=2;
        x=x0-F(x0)/Fd(x0);
        while(abs(x-x0) >= epsilon  && n<=N0)
            x0=x;
            x=x0-F(x0)/Fd(x0);
            n=n+1;
        end
    end

end