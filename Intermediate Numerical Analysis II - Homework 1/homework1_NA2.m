%homework 1 numerical analysis 2
%% Initial setup
close all
clear all
%set up number of timesteps
h = 10^(-1);
duration = 20;
%initial condition
y_0 = 1;
A = 1;
%% true solution
timesteps = round(1/h);
y = linspace(0,duration,timesteps);
y(1) = y_0;
for ii = 2:timesteps
    y(ii) = y_0*exp(A*ii);
end
figure(1) 
plot(y)
title('True Solution')
xlabel('x')
ylabel('y')
hold on
%% question 1
%=========================================================================
%(Improved Euler?s)
%=========================================================================
figure(2)
A = 1;
h = 10;
h_current = h;
timesteps = 10;
duration = 1000;
y = linspace(0,duration,timesteps);
y(1) = y_0;
for ii = 2:timesteps
    y_old =  y(ii-1);
    y_new = (1+A*h_current/2)/(1-A*h_current/2)*y_old;
    y(ii) = y_new;
end
plot(y);
title('Improved Euler: Ah = 10')
xlabel('x')
ylabel('y')
hold on
%% true solution vs approx
timesteps = 100;
y = linspace(0,duration,timesteps);
y_approx = linspace(0,duration,timesteps);
y(1) = y_0;
y_approx(1) = y_0;
h_current = 1;
for ii = 2:timesteps
    y(ii) = y_0*exp(A*ii);
    y_old =  y(ii-1);
    y_new = y_old/(1-A*h_current);
    y_approx(ii) = y_new;
end
figure(1) 
plot(y) 
hold on 
plot(y_approx)
title('True Solution vs Leapfrog Method')
xlabel('x')
ylabel('y')
hold on  
%% question 2
%=========================================================================
%(Implicit Euler?s)
%=========================================================================
close all
figure(3)
A = 1;
h = .1;
h_current = h;
timesteps = 10;
duration = 1000;
y = linspace(0,duration,timesteps);
y_true = linspace(0,duration,timesteps);
y(1) = y_0;
y_true(1) = y_0;
for ii = 2:timesteps
    y_old =  y(ii-1);
    y_new = y_old/(1-A*h_current);
    y(ii) = y_new;
    y_true(ii) = exp(A*(ii-1)*h);
end
plot(y);
hold on 
plot(y_true);
title('Implicite Euler: Ah = .1 vs true solution')
xlabel('x')
ylabel('y')
hold on
%% question 3
%=========================================================================
%(Leapfrog method)
%=========================================================================
close all
figure(4)
A = 1;
h = .1;
h_current = h;
timesteps = 100;
duration = 1000;
y = linspace(0,duration,timesteps);
y_true = linspace(0,duration,timesteps);
y(1) = y_0;
y(2) = y_0;
y_true(1) = y_0;
y_true(2) = y_0;
for ii = 3:timesteps
    y_old_old =  y(ii-2);
    y_old =  y(ii-1);
    y_new = y_old_old+2*h_current*A*y_old;
    y(ii) = y_new;
    y_true(ii) = exp(A*(ii-2)*h_current);
end
plot(y);
hold on
plot(x,y_true);
hold on
title('Leapfrog Method: Ah = .005')
xlabel('x')
ylabel('y')
hold on
%% question 4
%=========================================================================
%(RK-2)
%=========================================================================
figure(5)
title('RK2')
h = -3;
h_current = h;
timesteps = 10;
y = linspace(0,duration,timesteps);
y(1) = y_0;
for ii = 2:timesteps
    y_old =  y(ii-1);
    y_new = y_old*(1+h_current*A+((h_current*A)^2)/2);
    y(ii) = y_new;
end
plot(y);
title('RK2: Ah = -3')
xlabel('x')
ylabel('y')
hold on
%% question 5
%=========================================================================
%(Milne's)
%=========================================================================
close all
figure(5)
A = -50;
h_current = .1;
timesteps = 100;
duration = 100;
y = linspace(0,duration,timesteps);
y_true = linspace(0,duration,timesteps);
y(1) = y_0;
y(2) = y_0;
y_true(1) = y_0;
y_true(2) = y_0;
for ii = 3:timesteps
    y_old_old =  y(ii-2);
    y_old =  y(ii-1);
    y_new = ((1+A*h_current/3)/(1-A*h_current/3))*y_old_old +(2*A*h_current/3/(1-A*h_current/3))*y_old;
    y(ii) = y_new;
    y_true(ii) = exp(A*(ii-2)*h_current);
end
plot(y(2:end));
hold on 
% plot(y_true(2:end));
%axis([0 1000 1 1.001])
title('Milnes Method: Ah = -5')
xlabel('x')
ylabel('y')
hold on