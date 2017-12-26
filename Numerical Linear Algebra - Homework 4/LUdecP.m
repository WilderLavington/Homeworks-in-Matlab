%LU decomp with partial pivoting
%jon lavington 2016
%need to store column vector P
function y = LUdecP(a,n)
%Create pivot 
p = zeros(n,1);
counter = 0;
for g = 1:n
counter = counter+1; 
p(g) = counter;
end
%check if matrix is singuler
if det(a)==0 
    return
end
for k = 1 : n-1
%check all diagnols for zero then rotate until you have non zeros
count = 0;
for t = k:n
q = p(t,1);
while a(q,q)==0 
    [val, idx] = max(a(:,q));
    p(t) = idx;
    p(idx) = t;
end
count = 0;
end
%Find first column of L
for i = k+1 : n 
a(p(k),k)
a(p(i),k) = a(p(i),k) / a(p(k),k);
for j = k+1:n
a(p(i),j) = a(p(i),j) - a(p(i),k)*a(p(k),j);
end
end
y = a;
end