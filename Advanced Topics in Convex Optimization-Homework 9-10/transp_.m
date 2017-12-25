function psi_trans = transp_(psi_transpose,coeff)
    sampledIndices = find(psi_transpose==1);
    length(coeff)
    length(sampledIndices)
    psi_transpose(sampledIndices) = coeff;
    psi_trans = psi_transpose;
end 