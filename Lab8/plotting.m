function plotting(F, begin, endi, pre)

    p = linspace(begin, endi, pre);
    x = begin:0.5:endi;
    %[alfa, beta, gamma, delta] = Spline(x, F(x));
    %[S] = SplinePolinom(x ,alfa, beta, gamma, delta, p);
    [S] = Spline(x, F(x), p)
    
    hold on;
    plot(p, F(p), 'r-');
    plot(p, S, 'g-');
    %axis([begin endi begin endi]);
end

%plotting(@(x) x.^2,1,10,10)