%home work 4 
%jonathan lavington
%question 3 generate 4 different random matrices then check the error on
%them with partial pivoting versus non parital pivoting
n = 50;
m = 40;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Vanilla LU
    LU = LUdec(M,m);
    L = tril(LU);
    %L =L - diag(diag(L+1));
    L(logical(eye(size(L))))= 1;
    U = triu(LU);
    L*U-M;
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50
%==============================================================
m = 80;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Vanilla LU
    LU = LUdec(M,m);
    L = tril(LU);
    L(logical(eye(size(L))))= 1;
    U = triu(LU);
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50
%==============================================================
m = 160;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Vanilla LU
    LU = LUdec(M,m);
    L = tril(LU);
    L(logical(eye(size(L))))= 1;
    U = triu(LU);
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50
%==============================================================
%==============================================================
%==============================================================
n = 50;
m = 40;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Permuted LU
    [L,U,P] = lu(M);
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-P*M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50
%==============================================================
m = 80;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Permuted LU
    [L,U,P] = lu(M);
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-P*M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50
%==============================================================
m = 160;
normL = 0;
normU = 0;
normE = 0;
for i =  1:n
    M = rand(m);
    M(1,1) = 2e-10;
    %Permuted LU
    [L,U,P] = lu(M);
    %Compute norm for L,U,E
    normL = normL+norm(L,inf);
    normU = normU+norm(U,inf);
    normE = normE+norm((L*U-P*M),inf);
end
%Now average norms 
normL =normL/50
normE =normE/50
normU =normU/50

