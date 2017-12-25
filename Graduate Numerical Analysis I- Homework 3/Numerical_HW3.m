%%%%% Homework 3
%% question 3
f = @(x) exp(-1/((1-x)^2))*(x~=1) + (x==1);
f_prime = @(x) (2*exp(-1/(1 - x)^2))/(-1 + x)^3;
%%%%% newton iteration naive
% x_old = 1 + rand;
% tol = 10^(-6);
% iterations = 0;
% plotting = zeros(10^3,1);
% while iterations > 10^2 - 1
%     x_new = x_old - f(x_old)/f_prime(x_old);
%     err = abs(x_old - 1);
%     x_old = x_new;
% end
%%%%% newton iteration less naive
x_old = 1 - rand;
err = 1;
iterations = 0;
plotting = zeros(10^4,1);
while iterations < 10^4
    iterations = iterations + 1;
    plotting(iterations) = x_old;
    x_new = x_old - .5*(x_old-1)^3;
    err = abs(x_old - 1);
    x_old = x_new;
end
close all
figure(1)
plot(plotting)
title('f(x) = exp(-1/(1-x)^2)')
xlabel('iteration')
ylabel('x_k')
x_old

%% question 4
func_o = @(x) (sin(pi*x))^2;
func_n = @(x) func_o(x) - x;

figure(1)
fplot(func_n,[-1,1])
hold on 
fplot(0,[-1,1])
title('f(x) = (sin(pi*x))^2 -x')
xlabel('x')
ylabel('f(x)')

%%%%% use bisection
format long
sim = rand(2,1);
a = .1*min(sim);
b = max(sim);
err = 1;
tol = .000001;
iterations = 0;
root_vals = zeros(2,1);
function_vals = zeros(2,1);
while err > tol
    iterations = iterations + 1;
    c = (a+b)/2;
    f_a = func_n(a);
    f_b = func_n(b);
    f_c = func_n(c);
    if f_a*f_c < 0
        b = c;
    else
        a = c;
    end
    err = abs(f_b+f_a)/2;
    root = (a+b)/2;
    root_vals(iterations) = root;
    function_vals(iterations) = f_c;
end

root
iterations

figure(2)
plot(root_vals)
title('change in root over time')
xlabel('iteration')
ylabel('root')

figure(3)
plot(function_vals)
title('change in function over time')
xlabel('iteration')
ylabel('function eval')






