% (PART2) write implicite to explicite function for linear function beta
function B = implicit2explicit(beta_function,N)
    temp = eye(N);
    B = zeros(N);
    for ii = 1:N
        current_basis= temp(:,ii);
        eval1 = beta_function(current_basis,N);
        B(:,ii) = eval1;
    end
end