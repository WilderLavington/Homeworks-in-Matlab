function vector = natural_cubic_spline(x,f,equispaced_pionts)
    % set h
    h = equispaced_pionts(2)-equispaced_pionts(1);
    % construct vandermonde matrix 
    Vandermonde = zeros(length(equispaced_pionts)-2);
    % set first and last row values 
    Vandermonde(1,1) = 2*h/3; Vandermonde(1,2) = h/6; 
    Vandermonde(end,end) = 2*h/3; Vandermonde(end,end-1) = h/6; 
    % set interior values
    for row = 2:length(equispaced_pionts)-3
        Vandermonde(row, row-1) = h/6;
        Vandermonde(row, row) = 2*h/3;
        Vandermonde(row, row+1) = h/6;
    end
    % construct b using newton divided differences
    b = zeros(length(equispaced_pionts)-2,1);
    for row = 1:length(equispaced_pionts) - 2
      x_current = row + 1;
      b(row) = (f(equispaced_pionts(x_current+1)) - f(equispaced_pionts(x_current)))/h - ...
               (f(equispaced_pionts(x_current)) - f(equispaced_pionts(x_current-1)))/h;  
    end
    % solve for new coefficients
    coefficients =  [0; linsolve(Vandermonde,b); 0];
    % evaluate peicewise function
    vector = zeros(length(x),1);
    for x_c = 1:length(x)
        for ii = 1:(length(equispaced_pionts))-1
            if x(x_c) < equispaced_pionts(ii+1) & x(x_c) > equispaced_pionts(ii)
                % m portion
                val = (coefficients(ii)*(equispaced_pionts(ii+1) - x(x_c))^3 + ...
                       coefficients(ii+1)*(x(x_c) - equispaced_pionts(ii))^3)/...
                       (6*h);
                % c and d portion
                val = val + (f(equispaced_pionts(ii))/h - h*coefficients(ii)/6)*(equispaced_pionts(ii+1) - x(x_c));
                val = val + (f(equispaced_pionts(ii+1))/h - h*coefficients(ii+1)/6)*(x(x_c) - equispaced_pionts(ii));
            elseif x(x_c) == equispaced_pionts(ii+1)
                val = f(equispaced_pionts(ii+1));
            elseif x(x_c) == equispaced_pionts(ii)
                val = f(equispaced_pionts(ii));
            end
        end
        vector(x_c) = val;
    end
 
end 