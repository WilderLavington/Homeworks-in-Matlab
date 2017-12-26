%norml LU decomp
%jon lavington 2016
function y = LUdec(a,n)
for k = 1 : n
for i = k+1 : n
a(i,k) = a(i,k) / a(k,k);
for j = k+1:n
a(i,j) = a(i,j) - a(i,k)*a(k,j);
end
end
y = a;
end