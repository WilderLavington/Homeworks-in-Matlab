function Beta_star = Beta_Adjoint(x,N)
    Beta_star = ifft(H_Adjoint_func(fft(x,N),N),N);
end