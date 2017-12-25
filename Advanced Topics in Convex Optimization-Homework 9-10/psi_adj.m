function [ out] = psi_adj( x ,n1,psi)
    out = zeros(n1,1);
    index = find(psi == 1);
    out(index) = x;


end

