%chol solve
mat = [2 -1 1;-1 2 -1;0 -1 2];
n = 3;
chol(mat);
mat = [2 -1 0;0 2 -1;0 0 2];
counter  = 0;
for i = 1:(n)
    mat(i,i) = sqrt(mat(i,i));
    for j = i+1:n
        mat(i,j) = mat(i,j)/mat(i,i);
        for k = (i+1):j
            mat(k,j) = mat(k,j)-mat(i,k)*mat(i,j); counter = counter+1;
        end
    end
end

% recursive partitioned LTM
b = ones(n,1);
x = zeros(n,1);
G = [2 -1 0;0 2 -1;0 0 2]';
forward_Sub(G,b)
%non-recursive definition LTM

