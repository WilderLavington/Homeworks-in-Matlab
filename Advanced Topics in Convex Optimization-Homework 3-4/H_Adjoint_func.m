function H_adjoint = H_Adjoint_func(z,N)
    h = exp(-[-2:2].^2/2)';
    h_hat = fft(h,N);
    bar_h_hat = conj(h_hat);
    H_adjoint = bar_h_hat.*z;
end