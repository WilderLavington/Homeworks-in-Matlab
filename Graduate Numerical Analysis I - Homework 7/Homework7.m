
%%% Legendre polynomial
p = @(x) (1/128).*(315.*x-4620.*x^3+18018.*x^5-25740.*x^7+12155.*x^9);
pp_approx = @(x,h) (p(x+h) - p(x-h))/(2*h);
%%% Rootfiinding 
Tol = .000001;
incomplete = 1;
roots = rand(1,9);
current_root = 1;
h = .00001;
while incomplete
    
    %%% update root
    roots(current_root) = roots(current_root) - p(roots(current_root))/pp_approx(roots(current_root),h);
    
    %%% check tolerance
    if abs(p(roots(current_root))) < Tol
        
        %%% print information
        disp('new root found: ')
        disp(roots(current_root))
        
        %%% update polynomial and continue to iterate
        p_update = @(x) p(x);
        p = @(x) p_update(x) / (x - roots(current_root));
        pp_approx = @(x,h) (p(x+h) - p(x-h))/(2*h);
        roots(current_root) = round(roots(current_root), 7);
        current_root = current_root + 1;
        
    end
    
    % check if we have found all roots
    if current_root == 10
        incomplete = 0;
    end
    
end
format short
p = @(x) (1/128).*(315.*x-4620.*x.^3+18018.*x.^5-25740.*x.^7+12155.*x.^9);
disp(' these are the roots: ')
disp(roots)
disp('these are their values: ')
disp(p(roots))
    