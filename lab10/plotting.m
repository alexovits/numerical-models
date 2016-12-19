%0-0.8
function plotting(F, Fd, epsilon, N0)

    interval=0:0.01:0.8;

    hold on;
    
    plot(interval, F(interval), 'r');
    
    for i = 0:1.001:0.8
        x0 = NewtonModszer(F, Fd, i-0.001, epsilon, N0);
        x = NewtonModszer(F, Fd, i, epsilon, N0);
        plot([i-0.001 i], [x0 x], 'b');
    end
    
    axis([0 0.8 0 0.8]);
    
    
end