function vector = piecewise_cubic_hermite(x,f,f_p,equispaced_pionts)
    
    % initialize function eval
    vector = zeros(length(x),1);
    
    % iterate through all pionts 
    for x_c = 1:length(x)
        
        % check whether we are in the interior or the ends
        for ii = 1:length(equispaced_pionts)-1
            
            % if in interior solve linear system
            if x(x_c) < equispaced_pionts(ii+1) & x(x_c) > equispaced_pionts(ii)
                current_interval = [equispaced_pionts(ii), equispaced_pionts(ii+1)];
                % construct vandermonde system
                Vandermonde = zeros(4,4);
                for row = 1:2
                    for column = 1:4
                        Vandermonde(row, column) = current_interval(row)^(column-1);
                    end
                end
                for row = 1:2
                    for column = 2:4
                        Vandermonde(row+2, column) = (column - 1)*current_interval(row)^((column)-2);
                    end
                end
                % construct b
                b = zeros(4,1);
                for row = 1:2
                  b(row) = f(current_interval(row));  
                end
                for row = 3:4
                  b(row) = f_p(current_interval(row-2));  
                end
                % solve
                coefficients = flip(linsolve(Vandermonde,b));
                interpolater = @(x) polyval(coefficients,x);
                val = interpolater(x(x_c));
            % else return funciton evals at end pionts
            elseif x(x_c) == equispaced_pionts(ii+1)
                val = f(equispaced_pionts(ii+1));
            elseif x(x_c) == equispaced_pionts(ii)
                val = f(equispaced_pionts(ii));
            end
        end
        vector(x_c) = val;
    end
    
   
end