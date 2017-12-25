%%========================================================================
%% impliment a function gradient function usingmatrix arithmatic 1(a)
%%%=======================================================================
l = @grad_l;
s = @sigmoid;
%%========================================================================
%% impliment a finite difference functions 1(b)
%%%=======================================================================
%functions
forward_diff = @g_prime_forward;
central_diff = @g_prime_center;
%%=========================================================================
%% now check these functions
%%%========================================================================
%ex: x.^2
x_0 = 100*rand(5,1);
sqr = @(x) x.^2;
grad_sqr = @(x) diag(2.*x);
%check how close my finite difference approx was using built in function
[central_check, forward_check, h_check] = gradientCheck(sqr,grad_sqr,x_0);
figure(1)
loglog(h_check, central_check)
hold on
title('error: Central Difference Approximation')
xlabel('h')
ylabel('error')
grid on
figure(2)
loglog(h_check, forward_check)
hold on
title('error: Forward Difference Approximation')
xlabel('h')
ylabel('error')
grid on
%%========================================================================
%% now evaluate x at a single piont 1(c)
%%%========================================================================
sqr = @(x) x.^3;
grad_sqr = @(x) diag(3.*x.^2);
%check how close my finite difference approx was using built in function
x_0 = 100*rand(5,1);
x_1 = 100*rand(5,1);
[diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(sqr,grad_sqr,x_0,x_1);
figure(1)
loglog(h_check,diff_f)
hold on
title('|f(x_0-hx_1)| vs h')
xlabel('h')
ylabel('|f(x_0-hx_1)|')
grid on
figure(2)
loglog(h_check_squared,dolphin)
hold on
grid on
title('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)| vs h^2')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
%%=========================================================================
%% now evaluate x at a single piont 1 (d)
%%%========================================================================
sqr = @(x) x.^3;
grad_sqr = @(x) diag(3.*x.^2);
%check how close my finite difference approx was using built in function
x_0 = 100*rand(5,1);
x_1 = 100*rand(5,1);
[diff_check, h_check_cubed] = gradientCheck_3(sqr,grad_sqr,x_0,x_1);
figure(3)
loglog(h_check_squared,dolphin)
hold on
grid on
title('-2(f(x_0)-f(x_1))+ (\nabla f(x_0) -\nabla f(x_1))^T(x_1-x_0) vs h^3')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
%%=========================================================================
%% now use gradient check code on linear, quadratic and cubic functions
%%%========================================================================
x_0 = 100*rand(10,1);
x_1 = 100*rand(10,1);
%ex1
sqr = @(x) x.^3 + x;
grad_sqr = @(x) diag(3.*x.^2 + ones(size(x)));
[central_check, forward_check, h_check] =  gradientCheck(sqr,grad_sqr,x_0);
[diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(sqr,grad_sqr,x_0,x_1);
[diff_check, h_check_cubed] = gradientCheck_3(sqr,grad_sqr,x_0,x_1);
figure(3)
loglog(h_check_squared,dolphin)
hold on
grid on
title('-2(f(x_0)-f(x_1))+ (\nabla f(x_0) -\nabla f(x_1))^T(x_1-x_0) vs h^3')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
figure(1)
loglog(h_check,diff_f)
hold on
title('|f(x_0-hx_1)| vs h')
xlabel('h')
ylabel('|f(x_0-hx_1)|')
grid on
figure(2)
loglog(h_check_squared,dolphin)
hold on
grid on
title('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)| vs h^2')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
pause
%ex2
x_0 = 100*rand(10,1);
x_1 = 100*rand(10,1);
sqr = @(x) x.^5 + x.^2;
grad_sqr = @(x) diag(5.*x.^4 + 2.*x);
[central_check, forward_check, h_check] =  gradientCheck(sqr,grad_sqr,x_0);
[diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(sqr,grad_sqr,x_0,x_1);
[diff_check, h_check_cubed] = gradientCheck_3(sqr,grad_sqr,x_0,x_1);
figure(3)
loglog(h_check_squared,dolphin)
hold on
grid on
title('-2(f(x_0)-f(x_1))+ (\nabla f(x_0) -\nabla f(x_1))^T(x_1-x_0) vs h^3')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
figure(1)
loglog(h_check,diff_f)
hold on
title('|f(x_0-hx_1)| vs h')
xlabel('h')
ylabel('|f(x_0-hx_1)|')
grid on
figure(2)
loglog(h_check_squared,dolphin)
hold on
grid on
title('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)| vs h^2')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
pause
%ex3
x_0 = 100*rand(10,1);
x_1 = 100*rand(10,1);
sqr = @(x) x.^2 ;
grad_sqr = @(x) diag(2.*x);
[central_check, forward_check, h_check] =  gradientCheck(sqr,grad_sqr,x_0);
[diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(sqr,grad_sqr,x_0,x_1);
[diff_check, h_check_cubed] = gradientCheck_3(sqr,grad_sqr,x_0,x_1);
figure(3)
loglog(h_check_squared,dolphin)
hold on
grid on
title('-2(f(x_0)-f(x_1))+ (\nabla f(x_0) -\nabla f(x_1))^T(x_1-x_0) vs h^3')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
figure(1)
loglog(h_check,diff_f)
hold on
title('|f(x_0-hx_1)| vs h')
xlabel('h')
ylabel('|f(x_0-hx_1)|')
grid on
figure(2)
loglog(h_check_squared,dolphin)
hold on
grid on
title('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)| vs h^2')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
pause
%%========================================================================
%% gradient check code on cost function
%%%=======================================================================
w_0 = 100*rand(10,1);
w_1 = 100*rand(10,1);
x = 100*rand(10,100);
y = (-1).^(randi(10,1,10))';
l = 0;
n = 10;
lossf = @(x)  loss_function(x,x,y,l,n);
gradlossf = @(x)  gradient_loss_function(x,x,y,l,n);
%ex3
[central_check, forward_check, h_check] =  gradientCheck(lossf,grad_sqr,w_0);
[diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(lossf,grad_sqr,w_0,w_1);
[diff_check, h_check_cubed] = gradientCheck_3(lossf,gradlossf,w_0,w_1);
figure(1)
loglog(h_check,diff_f)
hold on
title('|f(x_0-hx_1)| vs h')
xlabel('h')
ylabel('|f(x_0-hx_1)|')
grid on
figure(2)
loglog(h_check_squared,dolphin)
hold on
grid on
title('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)| vs h^2')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
figure(3)
loglog(h_check_squared,dolphin)
hold on
grid on
title('-2(f(x_0)-f(x_1))+ (\nabla f(x_0) -\nabla f(x_1))^T(x_1-x_0) vs h^3')
xlabel('h^2')
ylabel('|f(x_0+hx_1) + <\nabla f, hx_1> - f(x_0)|')
%%========================================================================
%% forward and central difference approximation of cost function
%%%=======================================================================
w_0 = 1*rand(10,1);
x = 1*rand(10,1);
y = (-1).^(randi(10,1,10))';
n = 10;
func = @(w) sigmoid(x);
grad_func = @(w) diag(sigmoid_grad(x));
[central_check, forward_check, h_check] = gradientCheck(func,grad_func,w_0);
figure(1)
loglog(h_check, central_check)
hold on
title('error: Central Difference Approximation')
xlabel('h')
ylabel('error')
grid on
figure(2)
loglog(h_check, forward_check)
hold on
title('error: Forward Difference Approximation')
xlabel('h')
ylabel('error')
grid on
%%========================================================================
%% code linesearch (2)
%%%=======================================================================
err = 100;
tol = 10^(-10);
x_0 = rand(10,1);
sqr = @(x) x.^2;
grad_sqr = @(x) 2.*x;
t_old = rand(1);
t = linesearch(sqr,grad_sqr,x_0,t_old);
%%========================================================================
%% code gradient decent (3)
%%%=======================================================================
%test case 1
plotting_on = 1;
[x] = gradient_descent(sqr,grad_sqr,tol,10,x_0'); 
%test case 2
sqr = @(x) x.^4;
grad_sqr = @(x) 4.*x.^3;
[x] = gradient_descent(sqr,grad_sqr,tol,10,x_0',plotting_on); 
%test case 3
sqr = @(x) x.^2+x.^4 + 1;
grad_sqr = @(x) 2.*x+4.*x.^3;
[x] = gradient_descent(sqr,grad_sqr,tol,10,x_0',plotting_on); 
%%========================================================================
%% logistic regression on spam email classification (4)
%%%=======================================================================
load('spamData.mat')
w_0 = zeros(57,1);
tol = 10^(-10);
%fix y data 
for i = 1:length(ytrain)
    if ytrain(i,1) == 0
        ytrain(i,1) = -1;
    end
end
%set iterations/toleerances
tol = 10^-3;
iter = 10^3;
%transform data 
Xtrain = log(Xtrain + .1);
%initialize w
q = length(Xtrain(1,:));
ep = 10^-4;
w = rand(q,1)*(ep);
%initial anonymous functions
l = 0;
%%========================================================================
%%train parameters 
%%%=======================================================================
n = 3065;
lossf = @(w)  loss_function(Xtrain,w,ytrain,l);
gradlossf = @(w)  gradient_loss_function(Xtrain,w,ytrain,l);
%run gradient decent 
w = gradient_descent(lossf,gradlossf,tol,iter,w);
%use decision boundary to create classifier
predicttrain = zeros(3065,1);
for i = 1:3065
    predicttrain(i,1) = sigmoid(w'*Xtrain(i,:)');
end
for i = 1:3065
    if predicttrain(i,1) < .5
        predicttrain(i,1) = 0;
    elseif predicttrain(i,1) >= .5
        predicttrain(i,1) = 1;
    end
end
%look at error on training set 
for i = 1:length(ytrain)
    if ytrain(i,1) == -1
        ytrain(i,1) = 0;
    end
end
error = sum(abs(predicttrain - ytrain))/3065;
disp('Training error')
disp(error)
%%========================================================================
%%test against hold out data 
%%%=======================================================================
%again, fix y vector
Xtest = log(Xtest + .1);
predicttest = zeros(1536,1);
for i = 1:1536
    predicttest(i,1) = sigmoid(w'*Xtest(i,:)');
end
for i = 1:1536
    if predicttest(i,1) < .5
        predicttest(i,1) = 0;
    elseif predicttest(i,1) >= .5
        predicttest(i,1) = 1;
    end
end
errortest = sum(abs(predicttest - ytest))/1536;
disp('Training error') %note I added a counter to my linesearch so that I could debug
                        % if you remove it you will get the error described
                        % in paper, but its gonna take a bit.
disp(errortest)
plot(linspace(1,length(w),length(w)),w)
title('Coefficients: w')
xlabel('coefficient w_i')
ylabel('magnitude')
hold on
