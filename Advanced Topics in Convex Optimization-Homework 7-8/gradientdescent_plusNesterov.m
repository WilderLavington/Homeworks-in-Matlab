function [x,x_plot,iterations] = gradientdescent_plusNesterov(f,gradf,tol,iter,xinit,x_train,y_train)
%initialization
t_old = rand;
x_plot = zeros(iter,3);
%lambda 
lambda_0 = 1;
%y parameter
y_old = xinit;
%x parameter
x_old = xinit;
%primary loop
best_guess = xinit;
iterations = iter;
for i = 1:iter
    %backwards linesearch 
    t = linesearch(f,gradf,x_old,t_old);
    t_old = t;
    %initial jump by gradient decent
    y_new = x_old - (t)*gradf(x_old);
    %variables for Nesterov 
    lambda_1 = (1+(1+4*lambda_0^2)^.5)/2;
    gamma = (1-lambda_0)/lambda_1;
    lambda_0 = lambda_1;
    %next step 
    x_new = (1-gamma)*y_new+gamma*y_old;
    %store best guess
    current_error = error_tracking(x_new,x_train,y_train);
    best_error = error_tracking(best_guess,x_train,y_train);
    if best_error > current_error
        best_guess = x_new;
    end
    %stopping conditions
    if norm(gradf(x_new)) < tol
        x_plot(i:iter,1) = current_error;
        x_plot(i:iter,2) = norm(gradf(x_new));
        x_plot(i:iter,3) = norm(f(x_new));
        iterations = i;
        break
    end
    % store info, update variables
    x_plot(i,1) = current_error;
    x_plot(i,2) = norm(gradf(x_new));
    x_plot(i,3) = norm(f(x_new));
    x_old = x_new;
    y_old = y_new;
end
x = best_guess;
fprintf('Iterations (Nesterov): ')
disp(i)
end

