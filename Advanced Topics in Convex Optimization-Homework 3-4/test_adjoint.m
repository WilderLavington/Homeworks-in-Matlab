function Average_error = test_adjoint(B,B_star,number_of_tests,N)
    difference = 0;
    for ii = 1:number_of_tests
        x = normrnd(0,1,N,1);
        y = normrnd(0,1,N,1);
        In1 = dot(B*x,y);
        In2 = dot(x,B_star*y);
        difference = difference+norm(In1-In2,2);
    end
    Average_error = difference/number_of_tests;
end