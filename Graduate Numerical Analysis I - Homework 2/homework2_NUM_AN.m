% Gauss Seidel Method
A=[4 -1 0 -1 0 0; -1 4 -1 0 -1 0; 0 -1 4 0 0 -1; -1 0 0 4 -1 0; 0 -1 0 -1 4 -1; 0 0 -1 0 -1 4];
b=[2 1 2 2 1 2]';
x=[0 0 0 0 0 0]';
n=size(x,1);
current_error=Inf; 
tol=.0001; iteration=0; old_error = 0;
plot_1 = zeros(100,1);
plot_2 = zeros(100,1);
plot_3 = zeros(100,1);
while current_error>tol
    x_old=x;
    for i=1:n
        sigma=0;
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    iteration=iteration+1;
    
    old_error = norm(A*xold - b,2);
    current_error = norm(A*x - b,2);
    plot_1(iteration) = current_error;
    plot_2(iteration) = current_error/old_error;
    plot_3(iteration) = abs(current_error - old_error);
end
iteration
plot_1 = plot_1(1:iteration);
plot_2 = plot_2(1:iteration);
plot_3 = plot_3(1:iteration);

figure(1)
plot(linspace(1,iteration,iteration), plot_1)
title('Gauss Seidel Method: Error ')
xlabel('iteration')
ylabel('error')
figure(2)
plot(linspace(1,iteration,iteration), plot_2)
title('Gauss Seidel Method: Ratio of (n+1)th Error to nth error')
xlabel('iteration')
ylabel('error ratio')
figure(3)
plot(linspace(1,iteration,iteration), plot_3)
title('Gauss Seidel Method: Difference of (n+1)th Error to nth error')
xlabel('iteration')
ylabel('error difference')


% Jacobi Method
A=[4 -1 0 -1 0 0; -1 4 -1 0 -1 0; 0 -1 4 0 0 -1; -1 0 0 4 -1 0; 0 -1 0 -1 4 -1; 0 0 -1 0 -1 4];
b=[2 1 2 2 1 2]';
x=[0 0 0 0 0 0]';
n=size(x,1);
current_error=Inf; 
tol=.0001; iteration=0; old_error = 0;
plot_1b = zeros(100,1);
plot_2b = zeros(100,1);
plot_3b = zeros(100,1);
while current_error>tol
    xold=x;
    for i=1:n
        sigma=0;
        for j=1:n
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    iteration=iteration+1;
    old_error = norm(A*xold - b,2);
    current_error = norm(A*x - b,2);
    plot_1b(iteration) = current_error;
    plot_2b(iteration) = current_error/old_error;
    plot_3b(iteration) = abs(current_error - old_error); 
end
iteration
plot_1b = plot_1b(1:iteration);
plot_2b = plot_2b(1:iteration);
plot_3b = plot_3b(1:iteration);

figure(4)
plot(linspace(1,iteration,iteration), plot_1b)
title('Jacobi Method: Error ')
xlabel('iteration')
ylabel('error')
figure(5)
plot(linspace(1,iteration,iteration), plot_2b)
title('Jacobi Method: Ratio of (n+1)th Error to nth error')
xlabel('iteration')
ylabel('error ratio')
figure(6)
plot(linspace(1,iteration,iteration), plot_3b)
title('Jacobi Method: Difference of (n+1)th Error to nth error')
xlabel('iteration')
ylabel('error difference')
