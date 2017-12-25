function [diff_check, h_check_cubed] = gradientCheck_3(f,gradf,x_0,x_1)
    %checks
    checks = 10^(3);
    h_check = zeros(checks,1);
    %gradient of f
    n = length(x_0);
    grad_f_0 = gradf(x_0);
    grad_f_1 = gradf(x_1);
    diff_check = zeros(checks,n);
    h_check_cubed = zeros(checks,1);
    for ii = 1:checks
        h = 1/(ii)^2;
        h_check_cubed(ii) = h^3;
        %difference
        diff_check(ii,:) = sum(-2*(f(x_0)-f(x_1)) + (grad_f_1+grad_f_0)'*(x_1-x_0));
    end
end