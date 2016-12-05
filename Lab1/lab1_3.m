function lab1_3 = lab1_3(n)
    for i=1:n
        H = hilbert(i);
        disp(i)
        disp(norm(H)*norm(inv(H)))
        %cond(H)
    end