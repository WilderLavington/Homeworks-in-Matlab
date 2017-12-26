function [L, U, P] = LU_pivot(A)
    [m, n] = size(A); L=eye(n); P=eye(n); U=A;
    for k=1:m-1
        pivot=max(abs(U(k:m,k)));
        for j=k:m
            if(abs(U(j,k))==pivot)
                ind=j;
                break;
            end
        end
        U([k,ind],k:m)=U([ind,k],k:m);
        L([k,ind],1:k-1)=L([ind,k],1:k-1);
        P([k,ind],:)=P([ind,k],:);
        for j=k+1:m
            L(j,k)=U(j,k)/U(k,k);
            U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m);
        end
    end
end