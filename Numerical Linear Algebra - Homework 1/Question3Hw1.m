%perform all 6 types of matrix matrix mults
%time them
clear all 
p = 1;
times1 = zeros(p,1);
for m = 1:p
    n = 2^m;
    mat1 = rand(n);
    mat2 = rand(n);
    mat3 = zeros(n);
    mat1*mat2
    tic
    for j = 1:n
        for k = 1:n
            for i = 1:n
               mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
            end
        end
    end
    times1(m) = toc;
    mat3
    mat3 = zeros(n);
    for k = 1:n
        for j = 1:n
            for i = 1:n
               mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
            end
        end
    end
    mat3
end
figure(1)
plot(times1)
title('ijk Orientation')
xlabel('p = ln(n)/ln(2)') % x-axis label
ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% times2 = zeros(p,1);
% for m = 1:p
%     n = 2^m;
%     mat1 = rand(n);
%     mat2 = rand(n);
%     mat3 = zeros(n);
%     tic
%     for i = 1:n
%         for k = 1:n
%             for j = 1:n
%                mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
%             end
%         end
%     end
%     times2(m) = toc;
% end
% figure(2)
% plot(times2)
% title('ikj Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% times3 = zeros(p,1);
% for m = 1:p
%     n = 2^m;
%     mat1 = rand(n);
%     mat2 = rand(n);
%     mat3 = zeros(n);
%     tic
%     for j = 1:n
%         for k = 1:n
%             for i = 1:n
%                mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
%             end
%         end
%     end
%     times3(m) = toc;
% end
% figure(3)
% plot(times3)
% title('jki Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% times4 = zeros(p,1);
% for m = 1:p
%     n = 2^m;
%     mat1 = rand(n);
%     mat2 = rand(n);
%     mat3 = zeros(n);
%     tic
%     for j = 1:n
%         for i = 1:n
%             for k = 1:n
%                mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
%             end
%         end
%     end
%     times4(m) = toc;
% end
% figure(4)
% plot(times4)
% title('jik Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% 
% times5 = zeros(p,1);
% for m = 1:p
%     n = 2^m;
%     mat1 = rand(n);
%     mat2 = rand(n);
%     mat3 = zeros(n);
%     tic
%     for k = 1:n
%         for i = 1:n
%             for j = 1:n
%                mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
%             end
%         end
%     end
%     times5(m) = toc;
% end
% figure(5)
% plot(times5)
% title('kij Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% times6 = zeros(p,1);
% for m = 1:p
%     n = 2^m;
%     mat1 = rand(n);
%     mat2 = rand(n);
%     mat3 = zeros(n);
%     tic
%     for k = 1:n
%         for j = 1:n
%             for i = 1:n
%                mat3(i,j) =mat3(i,j)+mat1(i,k)*mat2(k,j);
%             end
%         end
%     end
%     times6(m) = toc;
% end
% figure(6)
% plot(times6)
% title('kji Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% %------------------------------------------------------------
% figure(7)
% plot(times1)
% hold on
% plot(times2)
% hold on
% plot(times3)
% hold on
% plot(times4)
% hold on
% plot(times5)
% hold on
% plot(times6)
% hold on
% title('All Orientation')
% xlabel('p = ln(n)/ln(2)') % x-axis label
% ylabel('times(sec)') % y-axis label
% legend('ijk Orientation','ikj Orientation','jki Orientation',...
%     'jik Orientation','kij Orientation','kji Orientation')
