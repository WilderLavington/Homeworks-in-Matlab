function [diff_f, dolphin, h_check, h_check_squared] = gradientCheck_2(f,gradf,x_0,x_1)
    %checks
    checks = 10^(3);
    h_check = zeros(checks,1);
    %gradient of f
    n = length(x_0)
    grad_f = gradf(x_0);
    diff_f = zeros(checks,n);
    dolphin = zeros(checks,n);
    h_check_squared = zeros(checks,1);
    for ii = 1:checks
        h = 1/(ii)^2;
        h_check(ii) = h;
        h_check_squared(ii) = h^2;
        %difference of f
        diff_f(ii,:) = sum(abs(f(x_0+h*x_1)-f(x_0)));
        %difference
        dolphin(ii,:) = sum(abs(f(x_0+h*x_1)+grad_f*(h*x_1)-f(x_0)));
    end
end