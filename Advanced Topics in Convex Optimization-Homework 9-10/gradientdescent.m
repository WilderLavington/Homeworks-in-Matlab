function [x,iterations] = gradientdescent(f,gradf,prox,tol,iter,xinit)
    x = xinit;
    t_old = rand;
    iterations = iter;
    for i = 1:iter
        % find optimal move value
        t = linesearch(f,gradf,x,t_old);
        % gradient update
        x1 = x - t*gradf(x);
        % project onto the prox 
        x1 = prox(x1);
        % update linesearch
        t_old = t;
        if norm(x1-x,2) < tol
            x = x1;
            iterations = i;
            break
        end
        x = x1;
    end
    fprintf('Iterations (vanilla): ')
    disp(i)   
end

