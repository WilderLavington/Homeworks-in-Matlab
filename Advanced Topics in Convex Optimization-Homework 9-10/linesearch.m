function [t] = linesearch( f,gradf,xk,t_old)
    c = 10^-4;
    p = .9;
    t = t_old;
    pk = -gradf(xk);
    while f(xk + t*pk) > f(xk)+c*t*gradf(xk)'*pk
        t = p*t
    end
end

