function t_new = linesearch(f,grad_f,x_old,t_old)
    p = .9;
    c = 10^(-4);
    new_check_1 = f(x_old + t_old*p);
    new_check_2 = f(x_old) + c*t_old*(-norm(grad_f(x_old),2));
    t_new = t_old;
    counter = 1;
    while new_check_1 <= new_check_2 | counter < 10^(10)
        t_new = p.*t_new;
        counter = counter+1;
    end
end