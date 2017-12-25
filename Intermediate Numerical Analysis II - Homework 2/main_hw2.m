%%%=======================================================================
%%%% Intermediate Numerical Analysis Homework 2
%%%=======================================================================
%%%=======================================================================
%% Problem 1: Integration of stiff differential equation
%%%=======================================================================
%% 1 (a) 
% solve diff eq using inplicit eulers, plot against true solution (0,.01)
% h = (x2-x1)/(n-1) => if n = 2, h = .01
n = 2;
t1 = 0;
t2 = .01;
h = .01;
t = linspace(t1,t2,n);
y_soln = zeros(size(t));
y_true = zeros(size(t));
%implicit eulers and true solution
for ii = 2:length(t)
    y_soln(ii) = (y_soln(ii-1) + h*(3000-2000*exp(-1*(t(ii)+h))))/...
        (1+h*1000);
    y_true(ii) = true_solution(t(ii));
end
%plot solution 
figure(1)
plot(t,y_soln)
hold on 
plot(t,y_true)
hold on
title('h = .01')
xlabel('t')
ylabel('y(t)')
% h = (x2-x1)/(n-1) => if n = 11, h = .001
n = 11;
t1 = 0;
t2 = .01;
h = .001;
t = linspace(t1,t2,n);
y_soln = zeros(size(t));
y_true = zeros(size(t));
%implicit eulers and true solution
for ii = 2:length(t)
    y_soln(ii) = (y_soln(ii-1) + h*(3000-2000*exp(-1*(t(ii)+h))))/...
        (1+h*1000);
    y_true(ii) = true_solution(t(ii));
end
%plot solution 
figure(2)
plot(t,y_soln)
hold on 
plot(t,y_true)
hold on
title('h = .001')
xlabel('t')
ylabel('y(t)')
% h = (x2-x1)/(n-1) => if n = 101, h = .0001
n = 101;
t1 = 0;
t2 = .01;
h = .0001;
t = linspace(t1,t2,n);
y_true = zeros(size(t));
%implicit eulers and true solution
for ii = 2:length(t)
    y_soln(ii) = (y_soln(ii-1) + h*(3000-2000*exp(-1*(t(ii)+h))))/...
        (1+h*1000);
    y_true(ii) = true_solution(t(ii));
end
%plot solution 
figure(3)
plot(t,y_soln)
hold on 
plot(t,y_true)
hold on
title('h = .0001')
xlabel('t')
ylabel('y(t)')
%% 1 (b) 
% solve diff eq using gears method, plot against true solution (0,.01)
% h = (x2-x1)/(n-1) => if n = 2, h = .01
n = 2;
t1 = 0;
t2 = .01;
h = .01;
t = linspace(t1,t2,n);
y_soln = zeros(length(t),1);
y_true = zeros(length(t),1);
% force initial conditions
y_0 = 0;
y_1 = 0;
y_2 = 0;
% primary loop 
for ii = 2:length(t)
    %new value
    y_3 = h*(1/(1+6000*h/11))*((18000)-(12000*exp(-t(ii))))/11 ...
           + (1/(1+6000*h/11))*(18*y_2-9*y_1+2*y_0)/11;
    %store value
    y_soln(ii) = y_3;
    %update terms
    y_0 = y_1;
    y_1 = y_2;
    y_2 = y_3;
    %track true solution
    y_true(ii) = true_solution(t(ii));
end
%plotting 
figure(1)
plot(t,y_soln)
hold on
plot(t,y_true)
hold on
title('h = .01')
xlabel('t')
ylabel('y(t)')
% h = (x2-x1)/(n-1) => if n = 11, h = .001
n = 11;
t1 = 0;
t2 = .01;
h = .001;
t = linspace(t1,t2,n);
y_soln = zeros(length(t),1);
y_true = zeros(length(t),1);
% force initial conditions
y_0 = 0;
y_1 = 0;
y_2 = 0;
% primary loop 
for ii = 2:length(t)
    %new value
    y_3 = h*(1/(1+6000*h/11))*((18000)-(12000*exp(-t(ii))))/11 ...
           + (1/(1+6000*h/11))*(18*y_2-9*y_1+2*y_0)/11;
    %store value
    y_soln(ii) = y_3;
    %update terms
    y_0 = y_1;
    y_1 = y_2;
    y_2 = y_3;
    %track true solution
    y_true(ii) = true_solution(t(ii));
end
%plotting 
figure(2)
plot(t,y_soln)
hold on
plot(t,y_true)
hold on
title('h = .001')
xlabel('t')
ylabel('y(t)')
% h = (x2-x1)/(n-1) => if n = 11, h = .001
n = 101;
t1 = 0;
t2 = .01;
h = .0001;
t = linspace(t1,t2,n);
y_soln = zeros(length(t),1);
y_true = zeros(length(t),1);
% force initial conditions
y_0 = 0;
y_1 = 0;
y_2 = 0;
% primary loop 
for ii = 2:length(t)
    %new value
    y_3 = h*(1/(1+6000*h/11))*((18000)-(12000*exp(-t(ii))))/11 ...
           + (1/(1+6000*h/11))*(18*y_2-9*y_1+2*y_0)/11;
    %store value
    y_soln(ii) = y_3;
    %update terms
    y_0 = y_1;
    y_1 = y_2;
    y_2 = y_3;
    %track true solution
    y_true(ii) = true_solution(t(ii));
end
%plotting 
figure(3)
plot(t,y_soln)
hold on
plot(t,y_true)
hold on
title('h = .0001')
xlabel('t')
ylabel('y(t)')
%% 1 (c) 
% solve diff eq using implicit eulers method, plot against true solution (0,5)
% h = (x2-x1)/(n-1) => if n = 501, h = .01
n = 501;
t1 = 0;
t2 = 5;
h = .01;
t = linspace(t1,t2,n);
y_soln = zeros(size(t));
y_true = zeros(size(t));
%implicit eulers and true solution
for ii = 2:length(t)
    y_soln(ii) = (y_soln(ii-1) + h*(3000-2000*exp(-1*(t(ii)+h))))/...
        (1+h*1000);
    y_true(ii) = true_solution(t(ii));
end
%plot solution 
figure(1)
plot(t,y_soln)
hold on 
plot(t,y_true)
hold on
title('h = .01')
xlabel('t')
ylabel('y(t)')
% h = (x2-x1)/(n-1) => if n = 5001, h = .001
n = 5001;
t1 = 0;
t2 = 5;
h = .001;
t = linspace(t1,t2,n);
y_soln = zeros(size(t));
y_true = zeros(size(t));
%implicit eulers and true solution
for ii = 2:length(t)
    y_soln(ii) = (y_soln(ii-1) + h*(3000-2000*exp(-1*(t(ii)+h))))/...
        (1+h*1000);
    y_true(ii) = true_solution(t(ii));
end
%plot solution 
figure(2)
plot(t,y_soln)
hold on 
plot(t,y_true)
hold on
title('h = .001')
xlabel('t')
ylabel('y(t)')
%% 1 (d) 
% solve diff eq using gears method, plot against true solution (0,5)
% h = (x2-x1)/(n-1) => if n = 501, h = .01
n = 501;
t1 = 0;
t2 = 5;
h = .01;
t = linspace(t1,t2,n);
y_soln = zeros(length(t),1);
y_true = zeros(length(t),1);
% force initial conditions
y_0 = 0;
y_1 = 0;
y_2 = 0;
% primary loop 
for ii = 2:length(t)
    %new value
    y_3 = h*(1/(1+6000*h/11))*((18000)-(12000*exp(-t(ii))))/11 ...
           + (1/(1+6000*h/11))*(18*y_2-9*y_1+2*y_0)/11;
    %store value
    y_soln(ii) = y_3;
    %update terms
    y_0 = y_1;
    y_1 = y_2;
    y_2 = y_3;
    %track true solution
    y_true(ii) = true_solution(t(ii));
end
%plotting 
figure(2)
plot(t,y_soln)
hold on
plot(t,y_true)
hold on
title('h = .01')
xlabel('t')
ylabel('y(t)')
%%%=======================================================================
%% Problem 2: Finite difference approximation over a rod
%%%=======================================================================
close all 
clear all
L = 100; %in mm, length of rod
d = 5; %in mm, diameter of rod 
P = pi*d; %in mm, parameter
A_c = pi*(d/2)^2; %in mm^2, cross sectional area
T_b = 100; %in C^0, temperature at base of rod
k = 400; %in W/mK, thermal conductivity of copper
T_inf = 25; %in C^0, temperature at side and top of rod
h = 100; %in W/m^2K, the convection heat transfer coefficient
%non-dimentionalization
theta = @(x) (T(x) - T_inf)/(T_b-T_inf); % dimentionless temp
Temp = @(theta) theta*((T_b-T_inf)) + T_inf;
%X = @(x) x/L; % dimentionless position
x_dim = @(X) X*L;
m = (h*P/(k*A_c))^.5; % dimentionless coefficient
%finite differences
iterations = 10000;
delta_x = 1/11;
%intialization of rod
theta_rod = zeros(1,11);
%%%========================================================================
%% solve by creating linear system of equations
%%%========================================================================
system = zeros(12);
%interior

for ii = 2:11
   system(ii,ii) = 2+(m*L*delta_x)^2; system(ii,ii+1) = -1; system(ii,ii-1) = -1;
end
%solve system to return values
b = zeros(12,1);
%force boundery values to be correct 
b(1) = 1;
b(2) = 1; 
%multiply in correction term
A = system;
%BC1
A(1,1) = 1; A(2,1) = 0;
%BC2
A(12,12) = 1; A(12,11) = (h*L/k)*delta_x; A(12,10) = -1;
%solve
theta_solved = linsolve(A,b);
%remove phantom values
theta_solved = theta_solved(1:11);
%theta_solved = theta_solved./theta_solved(1);
%%%========================================================================
% plot true solution
%%%========================================================================
X = linspace(0,1,11);
analytic_soln = @(X) (cosh(m*L*(1-X))+(h/(m*k))*sinh(m*L*(1-X)))/(cosh(m*L)+(h/(m*k))*sinh(m*L));
check1 = analytic_soln(X);
figure(1)
plot(X,check1)
hold on
plot(X,theta_solved)
hold on 
title('11 point grid finite difference approximation')
xlabel('X')
ylabel('\theta(X)')
%%%========================================================================
%% recalculate finite difference approx with more nodes for clarity
%%%========================================================================
n = 100;
delta_x = 1/n;
system = zeros(n+1);
%interior
for ii = 2:n
   system(ii,ii) = 2+(m*L*delta_x)^2; system(ii,ii+1) = -1; system(ii,ii-1) = -1;
end
%solve system to return values
b = zeros(n+1,1);
%force boundery values to be correct 
b(1) = 1;
b(2) = 1; 
%multiply in correction term
A = system;
%BC1
A(1,1) = 1; A(2,1) = 0;
%BC2
A(n+1,n+1) = 1; A(n+1,n) = (h*L/k)*delta_x; A(n+1,n-1) = -1;
%solve
theta_solved = linsolve(A,b);
%remove phantom values
theta_solved = theta_solved(1:n);
%plot
figure(2)
X = linspace(0,1,n);
plot(X,theta_solved)
hold on 
%replot over finer grid
X_hat =linspace(0,1,100);
check2 = analytic_soln(X_hat);
plot(X_hat,check2)
hold on
title('100 point grid finite difference approximation')
xlabel('X')
ylabel('\theta(X)')
%heatplots
HeatMap(check2)
title('Heat plot of finite difference approximation, 11 pt')
hold on
HeatMap(check1)
title('Heat plot of finite difference approximation, 100 pt')
hold on

