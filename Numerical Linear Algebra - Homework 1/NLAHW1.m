%question 2
%matvect multiplication

%axrow
clear all
digits(10)
p = 12;
timeVect1 = zeros(1,p);
for k = 1:p
    n =2^k;
    matx = rand(n);
    vect = rand(n,1);
    X = zeros(1,n);
    tic
for i = 1:n
   for j = 1:n
       X(i) = X(i)+matx(i,j)*vect(j);
   end
end
timeVect1(k) = toc;
end
timeVect1
figure(1)
plot(timeVect1)
%axrcol
digits(15)
p = 12;
timeVect2 = zeros(1,p);
for k = 1:p
    n =2^k;
    X = zeros(1,n);
    matx = rand(n);
    vect = rand(n,1);
    tic
for i = 1:n
   for j = 1:n
       X(i) = X(i) + matx(j,i)*vect(j);
   end
end
timeVect2(k) = toc;
end
timeVect2
figure(2)
plot(timeVect2)
figure(3)
plot(timeVect2)
hold on
plot(timeVect1)
%question 3
%matmat multiplication

