function lab1_2 = lab1_2(fgv,val)
    if fgv == 'sin'
        eps = 0.001;
        x = val;
        x = mod(x,2*pi);
        sinx = 0;
        n = -1;
        tmp = eps;
        while(abs(tmp) >= eps)
            n = n + 1
            sign = ((-1)^n);
            div = x^((2*n)+1);
            den = factorial((2*n)+1);
            tmp = (sign*div)/den;
            sinx = sinx + tmp;
        end
        disp('Calculated value:');
        disp(sinx);
        disp('Built in value:');
        sin(x)
    else
        if fgv == 'cos'
            eps = 0.0001;
            x = val;
            cosx = 0;
            x = mod(x,2*pi);
            n = -1;
            tmp = eps;
            while(abs(tmp) >= eps)
                n = n + 1;
                sign = ((-1)^n);
                div = x^(2*n);
                den = factorial(2*n);
                tmp = (sign*div)/den;
                cosx = cosx + tmp;
            end
            disp('Calculated value:');
            disp(cosx);
            disp('Built in value:');
            cos(x)
        else
            disp('Unreckognized input');
        end
    end
    