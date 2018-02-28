function H = QR_iteration_quick(A,iter)
    % based upon lecture slides described by Bindel, Fall 2012 Matrix Computations (CS 6210)
    % convert matrix to upper hess
    Q = eye(length(A)); % Current Orthogonal Transform
    H = A; % Current Transformed Matrix
    for j = 1:length(A)-2
        u = H(j+1:end,j);
        u(1) = u(1) + sign(u(1))*norm(u);
        v = u/norm(u);
        H(j+1:end,:) = H(j+1:end,:)-2*v*(v'*H(j+1:end,:));
        H(:,j+1:end) = H(:,j+1:end)-(H(:,j+1:end)*(2*v))*v';
        Q(:,j+1:end) = Q(:,j+1:end)-(Q(:,j+1:end)*(2*v))*v';
    end
    
    % perform QR iterations 
    n = length(H);
    V = zeros(2,n-1);
    for ii = 1:iter
        % Compute the QR factorization
        for j = 1:n-1
            u = H(j:j+1,j);
            u(1) = u(1) + sign(u(1))*norm(u);
            v = u/norm(u);
            V(:,j) = v;
            H(j:j+1,:) = H(j:j+1,:)-2*v*(v'*H(j:j+1,:));
        end
        % Compute RQ
        for j = 1:n-1
            v = V(:,j);
            H(:,j:j+1) = H(:,j:j+1)-(H(:,j:j+1)*(2*v))*v';
        end
    end
end