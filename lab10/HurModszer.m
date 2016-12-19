function HurModszer(F, x0, x1, epsilon, N0)
    
    x2=x0;
    if(N0>0)
        n=2;
        x2=x1-(F(x1)*(x1-x0))/(F(x1)-F(x0));
        while(abs(x2-x1) >= epsilon  && n<=N0)
            x0=x1;
            x1=x2;
            x2=x1-(F(x1)*(x1-x0))/(F(x1)-F(x0));
            n=n+1;
        end
    end
    x2
end