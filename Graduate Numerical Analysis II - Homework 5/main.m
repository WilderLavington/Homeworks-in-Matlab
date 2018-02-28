% generate some random symmetric matrices
A1=rand(5);
A1=0.5*(A1+A1');
A2=rand(25);
A2=0.5*(A2+A2');
A3=rand(100);
A3=0.5*(A3+A3');
% convert to tridiagnol 
A1 = full(gallery('tridiag',5,1,1,1)).*A1;
A2 = full(gallery('tridiag',25,1,1,1)).*A2;
A3 = full(gallery('tridiag',125,1,1,1)).*A3;
% now plot sum of squared off diagnol values over iterations for each
plotting = zeros(10^3,3);
for ii = 1:10^3
    plotting(ii,1) = norm((QR_iteration_tri(A1,ii)-diag(QR_iteration_tri(A1,ii))),2);
    plotting(ii,2) = norm((QR_iteration_tri(A2,ii)-diag(QR_iteration_tri(A2,ii))),2);
    plotting(ii,3) = norm((QR_iteration_tri(A3,ii)-diag(QR_iteration_tri(A3,ii))),2);
end
figure(1)
hold on
plot(plotting(:,1))
plot(plotting(:,2))
plot(plotting(:,3))
legend('size = 5','size = 25','size = 100', 'Location','northwest')
