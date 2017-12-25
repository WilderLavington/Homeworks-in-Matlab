%% Homework 3: Intermediate Numerical Analysis 2
%% Problem 1: Steady state convection on 3D rectangular plate
    %initialize values
    L = 9;
    W = 5;
    delta_z = .5;
    q = .6;
    k = .16;
    T_s = 20;
    T_inf = 25;
    h = .073;
    %grouping term for simplification
    Q = q*delta_z*h^2/k;
    %initialize grid
    y_grid = (W+1)*10;
    x_grid = (L)*10+1;
    grid = zeros(x_grid,y_grid);
    del = W/y_grid; 
    iterations = 1000;
    tol = 10^(-5);
    theta = @(T) (T - T_inf)/(T_s - T_inf);
    Re_dim = @(Theta) Theta*(T_s - T_inf)+T_inf;
    % initialize right and left BC
    grid(:,1) = theta(T_s);
    grid(:,end) = theta(T_s);
    %iterate to convergence
    for ii = 1:iterations
        %store for stopping conditions
        oldgrid = grid;
        for kk = 1:x_grid
            for jj = 2:y_grid-1
                %bottom boundary condition
                if kk == 1
                    grid(kk,jj) = (1/(2*(1+(L/W)^2)))*(...
                         2*grid(kk+1,jj) - 6*L*del +...
                         + ((L/W)^2)*(grid(kk,jj+1)+grid(kk,jj-1))-Q*del^2);
                %top boundary condition
                elseif kk == x_grid
                    grid(kk,jj) = (1/(2*(1+(L/W)^2)))*(...
                        grid(kk,jj-1)+grid(kk,jj+1)+((L/W)^2)*grid(kk-1,jj) - Q*del^2) ...
                    	/(1+(.5*h*L*del/k)/(1+(L/W)^2));
                %interior
                else
                    grid(kk,jj) = (1/(2*(1+(L/W)^2)))*(...
                        grid(kk-1,jj) + grid(kk+1,jj) +...
                        ((L/W)^2)*grid(kk,jj+1) + ((L/W)^2)*grid(kk,jj-1)-Q*del^2);
                end
                %stopping conditions
                if norm(oldgrid-grid) < tol
                    break
                end
            end
        end
    end
% plot heatmap non dimentionalized 
HeatMap(grid)
% plot re-dimentionalized
new_grid = Re_dim(grid);
HeatMap(Re_dim(grid))
%% Problem 2: Transient temperature in a rod
    %% initialize parameters
    L = 2;
    k = .13;
    c = .11;
    ro = 7.8;
    alpha = k/(ro*c);
    n = 8;
    del_x = L/n;
    %initial dimentionless distribution
    f1 = @(x) 2*x;
    f2 = @(x) 2*(1-x);
    X1 = linspace(0,1/2,n/2);
    X2 = linspace(1/2,1,n/2);
    theta = [f1(X1) f2(X2)]';
    X = linspace(0,1,n);
    %part 1: r = .5
    r = .5;
    figure(1)
    for ii = 1:100
        if ii == 15 
            temp = (old_theta+theta)/2;
            temp(4)
            plot(X,temp)
            hold on
        elseif ii == 19
            theta(4)
            plot(X,theta)
            hold on
        elseif  ii == 1
            theta(4)
            plot(X,theta)
            hold on
        end
        old_theta = theta;
        %interior
        A = full(gallery('tridiag',n,-r/2,1+r,-r/2));
        b = full(gallery('tridiag',n,r/2,1-r,r/2))*theta;
        %boundary 
        A(1,:) = zeros(1,n);
        A(1,1) = 1;
        A(n,:) = zeros(1,n);
        A(n,n) = 1;
        b(1) = 0;
        b(n) = 0;
        %solve linear system
        theta = linsolve(A,b);
    end
    %part 2: r = 1
    r = 1;
    theta = [f1(X1) f2(X2)]';
    X = linspace(0,1,n);
    figure(2)
    for ii = 1:100
        if ii == 7 
            theta(4)
            plot(X,theta)
            hold on
        elseif ii == 9
            theta(4)
            plot(X,theta)
            hold on
        elseif  ii == 1
            theta(4)
            plot(X,theta)
            hold on
        end
        %interior
        A = full(gallery('tridiag',n,-r/2,1+r,-r/2));
        b = full(gallery('tridiag',n,r/2,1-r,r/2))*theta;
        %boundary 
        A(1,:) = zeros(1,n);
        A(1,1) = 1;
        A(n,:) = zeros(1,n);
        A(n,n) = 1;
        b(1) = 0;
        b(n) = 0;
        %solve linear system
        theta = linsolve(A,b);
    end
    % redo plot with dimentional temperature
    L = 2;
    k = .13;
    c = .11;
    ro = 7.8;
    alpha = k/(ro*c);
    n = 8;
    del_x = L/n;
    %initial dimentionless distribution
    f1 = @(x) x;
    f2 = @(x) 2-x;
    X1 = linspace(0,1,n/2);
    X2 = linspace(1,2,n/2);
    theta = [f1(X1) f2(X2)]';
    X = linspace(0,2,n);
    %part 1: r = .5
    r = .5;
    figure(3)
    for ii = 1:100
        if ii == 15
            dim2 = theta*100;
            x = 2*X;
            dim2(4)
            plot(x,dim2)
            hold on
        elseif ii == 19
            dim2 = theta*100;
            x = 2*X;
            dim2(4)
            plot(x,dim2)
            hold on
        elseif  ii == 1
            dim2 = theta*100;
            x = 2*X;
            plot(x,dim2)
            dim2(4)
            hold on
        end
        %interior
        A = full(gallery('tridiag',n,-r/2,1+r,-r/2));
        b = full(gallery('tridiag',n,r/2,1-r,r/2))*theta;
        %boundary 
        A(1,:) = zeros(1,n);
        A(1,1) = 1;
        A(n,:) = zeros(1,n);
        A(n,n) = 1;
        b(1) = 0;
        b(n) = 0;
        %solve linear system
        theta = linsolve(A,b);
    end
    %part 2: r = 1
    r = 1;
    theta = [f1(X1) f2(X2)]';
    X = linspace(0,1,n);
    figure(4)
    for ii = 1:100
        if ii == 7 
            dim2 = theta*100;
            x = 2*X;
            plot(x,dim2)
            dim2(4)
            hold on
        elseif ii == 9
            dim2 = theta*100;
            x = 2*X;
            plot(x,dim2)
            dim2(4)
            hold on
        elseif  ii == 1
            dim2 = theta*100;
            x = 2*X;
            plot(x,dim2)
            dim2(4)
            hold on
        end
        %interior
        A = full(gallery('tridiag',n,-r/2,1+r,-r/2));
        b = full(gallery('tridiag',n,r/2,1-r,r/2))*theta;
        %boundary 
        A(1,:) = zeros(1,n);
        A(1,1) = 1;
        A(n,:) = zeros(1,n);
        A(n,n) = 1;
        b(1) = 0;
        b(n) = 0;
        %solve linear system
        theta = linsolve(A,b);
    end
%% Problem 3: Steady state dimentionless temperature within Circlur Plate (Cartesian)
    %% 17 node grid
    % Initialize parameters
    n = 17+6;
    %create linear system
    A = zeros(n); %one accounts for top phantom
    b = zeros(n,1);
    %interior, rows 5,6,9,10,11
    b(5) = 0; b(11) = 0;  b(6) = 0;
    A(5,5) = 1; A(5,6) = -1/4; A(5,2) = -1/4; A(5,9) = -1/4; A(5,4) = -1/4;
    A(6,6) = 1; A(6,3) = -1/4; A(6,5) = -1/4; A(6,7) = -1/4; A(6,10) = -1/4;
    b(9) = 0;
    A(9,9) = 1; A(9,8) = -1/4; A(9,5) = -1/4; A(9,10) = -1/4; A(9,14) = -1/4;
    b(10) = 0;
    A(10,10) = 1; A(10,9) = -1/4; A(10,6) = -1/4; A(10,11) = -1/4; A(10,15) = -1/4;
    b(11) = 0;
    A(11,11) = 1; A(11,10) = -1/4; A(11,7) = -1/4; A(11,12) = -1/4; A(11,16) = -1/4;
    %reflected values, 4,8
    b(4) = 0; b(8) = 0;
    A(4,4) = 1; A(4,5) = -1/2; A(4,8) = -1/4; A(4,1) = -1/4;
    A(8,8) = 1; A(8,9) = -1/2; A(8,4) = -1/4; A(8,13) = -1/4;
    %reflected on boundary, 1,13 
    b(1) = 1/4; b(13) = 0;
    A(1,1) = 1; A(1,2) = -1/2; A(1,4) = -1/4;
    A(13,13) = 1; A(13,14) = -1/2; A(13,8) = -1/4;
    % even boundary pionts, 14,15,16 
    b(14) = 0; b(15) = 0; b(16) = 0;
    A(14,14) = 1; A(14,13) = -1/4; A(14,15) = -1/4; A(14,9) = -1/4;
    A(14,19) = -1/4;
    A(15,15) = 1; A(15,14) = -1/4; A(15,16) = -1/4; A(15,10) = -1/4;
    A(15,20) = -1/4;
    A(16,16) = 1; A(16,15) = -1/4; A(16,17) = -1/4; A(16,11) = -1/4;
    A(16,21) = -1/4;
    % uneven boundary points 2, 17
    b(2) = .58575; b(17) = .58575;
    A(2,2) = 2.112347; A(2,1) = -.5; A(2,3) = -.5; A(2,5) = -.52659;
    A(17,17) = 2.112347; A(17,16) = -.52659; A(17,12) = -.5;  A(17,22) = -.5;
    % uneven boundary points 3, 12
    b(3) = 1.58457; b(12) = 1.58457;
    A(3,3) = 2.71644; A(3,2) = -.5; A(3,6) = -.63187;
    A(12,12) = 2.71644; A(12,17) = -.5; A(12,11) = -.63187;
    % even piont on boundary 7
    b(7) = 1/2;
    A(7,7) = 1; A(7,6) = -1/4; A(7,11) = -1/4;
    % add phantom pionts
    A(18,18) = 1; A(19,19) = 1; A(20,20) = 1; A(21,21) = 1; A(22,22) = 1;
    A(23,23) = 1;
    % solve linear system
    soln = linsolve(A,b);
    %soln = soln - min(soln);
    soln = soln;
    %reconstruct 
    q_circ = zeros(6);
    q_circ(6,:) = 0;
    q_circ(1,1) = 1; q_circ(1,2) = 1; q_circ(2,4) = 1; q_circ(3,5) = 1; 
    q_circ(4,6) = 1; q_circ(5,6) = 1;
    q_circ(2,1:3) = soln(1:3);
    q_circ(3,1:4) = soln(4:7);
    q_circ(4,1:5) = soln(8:12);
    q_circ(5,1:5) = soln(13:17);
    q_circ = flip(q_circ);
    new = flip(q_circ')';
    semi_circ = [new q_circ];
    %heatplot
    HeatMap(semi_circ)
    %% do the exact same thing with averaging, and a large enough matrix to 
    %approximate a circle
    [rr cc] = meshgrid(1:1000);
    C = sqrt((rr-500).^2+(cc-500).^2)<=500-1;
    C = C(:,1:end-1);
    C = .1*C; 
    % convert to semi circle
    C = C(1:501,:);
    HeatMap(flip(C)) %heatmap reads upside down
    % add filler at top
    C = vertcat(ones(1,999),C);
    %set outer circle values to 1
    C(find(C==0)) = 1;
    %convert baseline to 0
    C(502,:) = 0;
    C(501,:) = 0;
    %duplicate C to update to laplace eqn
    Laplace_circle = C;
    %initializations
    tol = 10^(-2);
    diff = 10;
    count = 1;
    iterations = 10^(4);
    n1 = 502;
    n2 = 1000;
    while diff > tol && count < iterations
        diff = Laplace_circle;
        for jj = 2:n1-1
            for kk = 2:n2-1
                if C(jj,kk) == .1 
                    %average values within circle
                   Laplace_circle(jj,kk) = .25*(Laplace_circle(jj,kk+1)+Laplace_circle(jj,kk-1)+Laplace_circle(jj-1,kk)...
                       + Laplace_circle(jj+1,kk));
                end
            end
        end
        count = count + 1;
        diff = norm(diff - Laplace_circle);
    end
    %set outer values back to zero to 0
    Laplace_circle(find(Laplace_circle == 1)) = 0;
    %plot
    HeatMap(flip(Laplace_circle))
%% Problem 4: Steady state dimentionless temperature within Circlur Plate (Polar)
n = 17;
del_theta = pi/8;
del_r = .2;
A = zeros(25);
b = zeros(25,1);
%boundary values 
A(1,1) = 1; A(2,2) = 1; A(3,3) = 1; A(4,4) = 1;
b(1:4) = 1;
for ii = 5:25
    if mod(ii,5) == 0
        A(ii,ii) = 1; 
    elseif mod(ii,5)-1 == 0
        r_i = 1; %1-floor((ii/5))*.2
        A(ii,ii) = -2*(1/del_theta^2+1/del_r^2);
        A(ii,ii+5) = (1/del_r^2-.5/(del_r*(r_i)));
        A(ii,ii-5) = (1/del_r^2+.5/(del_r*(r_i)));
        A(ii,ii+1) = 2*(1/(del_theta*(r_i))^2);
    else
        r_i = 1; %1-floor((ii/5))*.2
        A(ii,ii) = -2*(1/del_theta^2+1/del_r^2);
        A(ii,ii+4) = (1/del_r^2-.5/(del_r*(r_i)));
        A(ii,ii-4) = (1/del_r^2+.5/(del_r*(r_i)));
        A(ii,ii+1) = (1/(del_theta*(r_i))^2);
        A(ii,ii-1) = (1/(del_theta*(r_i))^2);
    end
end
%solve 
soln = linsolve(A,b);




