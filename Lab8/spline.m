function [y_0] = Spline(x, y, x_0)
    n = length(x);

    % Distance between points on x-axis
    h = zeros(1,n);
    % Coefficience of the spline cubic function
    alfa = zeros(1, n);
    beta = zeros(1, n);
    gamma = zeros(1, n);
    delta = zeros(1, n);

    % Initializing h vector
    for j=1:n-1
        h(j+1) = x(j+1) - x(j);
    end

    % The coeff for the xj limes from right=left equation
    lambda  = zeros(1, n);
    mu = zeros(1, n);
    d = zeros(1, n);

    % Natural spline initialization
    lambda(1) = 1;
    d(1) = 0;
    mu(n) = 1;
    d(n) = 0;
    % From the above values we know that
    mu(1) = 0; %lambda(1)-1
    lambda(n) = 0; %lambda(n) = 1-mu(n)
    %Since we know the first and last value
    for j = 2 : n-1
        lambda(j) = h(j+1)/(h(j) + h(j+1));
        mu(j) = 1 - lambda(j);
        d(j) = (6/((h(j) + h(j+1))) * (((y(j+1) - y(j))/(h(j+1))) - ((y(j) - y(j-1))/(h(j)))));
    end

    %Constructing the tridiagonal matrix
    Ms = spdiags([mu', 2*ones(n,1), lambda'], -1:1, n, n);
    %Solving the system with built in function
    %The results are basically the second order derivate for the corresponding index
    M = Ms\d';
    %Calculating the function coeff. for between each pair of knot
    %This is why we only go until n-1
    for j = 1 : n-1
        alfa(j) = y(j);
        beta(j) = ((y(j+1)-y(j))/h(j+1)) - (((2*M(j) + M(j+1))/6) * h(j+1));
        gamma(j) = M(j)/2;
        delta(j) = (M(j+1) - M(j)) / (6*h(j+1));
    end

    %Search for the point's interval and approximate it's y
    %n = length(x_0)
    %y_0 = zeros(1,n)
    %for i=1:n
    %    j = 1;
    %    while x_0(i) < x(j)
    %        j = j+1;
    %    end
    %    y_0(i) = alfa(j) + beta(j)*(x_0(i) - x(j)) + gamma(j)*(x_0(i) - x(j))*(x_0(i) - x(j)) + delta(j)*(x_0(i) - x(j))*(x_0(i) - x(j))*(x_0(i) - x(j));
    %end

    n = length(x_0);
    y_0 = zeros(1, n);

    for i = 1:n
        x_0(i)
        I = find(x_0(i) >= x)
        % The last index of the element that was smaller than x_0(i)
        % meaning the bottom of the interval [I(end),I(end+1)]
        j = I(end);
        if(j == length(x))
            j = j-1;
        end
        y_0(i) = alfa(j) + beta(j)*(x_0(i) - x(j)) + gamma(j)*(x_0(i) - x(j))*(x_0(i) - x(j)) + delta(j)*(x_0(i) - x(j))*(x_0(i) - x(j))*(x_0(i) - x(j));
    end


end
