close all 
clear all
%% read in data from .csv files
white_wine_info = dlmread('winequality-white.csv',';',1,0);
red_wine_info = dlmread('winequality-red.csv',';',1,0);
% %plot all data against quality 
% for ii = 1:11
%     figure(ii)
%     scatter(white_wine_info(:,12), white_wine_info(:,12-ii))
%     hold on
%     scatter(red_wine_info(:,12),red_wine_info(:,12-ii))
%     hold on
% end
%% construct matricese
A_w = [ones(max(size(white_wine_info)),1) white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
% A_r = [ones(max(size(red_wine_info)),1) red_wine_info(:,1:11)];
% b_r = red_wine_info(:,12);
%% run values
n = min(size(white_wine_info));
cvx_begin
    variable x1(n)
    minimize( norm( A_w * x1 - b_w, 2 ) )
cvx_end
cvx_begin
    variable y1(n)
    minimize( norm( A_w * y1 - b_w, 1 ) )
cvx_end
%% %% run values without sections 1
A_w = [white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
n = min(size(A_w));
cvx_begin
    variable x2(n)
    minimize( norm( A_w * x2 - b_w, 2 ) )
cvx_end
cvx_begin
    variable y2(n)
    minimize( norm( A_w * y2 - b_w, 1 ) )
cvx_end
%% %% run values without sections 1, 9 
A_w = [white_wine_info(:,1:8) white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
n = min(size(A_w));
cvx_begin
    variable x3(n)
    minimize( norm( A_w * x3 - b_w, 2 ) )
cvx_end
cvx_begin
    variable y3(n)
    minimize( norm( A_w * y3 - b_w, 1 ) )
cvx_end
%% % plot residuals 
%section 1
A_w = [ones(max(size(white_wine_info)),1) white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
residualx = A_w*x1-b_w;
residualy = A_w*y1-b_w;
figure(1)
plot(residualx)
title('Residual of regression L2: with bias and unstable term')
xlabel('data points')
ylabel('residual error')
hold on
figure(2)
plot(residualy)
title('Residual of regression L1: with bias and unstable term')
xlabel('data points')
ylabel('residual error')
hold on
%% %section 2
A_w = [white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
residual = A_w*x2-b_w;
figure(1)
plot(residual)
title('Residual of regression L2: with unstable term')
xlabel('data points')
ylabel('residual error')
hold on
A_w = [white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
residual = A_w*y2-b_w;
figure(2)
plot(residual)
title('Residual of regression L1: with unstable term')
xlabel('data points')
ylabel('residual error')
hold on
%% %section 3
A_w = [white_wine_info(:,1:8) white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
residual = A_w*x3-b_w;
figure(1)
plot(residual)
title('Residual of regression: without unstable term')
xlabel('data points')
ylabel('residual error')
hold on
A_w = [white_wine_info(:,1:8) white_wine_info(:,1:11)];
b_w = white_wine_info(:,12);
residual = A_w*y3-b_w;
figure(2)
plot(residual)
title('Residual of regression: without unstable term')
xlabel('data points')
ylabel('residual error')
hold on
