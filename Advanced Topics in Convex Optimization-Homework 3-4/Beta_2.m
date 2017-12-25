function Beta_v2 = Beta_2(x,N)
    Beta_v2 = ifft(H_func(fft(x,N),N),N);
end