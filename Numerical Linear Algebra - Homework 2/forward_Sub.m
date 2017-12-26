function y = forward_Sub(G,b)
t = size(G,1)
if t==1
b(1) = b(1)/G(1,1);
end
if t>1
    ht = G(t,1:t-1);
    Gh = G(1:t-1,1:t-1);
    b = forward_Sub(Gh,b)
end
if t>1
    sum = 0;
for k = 1:t-1
  sum = sum +1/G(t-1,t-1)*(-ht(k)*b(k));
end
b(t) = 1/G(t,t)*(b(t))-sum
end
y = b
end
