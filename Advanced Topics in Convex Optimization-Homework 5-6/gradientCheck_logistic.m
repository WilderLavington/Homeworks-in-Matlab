function [central_check, forward_check,h_check] = gradientCheck_logistic(f,gradf,x_0)
    checks = 100;
    central_check = zeros(checks,1);
    forward_check = zeros(checks,1);
    h_check = zeros(checks,1);
    n = length(x_0);
    for ii = 1:checks
        h = 1/(ii)^7;
        h_check(ii) = h;
        %central check
        center_approx = g_prime_center(h,f,n,x_0);
        %forward check
        forward_approx = g_prime_forward(h,f,n,x_0);
        %return the two errors
        size(gradf(x_0))
        size(center_approx)
        central_check(ii) = norm(gradf(x_0) - center_approx,2);
        forward_check(ii) = norm(gradf(x_0) - forward_approx,2);
    end
end