%% problem 1 
%initialize variables
N = 100;
L = 5;
z = normrnd(0,.02,N,1);
x = zeros(N,1);
x(10) = 1;
x(13) = -1;
x(50) = .3;
x(70) = -.2;
% (PART1) write a blur function
% (PART2) write implicite to explicite function for linear function beta
% run values 
B = implicit2explicit(@blur,N);
y = B*x;
y_fuzzy = B*x+z;
%% problem 2
epsilon = .02*(N)^.5;
%epsilon = 10^(-100);
cvx_begin
  variable x_hat(N)
  cvx_quiet false  % optional
  cvx_precision best  % optional
  minimize( norm( x_hat, 1 ) )
  subject to
     norm( B * x_hat - y_fuzzy, 2 ) <= epsilon
cvx_end
%% Make a single plot showing 
close all
% (1) the original signal x
figure(1)
plot(x)
title('Original Signal x')
hold on
% (2) the blurred and noisy version y,
figure(2)
plot(y_fuzzy)
title('Blurred y')
hold on
% (3) your estimate x hat
figure(3)
plot(x_hat)
title('Estimation Given by First Method of Optimization')
hold on
% all 3 super-imposed
figure(4)
plot(x)
hold on
plot(x_hat)
hold on 
title('Original signal versus Optimized signal')

%% problem 3
%create dual variable lamba
cvx_begin
    variable new_x_hat1(N);
    dual variable lambda;
    minimize( norm(new_x_hat1,1) );
    subject to
        square_pos(norm(B * new_x_hat1 - y_fuzzy, 2)) <= epsilon^2 : lambda 
cvx_end
cvx_begin
    variable new_x_hat2(N)
    minimize( norm(new_x_hat2, 1 ) + lambda * square_pos(norm(B * new_x_hat2 - y_fuzzy, 2)))
    subject to
        norm(B * new_x_hat2 - y_fuzzy, 2) <= epsilon
cvx_end
%% problem 4
tau = 1/(2*lambda);
%create function that solves for the adjoint matrix of beta
H = @H_func;
H_adjoint = @H_Adjoint_func;
%check that the H function works to solve for beta
beta1 = blur(x,N);
beta2 = Beta_2(x,N);
diff = sum(abs(beta1-beta2));
%solve for Adjoint of beta
beta_adjoint = @Beta_Adjoint;
%Show that this does actually give us the adjoint of beta
B_adjoint = implicit2explicit(beta_adjoint,N);
Average_error = test_adjoint(B,B_adjoint,1000,N);
%% problem 5
%call L1 optimization
optimization = fasta_sparseLeastSquares(B, B_adjoint, y_fuzzy, tau, x);
figure(5)
plot(x)
hold on
plot(new_x_hat)
hold on
title('Original signal versus Optimized Signal (without constraint \lambda)')
figure(6)
plot(x)
hold on
plot(new_x_hat2)
hold on
title('Original signal versus Optimized Signal (with constraint \lambda)')
figure(7)
plot(x)
hold on
plot(optimization)
hold on
title('Original Signal versus Optimized Signal (with constraint \tau)')






