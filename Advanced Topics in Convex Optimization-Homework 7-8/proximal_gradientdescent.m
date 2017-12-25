function [x,x_plot,iterations] = proximal_gradientdescent(f,gradf,tol,iter,xinit,x_train,y_train,lambda)
    x_old = xinit;
    y = xinit;
    t_old = rand;
    iterations = iter;
    x_plot = zeros(iterations,3);
    for k = 2:iter
        t = linesearch(f,gradf,x_old,t_old);
        floor_abs = abs(y-t*gradf(y))-t*lambda;
        floor_abs(find(floor_abs<0)) = 0;
        x_new = sign(y-t*gradf(y)).*floor_abs;
        x_old = x_new;
        y = x_new + (k-1)/(k+2)*(x_new-x_old);
        %stopping conditions
        current_error = error_tracking(x_new,x_train,y_train);
        if  current_error < tol
            %tracking 
            x_plot(k:iter,1) = current_error;
            x_plot(k:iter,2) = norm(gradf(x_new));
            x_plot(k:iter,3) = norm(f(x_new));
            iterations = k;
            break;
        end
        %tracking 
        x_plot(k,1) = current_error;
        x_plot(k,2) = norm(gradf(x_new));
        x_plot(k,3) = norm(f(x_new));
    end
    x = x_new;
end