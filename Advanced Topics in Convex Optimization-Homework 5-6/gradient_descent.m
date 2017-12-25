function [x_new] = gradient_descent( f,grad_f,tol,iter,x_0)
    x_new = x_0;
    t_old = rand(1);
    for i = 1:iter
        t = linesearch(f,grad_f,x_new,t_old);
        x1 = x_new - t*grad_f(x_new);
        t_old = t;
        if norm(x1-x_new) < tol
            x_new = x1;
            break
        end
        x_new = x1;
    end
end

