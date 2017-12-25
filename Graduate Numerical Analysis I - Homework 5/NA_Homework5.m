close all 
clear all
f = @(x) x./(1+25.*x.^2);
f_p = @(x) (1 - 25.*x.^2)./(1 + 25.*x.^2).^2;
grid_pionts = linspace(-1,1,2000);
figure(1)
plot(grid_pionts, f(grid_pionts));
title('f(x) = x/(1+25*x^2)');
xlabel('x');
ylabel('f(x)')
%% (a) The standard polynomial interpolant using 21 equispaced points
% construct vandermonde
equispaced_pionts = linspace(-1,1,21);
Vandermonde = zeros(21);
for column = 1:21
    for row = 1:21
        Vandermonde(row, column) = equispaced_pionts(row)^(column-1);
    end
end
% construct b
b = zeros(21,1);
for row = 1:21
  b(row) = f(equispaced_pionts(row));  
end
% solve
coefficients = flip(linsolve(Vandermonde,b));
interpolater_1 = @(x) polyval(coefficients,x);
% plot
figure(2)
hold on
plot(grid_pionts, f(grid_pionts));
plot(grid_pionts, interpolater_1(grid_pionts));
title('The standard polynomial interpolant using 21 equispaced points');
xlabel('x');
ylabel('f(x)')
%% (b) The Hermite interpolant using 11 equispaced points.
% construct vandermonde
equispaced_pionts = linspace(-1,1,11);
Vandermonde = zeros(22,22);
for row = 1:11
    for column = 1:22
        Vandermonde(row, column) = equispaced_pionts(row)^(column-1);
    end
end
for row = 1:11
    for column = 2:22
        Vandermonde(row+11, column) = (column - 1)*equispaced_pionts(row)^((column)-2);
    end
end
% construct b
b = zeros(22,1);
for row = 1:11
  b(row) = f(equispaced_pionts(row));  
end
for row = 13:22
  b(row) = f_p(equispaced_pionts(row-11));  
end
% solve
coefficients = flip(linsolve(Vandermonde,b));
interpolater_2 = @(x) polyval(coefficients,x);
% plot
grid_pionts = linspace(-1,1,2000);
figure(3)
hold on
plot(grid_pionts, f(grid_pionts));
plot(grid_pionts, interpolater_2(grid_pionts));
title('The Hermite interpolant using 11 equispaced points.');
xlabel('x');
ylabel('f(x)')
%% (c) The piecewise-linear, continuous interpolant using 21 equispaced points (20 intervals)
equispaced_pionts = linspace(-1,1,21);
interpolater_3 = @(x) piecewise_linear(x,f,equispaced_pionts);
% plot
grid_pionts = linspace(-1,1,2000);
figure(4)
hold on
plot(grid_pionts, f(grid_pionts));
plot(grid_pionts, interpolater_3(grid_pionts));
title('The piecewise-linear, continuous interpolant using 21 equispaced points')
xlabel('x')
ylabel('f(x)')
%% The piecewise-cubic Hermite interpolant using 11 equispaced points (10 intervals)
equispaced_pionts = linspace(-1,1,11);
interpolater_4 = @(x) piecewise_cubic_hermite(x,f,f_p,equispaced_pionts);
% plot
grid_pionts = linspace(-1,1,2000);
figure(5)
hold on
plot(grid_pionts, f(grid_pionts));
plot(grid_pionts, interpolater_4(grid_pionts))
title('The piecewise-cubic Hermite interpolant using 11 equispaced points')
xlabel('x')
ylabel('f(x)')
%% The natural cubic spline interpolant using 21 equispaced points
equispaced_pionts = linspace(-1,1,21);
interpolater_5 = @(x) natural_cubic_spline(x,f,equispaced_pionts);
% plot
grid_pionts = linspace(-1,1,2000);
figure(6)
hold on
plot(grid_pionts, f(grid_pionts));
plot(grid_pionts, interpolater_5(grid_pionts))
title('The natural cubic spline interpolant using 21 equispaced points')
xlabel('x')
ylabel('f(x)')
%% plot all interpolents together
figure(7)
hold on
plot(grid_pionts, interpolater_1(grid_pionts));
plot(grid_pionts, interpolater_2(grid_pionts));
plot(grid_pionts, interpolater_3(grid_pionts));
plot(grid_pionts, interpolater_4(grid_pionts));
plot(grid_pionts, interpolater_5(grid_pionts));
title('superimposed interpolents together')
xlabel('x')
ylabel('f(x)')
%% plot errors
figure(1)
hold on
plot(grid_pionts, abs(interpolater_1(grid_pionts) - f(grid_pionts)));
plot(grid_pionts, abs(interpolater_2(grid_pionts) - f(grid_pionts)));
plot(grid_pionts, abs(interpolater_3(grid_pionts)' - f(grid_pionts)));
plot(grid_pionts, abs(interpolater_4(grid_pionts)' - f(grid_pionts)));
plot(grid_pionts, abs(interpolater_5(grid_pionts)' - f(grid_pionts)));
title('superimposed interpolent errors together')
%title('The standard polynomial interpolant using 21 equispaced points (error)');
%title('The Hermite interpolant using 11 equispaced points (error)');
% title('The piecewise-linear, continuous interpolant using 21 equispaced points (error)')
% title('The piecewise-cubic Hermite interpolant using 11 equispaced points (error)')
% title('The natural cubic spline interpolant using 21 equispaced points (error)')
xlabel('x')
ylabel('absolute error')






