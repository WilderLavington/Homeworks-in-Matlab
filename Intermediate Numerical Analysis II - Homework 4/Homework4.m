%% Intermediate Numerical Analysis 2: Homework 4
%% Problem 1: Steady state temperature of weird plate
%% using finite differences
A = zeros(21);
b = zeros(21,1);
% constants 
h_1 = 1000;
h_2 = 200;
T_1 = 1700;
T_2 = 400;
k = 25;
del = .001;
%initialize
A = zeros(30,30);
A = zeros(30,30);
b = zeros(30,1);
%interior nodes
for ii = 1:30
    if ii == 1 
        A(ii,ii) = 1; A(ii,ii+1) = -.5;
        A(ii,ii+21) = -.25; A(ii,ii+6) = -.25;
    elseif ii <= 5
        A(ii,ii) = 1; A(ii,ii+1) = -.25; A(ii,ii-1) = -.25;
        A(ii,ii+21) = -.25; A(ii,ii+6) = -.25;
    elseif ii == 6
        A(ii,ii) = 1; A(ii,ii-1) = -.5;
        A(ii,ii+21) = -.25; A(ii,ii+6) = -.25;
    elseif ii == 7
        A(7,7) = 1; A(7,8) = -.5; A(7,13) = -.25; A(7,1) = -.25; b(7) = 0;
    elseif ii <= 12
        A(ii,ii) = 1; A(ii,ii+1) = -.25; A(ii,ii-1) = -.25;
        A(ii,ii+6) = -.25; A(ii,ii-6) = -.25;
    elseif ii == 13
        A(13,13) = 1; A(13,14) = -.5; A(13,19) = -.25; A(13,7) = -.25;
    elseif ii <= 15
        A(ii,ii) = 1; A(ii,ii+1) = -.25; A(ii,ii-1) = -.25;
        A(ii,ii+6) = -.25; A(ii,ii-6) = -.25;
    elseif ii < 18
        A(ii,ii) = 1; A(ii,ii+1) = -.25; A(ii,ii-1) = -.25;
        A(ii,ii+12) = -.25; A(ii,ii-6) = -.25;
    elseif ii == 18
        A(ii,ii) = 1; A(ii,ii-1) = -.5;
        A(ii,ii+12) = -.25; A(ii,ii-6) = -.25;
    elseif ii == 19
        A(19,19) = 1; A(19,20) = -.5; A(19,13) = -.5; b(19) = 0;
    elseif ii == 20  
        A(20,20) = 1; A(20,19) = -.25; A(20,21) = -.25; A(20,14) = -.5; b(19) = 0;
    elseif ii == 21
        A(ii,ii) = 1; A(ii,ii-1) = -.25; A(ii,28) = -.25; 
        A(ii,ii-6) = -.5;
    %phantom nodes
    elseif ii < 28
       shift = ii-21;
       A(ii,ii) = 1; A(ii,shift) = 2*(del)*h_1/k; A(ii,shift+6) = -1; 
       b(ii) = 2*(del)*h_1*T_1/k;
    elseif ii == 28
        A(28,28) = 1; A(28,20) = -1; A(28,21) = 2*(del)*h_2/k; 
        b(ii) = 2*(del)*h_2*T_2/k;
    else
       shift = ii-12;
       A(ii,ii) = 1; A(ii,shift) = 2*(del)*h_1/k; A(ii,shift+6) = -1; 
       b(ii) = 2*(del)*h_2*T_2/k;
    end
end
soln = linsolve(A,b);
soln(1:21)
%plot 
grid = zeros(5,6);
%grid(1,:) = soln(22:27);
grid(2,:) = soln(1:6);
grid(3,:) = soln(7:12);
grid(4,:) = soln(13:18);
grid(5,1) = soln(19); grid(5,2) = soln(20); grid(5,3) = soln(21);
%grid(5,4) = soln(28); grid(5,5) = soln(29); grid(5,6) = soln(30);
HeatMap(flip(grid))
%make larger grid 
grid_full = [grid; flip(grid)];
grid_full = [grid_full flip(grid_full')'];
HeatMap(grid_full)
%% using finite volumes
%initializations
h_1 = 1000;
h_2 = 200;
T_1 = 1700;
T_2 = 400;
k = 25;
del = 1;
% system 
A = zeros(21);
b = zeros(21,1);
% generate values for system
%BC 1
A(1,1) = -(.5*k-h_1); A(1,7) = k/2; A(1,2) = k/2; 
b(1) = del*h_1*T_1;
A(2,2) = -(2*k-h_1); A(2,8) = k/2; A(2,1) = k/4; A(2,3) = k/4; 
b(2) = del*h_1*T_1;
A(3,3) = -(2*k-h_1); A(3,9) = k/2; A(3,2) = k/4; A(3,4) = k/4; 
b(3) = del*h_1*T_1;
A(4,4) = -(2*k-h_1); A(4,10) = k/2; A(4,3) = k/4; A(4,5) = k/4;
b(4) = del*h_1*T_1;
A(5,5) = -(2*k-h_1); A(5,11) = k/2; A(5,4) = k/4; A(5,6) = k/4;
b(5) = del*h_1*T_1;
A(6,6) = -(.5*k-h_1); A(6,12) = k/2; A(6,5) = k/2; 
b(6) = del*h_1*T_1;
%interior row 1
A(7,7) = -1; A(7,8) = 1/2; A(7,1) = 1/4; A(7,13) = 1/4;
b(7) = 0;
A(8,8) = -1; A(8,7) = 1/4; A(8,9) = 1/4; A(8,14) = 1/4; A(8,2) = 1/4;
b(8) = 0;
A(9,9) = -1; A(9,8) = 1/4; A(9,10) = 1/4; A(9,3) = 1/4; A(9,15) = 1/4;
b(9) = 0;
A(10,10) = -1; A(10,9) = 1/4;  A(10,11) = 1/4; A(10,16) = 1/4; A(10,4) = 1/4;
b(10) = 0;
A(11,11) = -1; A(11,10) = 1/4;  A(11,12) = 1/4; A(11,17) = 1/4; A(11,5) = 1/4;
b(11) = 0;
A(12,12) = -1; A(12,11) = 1/2; A(12,18) = 1/4; A(12,6) = 1/4;
b(12) = 0;
%interior row 2
A(13,13) = -1; A(13,14) = 1/2; A(13,19) = 1/4; A(13,7) = 1/4;
b(13) = 0;
A(14,14) = -1; A(14,8) = 1/4; A(14,20) = 1/4; A(14,13) = 1/4; A(14,15) = 1/4;
b(15) = 0;
A(15,15) = -1; A(15,9) = 1/4; A(15,21) = 1/4; A(15,16) = 1/4; A(15,14) = 1/4;
b(15) = 0;
%interion row 3
A(19,19) = -1; A(19,13) = 1/2; A(19,20) = 1/2;
b(19) = 0;
A(20,20) = -1; A(20,21) = 1/4; A(20,19) = 1/4; A(20,14) = 1/2;
b(19) = 0;
%BC 2
A(16,16) =  (2*k-h_2); A(16,10) = 1/2; A(16,15) = 1/4; A(16,17) = 1/4;
b(16) = -del*h_2*T_2;
A(17,17) =  (2*k-h_2); A(17,11) = 1/2; A(17,16) = 1/4; A(17,18) = 1/4;
b(17) = -del*h_2*T_2;
A(18,18) =  (*k-h_2); A(18,12) = 1/2; A(18,17) = 1/2;
b(18) = -del*h_2*T_2;
A(21,21) =  (.5*k-h_2); A(21,15) = 1/2; A(21,20) = 1/2;
b(21) = -del*h_2*T_2;
% solve linear system
soln = linsolve(A,b);
%plot 
grid = zeros(4,6);
%grid(1,:) = soln(22:27);
grid(1,:) = soln(1:6);
grid(2,:) = soln(7:12);
grid(3,:) = soln(13:18);
grid(4,1) = soln(19); grid(4,2) = soln(20); grid(4,3) = soln(21);
%grid(5,4) = soln(28); grid(5,5) = soln(29); grid(5,6) = soln(30);
HeatMap(flip(grid))
%make larger grid 
grid_full = [grid; flip(grid)];
grid_full = [grid_full flip(grid_full')'];
HeatMap(grid_full)
%% Problem 6: Solution to the wave equation
%% a) sinusoidal boundary conditions 
iterations = 100;
del_x = .05;
del_t = .025;
c = 1;
string_init = linspace(0,1,1/del_x);
string_current = sin(2*pi*string_init);
string_current(1) = 0; string_current(1/del_x) = 0;
string_new = string_current;
string_old = string_current;
string_current = string_new; 
figure(1)
for ii = 1:iterations
    for jj = 2:length(string_current)-1
        string_new(jj) = (2*(1-(del_t/del_x)^2))*string_current(jj) + ...
           ((del_t/del_x)^2)*(string_current(jj-1)+string_current(jj+1)) - ...
           string_old(jj);
    end
    string_old = string_current;
    string_current = string_new;
    plot(string_init,string_current)
    hold on
%     %draw stuff
%     delete(h)
%     h = animatedline;
%     axis([0 1 -1 1])
%     addpoints(h,string_init,string_current);
%     delete(h)
     drawnow
end
title('sinusoidal starting conditions');
%% b) triangular boundary conditions 
% function 
close all
string_init = linspace(0,1,1/del_x);
string_current = string_init;
string_current(1:floor(length(string_init)/2)) = 2*string_init(1:floor(length(string_init)/2));
string_current(floor(length(string_init)/2)+1:end) = 2-2*string_init(floor(length(string_init)/2)+1:end);
% initialization
iterations = 1000;
del_x = .05;
del_t = .025;
c = 1;
%boundary condtion
string_new = string_current;
string_old = string_current;
string_current = string_new; 
h = animatedline;
axis([0 1 -1 1])
addpoints(h,string_current,string_init);
figure(2)
for ii = 1:iterations
    for jj = 2:length(string_current)-1
        string_new(jj) = (2*(1-(del_t/del_x)^2))*string_current(jj) + ...
           ((del_t/del_x)^2)*(string_current(jj-1)+string_current(jj+1)) - ...
           string_old(jj);
    end
    string_old = string_current;
    string_current = string_new;
    plot(string_init,string_current)
    hold on
    %draw stuff
%     delete(h)
%     h = animatedline;
%     axis([0 1 -1 1])
%     addpoints(h,string_init,string_current);
     drawnow
end
title('triangular starting conditions');


    
    
    
    
