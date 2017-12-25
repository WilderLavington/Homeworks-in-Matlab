clear all
close all
%%%========================================================================
%load data, transform data
%%%========================================================================
load('spamData.mat')
%change y values to -1,1
for i = 1:length(ytrain)
    if ytrain(i,1) == 0
        ytrain(i,1) = -1;
    end
end
%%%========================================================================
%intitialize training data +parameters
%%%========================================================================
tol = 1;
iter = 1/5*10^4;
%map training 
Xtrain = log(Xtrain + .1);
q = length(Xtrain(1,:));
epsilon = 10^-6;
%initialize weights to [-epsilon, epsilon]
w = rand(q,1)*(2*epsilon)-epsilon;
%regularization parameter
lambda = 0;
%%%========================================================================
%optimize weights
%%%========================================================================
sigm     = @(a) 1./(1+exp(-a) ); % helper
mu       = @(w) sigm(ytrain.*( Xtrain*w) ); % helper
f        = @(w) sum( log( 1 + exp( -ytrain.*( Xtrain*w ) ) ) ); % logistic 
lossgrad = @(w) -Xtrain'*(ytrain.*mu(-w)); % gradient of logistic loss
%vanilla gradient decent
[w1,w_plot1,iterations1] = gradientdescent(f,lossgrad,tol,iter,w,Xtrain,ytrain);
%nesterov accellerated 
[w2,w_plot2,iterations2] = gradientdescent_plusNesterov(f,lossgrad,tol,iter,w,Xtrain,ytrain);
%fminsearch
options = optimset('PlotFcns',@optimplotfval,'TolFun',10^(-25),'MaxIter',10^20,'MaxFunEvals',10^20);
[w3] = fminsearch(f,w,options);
%plots
figure(1)
plot(w_plot1(:,1))
hold on
plot(w_plot2(:,1))
hold on
title('Error over time')
figure(2)
plot(w_plot1(:,2))
hold on
plot(w_plot2(:,2))
hold on
title('gradient over time')
figure(3)
plot(w_plot1(:,3))
hold on
plot(w_plot2(:,3))
hold on
title('function over time')
%%%========================================================================
%calculate training error
%%%========================================================================
errortrain_v = error_tracking(w1,Xtrain,ytrain);
errortrain_n = error_tracking(w2,Xtrain,ytrain);
errortrain_f = error_tracking(w3,Xtrain,ytrain);
%%%========================================================================
%calculate prediction error
%%%========================================================================
Xtest = log(Xtest + .1);
errortest_v = error_tracking(w1,Xtest,ytest);
errortest_n = error_tracking(w2,Xtest,ytest);
errortest_f = error_tracking(w3,Xtest,ytest);
%%%========================================================================
%proximal gradient method with an L1 penalty (FISTA)
%%%========================================================================
sigm     = @(a) 1./(1+exp(-a) ); % helper
mu       = @(w) sigm(ytrain.*( Xtrain*w) ); % helper
f        = @(w) sum( log( 1 + exp( -ytrain.*( Xtrain*w ) ) ) ); % logistic 
lossgrad = @(w) -Xtrain'*(ytrain.*mu(-w)); % gradient of logistic loss
%initialize weights to [-epsilon, epsilon]
w = rand(q,1)*(2*epsilon)-epsilon;
tol = 10^(-3);
iter = 1/5*10^4;
%with regularization parameter
lambda = 5;
[w4,w_plot4,iterations4] =  proximal_gradientdescent(f,lossgrad,tol,iter,w,Xtrain,ytrain,lambda);
errortrain_p1 = error_tracking(w4,Xtrain,ytrain);
errortest_p1 = error_tracking(w4,Xtest,ytest);
%without regularization parameter
lambda = 0;
[w5,w_plot5,iterations5] =  proximal_gradientdescent(f,lossgrad,tol,iter,w,Xtrain,ytrain,lambda);
errortrain_p2 = error_tracking(w5,Xtrain,ytrain);
errortest_p2 = error_tracking(w5,Xtest,ytest);
%plots
figure(1)
plot(w_plot4(:,1))
hold on
plot(w_plot5(:,1))
hold on
title('Error over time')
figure(2)
plot(w_plot4(:,2))
hold on
plot(w_plot5(:,2))
hold on
title('gradient over time')
figure(3)
plot(w_plot4(:,3))
hold on
plot(w_plot5(:,3))
hold on
title('function over time')
%plot w values 
plot(w5)
hold on 
plot(w4)
hold on
title('weight values for lambda = 5, lembda = 0')
%%%========================================================================
%plot the 3 methods against each other 
%%%========================================================================
figure(1)
plot(w_plot1(:,3)) %vanilla 
hold on 
plot(w_plot2(:,3)) %nesterov
hold on 
plot(w_plot4(:,3)) %proximal (FISTA)
hold on 
title('Methods Comparison')
%%%========================================================================
%MRI data
%%%========================================================================
%generate the MRI phantom image
Y = phantom('Modified Shepp-Logan',150);
%add noise
Y_noise = Y;
for ii = 1:150
     Y_noise(ii,[randperm(150,15)]) = Y_noise(ii,[randperm(150,15)])+rand(1,15);
end
%heat maps
%HeatMap(Y)
%HeatMap(Y_noise)
%create discrete gradient operator
n1 = 150;
n2 = 150;
d_n1 = spdiags([-ones(n1,1) ones(n1,1)],[0,1],n1,n1);
d_n2 = spdiags([-ones(n2,1) ones(n2,1)],[0,1],n2,n2);
L_h = kron(d_n1,eye(n1));
L_v =  kron(eye(n2),d_n2);
L = L_h+((-1)^(1/2))*L_v;
%CVX optimiz
tau = 1/4 ;
n = 150;
cvx_begin
    variable X(n,n)
    Delta_x = X(1:end-1,:)-X(2:end,:)
    Delta_y = X(:,1:end-1)-X(:,2:end)
    minimize( .5*( sum(sum_square_abs(X-Y_noise))) )
    subject to
        sum(norm([Delta_x;Delta_y'],2)) <= tau
        0<=X<=1
cvx_end
HeatMap(X)
HeatMap(Y)











