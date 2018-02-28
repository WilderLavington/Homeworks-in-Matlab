function H = conv_to_hess(A,iter)
    % convert matrix to upper hess
    Q = eye(length(A)); % Current Orthogonal Transform
    H = A; % Current Transformed Matrix
    for ii = 1:iter
        for j = 1:length(A)-2
            u = H(j+1:end,j);
            u(1) = u(1) + sign(u(1))*norm(u);
            v = u/norm(u);
            H(j+1:end,:) = H(j+1:end,:)-2*v*(v'*H(j+1:end,:));
            H(:,j+1:end) = H(:,j+1:end)-(H(:,j+1:end)*(2*v))*v';
            Q(:,j+1:end) = Q(:,j+1:end)-(Q(:,j+1:end)*(2*v))*v';
        end
    end
end