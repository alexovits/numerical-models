function plotting(F, Fd, start, endi, pre)
    z = linspace(start, endi, pre);
    x = start:endi;
    [H] = hermite(x ,F(x), Fd(x), z);
    hold on;
    plot(z, F(z), 'r-');
    plot(z, H, 'b-');
    axis([start endi start endi]);
end
%plotting(@(x) (x.^2),@(x) 2*x,0,5,100)