function f = blur(x,N)
    h = exp(-[-2:2].^2/2)';
    f = cconv(x,h,N);
end