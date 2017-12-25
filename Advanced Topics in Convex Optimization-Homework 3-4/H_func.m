function H = H_func(z,N)
h = exp(-[-2:2].^2/2)';
h_hat = fft(h,N);
H = h_hat.*z;
end