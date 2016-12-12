function[HermitePolinome] = hermite(x, y, y_derivatives, x_0)
    % Getting the length of the inputs points we're trying to interpolate
    m = length(x);
    % Initializing Q coefficience matrix and z doubled input point vector
    z = zeros(1,2*m);
    Q = zeros(2*m,2*m);

    % Calculating the first column of Q coefficience matrix and Z vector
    for i=1:m
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1,1) = y(i);
        Q(2*i,1) = y(i);
        %Every second line is the derivative
        Q(2*i,2) = y_derivatives(i);

        if(i~=1)
            Q(2*i-1,2) = (Q(2*i-1,1) - Q(2*i-2,1)) / (z(2*i-1) - z(2*i-2));
        end
    end

    %Calculate the coefficience values under the side diagonal
    for i=3:2*m
        for j=3:i
            Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (z(i) - z(i-j+1));
        end
    end
    %Calculating the Hermite
    %polinome:Q(0,0)+Q(1,1)*(x-x0)+Q(2,2)*(x-x0)^2...
    %In other form: Q(0,0)+Q(1,1)*(x-z0)+Q(2,2)*(x-z0)*(x-z1)...
    HermitePolinome = Q(1,1);
    
    %Keeping the coefficience updated
    coeff = 1;
    
    for i=2:2*m
        coeff = coeff.*(x_0-z(i-1));
        HermitePolinome = HermitePolinome + Q(i,i) * coeff;
    end
    %hermite([1.3,1.6,1.9],[0.6200860,0.4554022,0.2818186],[-0.5220232,-0.5698959,-0.5811571], 1.5)
end