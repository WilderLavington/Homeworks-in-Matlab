function [U,T] = QR_iteration(A,iter)
    T = A;
    U = eye(size(A));
    for ii = 1:iter
        [Q,R] = qr(T);
        U = U*Q;
        T = R*Q;
    end
end