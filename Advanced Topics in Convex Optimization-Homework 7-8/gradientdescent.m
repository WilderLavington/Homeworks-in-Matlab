function [x,x_plot,iterations] = gradientdescent(f,gradf,tol,iter,xinit,x_train,y_train)
    x = xinit;
    t_old = rand;
    x_plot = zeros(iter,3);
    iterations = iter;
    for i = 1:iter
        t = linesearch(f,gradf,x,t_old);
        x1 = x - t*gradf(x);
        t_old = t;
        current_error = error_tracking(x1,x_train,y_train);
        if norm(gradf(x1)) < tol
            x = x1;
            x_plot(i:iter,1) = current_error;
            x_plot(i:iter,2) = norm(gradf(x1));
            x_plot(i:iter,3) = norm(f(x1));
            iterations = i;
            break
        end
        x_plot(i,1) = current_error;
        x_plot(i,2) = norm(gradf(x1));
        x_plot(i,3) = norm(f(x1));
        x = x1;
    end
    fprintf('Iterations (vanilla): ')
    disp(i)   
end

