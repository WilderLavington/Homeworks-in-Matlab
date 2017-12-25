%% question 1: 
f1 = @(x) exp(x^2); f1ab = [0,1];
f2 = @(x) x^(5/2); f2ab = [0,1];
f3 = @(x) 1/(1+x^2); f3ab = [-4,4];
f4 = @(x) 1/(2+cos(x)); f4ab = [0,2*pi];
f5 = @(x) (exp(x))*cos(4*x); f5ab = [0,pi];
total_n = 9;
info_store = zeros(5,total_n);
for i = 1:total_n
    sub_intervals = 2^i;
    info_store(1,i) = trapazoidal_rule(f1,f1ab(1),f1ab(2),sub_intervals);
    info_store(2,i) = trapazoidal_rule(f2,f2ab(1),f2ab(2),sub_intervals);
    info_store(3,i) = trapazoidal_rule(f3,f3ab(1),f3ab(2),sub_intervals);
    info_store(4,i) = trapazoidal_rule(f4,f4ab(1),f4ab(2),sub_intervals);
    info_store(5,i) = trapazoidal_rule(f5,f5ab(1),f5ab(2),sub_intervals);
end
rate_store = zeros(5,total_n-2);
for i = 1:total_n-2
    for j = 1:5
       rate_store(j,i) = (info_store(j,i+1) - info_store(j,i))/(info_store(j,i+2) - info_store(j,i+1));
    end
end
close all
figure(1)
plot(info_store(1,:))
title('f1 = @(x) exp(x^2); f1ab = [0,1]')
xlabel('iteration')
ylabel('integral evaluation')
figure(2)
plot(info_store(2,:))
title('f2 = @(x) x^(5/2); f2ab = [0,1]')
xlabel('iteration')
ylabel('integral evaluation')
figure(3)
plot(info_store(3,:))
title('f3 = @(x) 1/(1+x^2); f3ab = [-4,4]')
xlabel('iteration')
ylabel('integral evaluation')
figure(4)
plot(info_store(4,:))
title('f4 = @(x) 1/(2+cos(x)); f4ab = [0,2*pi]')
xlabel('iteration')
ylabel('integral evaluation')
figure(5)
plot(info_store(5,:))
title('f5 = @(x) (exp(x))*cos(4*x); f5ab = [0,pi]')
xlabel('iteration')
ylabel('integral evaluation')

%% question 4
f = @(x) (-4*x*log(x)).*(x>0); fab = [0,1];
g = @(x) [f(x) 0]*sparse(1+isnan(f(x)),1,1,2,1);
total_n = 9;
info_store = zeros(3,total_n);
x_vals = zeros(9,1);
for i = 1:total_n
    x_vals(i) = 1/(2^i);
    sub_intervals = 2^i;
    info_store(1,i) = midpoint_rule(g,fab(1),fab(2),sub_intervals);
    info_store(2,i) = trapazoidal_rule(g,fab(1),fab(2),sub_intervals);
    info_store(3,i) = simpsons_rule(g,fab(1),fab(2),sub_intervals);
end
close all
figure(1)
loglog(x_vals, abs(1-info_store(1,:)))
hold on
loglog(x_vals, abs(1-info_store(2,:)))
hold on
loglog(x_vals, abs(1-info_store(3,:)))
legend('midpoint rule','trapazoidal rule', 'simpsons rule','Location','northwest')
xlabel('iterations (log scale)')
ylabel('error (log scale)')


