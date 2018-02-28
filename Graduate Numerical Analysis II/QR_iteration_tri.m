function H = QR_iteration_tri(H,iter)
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