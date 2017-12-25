%load values
load handel.mat
%% Question 1: solve BP
A = rand(10,20);
b = rand(10,1);
n = 20;
cvx_begin 
  variable x_BP(n)
  minimize( norm( x_BP, 1 ) )
  subject to
     A*x_BP == b
cvx_end
%% Question 2: BP plus constraint tau
tau = norm(x_BP,1);
prox = @(x) project_l1(x, tau);
f = @(x) .5*(norm(A*x-b,2))^2;
gradf = @(x) 2*(A')*(A*x) - 2*(A')*b;
tol = 10^(-14);
iter = 10^(10);
x_init = rand(20,1);
x_LS = gradientdescent(f,gradf,prox,tol,iter,x_init);
norm(x_BP-x_LS)
%% Question 3: Use Newton iteration to find optimal tau
%initialization
tol_tau = 10^-5;
iter_tau = 10^5;
tau_old = rand;
%primary loop
for i = 1:iter
    % solver for optimal x_tau
    cvx_begin quiet
        variables x_tau(n,1) 
        minimize(norm(A*x_tau - b,2))
        subject to 
            norm(x_tau,1) <= tau_old
    cvx_end
    %analytic optimal values from HW 9
    r_tau = b - A*x_tau;
    lambda_opt = r_tau/(norm(r_tau,2));
    nu_opt = norm(A'*lambda_opt,inf);
    %function assignments 
    sigf = norm(A*x_tau-b,2);
    grad_sigf = -nu_opt;
    %newton iteration
    tau_new = tau_old - sigf/grad_sigf;
    %stopping conditions
    if norm(tau_new-tau_old,2)< tol
        break
    end
    tau_old = tau_new;
end

%% Question 4: signal recovery  
% initialize DFT info
blockSize = 1024;
win = sin( pi*( (1:blockSize) + 1/2)/(blockSize) );
n1 = length(y);
% set up randomized thinning function to only use 1/4 of data
psi = mod(randperm(n1),2).*mod(randperm(n1),2);
psifunc = @(x) x([find(psi == 1)]);
%initialize transpose of psi function
psifunc_adj = @(x) psi_adj(x,n1,psi);
b = psifunc(y);
%initialize DCT and DCT adjoint functions
D_adj = @(x) adjointShortTimeDCT(x,win);
D = @(x) forwardShortTimeDCT(x,win);
m1 = length(D(y));
%combine psi thinning funciton and DCT to create matrix func to optimize
A = @(x) psifunc(D_adj(x));
A_trans = @(x) D(psifunc_adj(x));
% initialize function + gradient for FISTA
f2 = @(x) 1/2*norm(A(x)-b,2)^2;
gradf2 = @(x) A_trans(A(x)-b);
%tolerances + iterations + initial guess initialization
tau_old_2 = rand;
iter_2 = 10^3;
tol_2 = 10^-4;
x_tau_2 = normrnd(0,1,m1,1);
%iterate using newtons method
for i = 1:iter_2
    %call gradient decent to find tau
    proxfunc = @(x) project_l1(x,tau_old_2);
    x_tau_2 = gradientdescent(f2,gradf2,proxfunc,tol_2,iter_2,x_tau_2);
    r_tau_2 = b - A(x_tau_2);
    lambda_opt = r_tau_2/(norm(r_tau_2,2));
    nu_opt = norm(A_trans(lambda_opt),inf);
    sigf = norm(A(x_tau_2)-b,2);
    grad_sigf = -nu_opt;
    %newton step
    tau_new_2 = tau_old_2 - sigf/grad_sigf;
    %stopping conditions
    if norm(tau_new_2-tau_old_2,2)< tol_2
        break
    end
    %update
    tau_old_2 = tau_new_2;
end
y_hat = D(x_tau_2);

