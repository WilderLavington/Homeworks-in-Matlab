function g_prime = g_prime_forward(h,f,n,x_0)
    e = eye(n);
    g_prime = zeros(n,n);
    flip = size(x_0);
    if flip(1) < flip(2)
        x_0 = x_0';
    end
    for ii = 1:n
    current = e(:,ii);
    g_prime(:,ii) = f(x_0 + h.*current)/h - f(x_0)/h;
    end
end