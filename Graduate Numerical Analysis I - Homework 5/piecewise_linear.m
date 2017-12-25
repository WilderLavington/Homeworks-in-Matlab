function vector = piecewise_linear(x,f,equispaced_pionts)
    vector = zeros(length(x),1);
    for x_c = 1:length(x)
        for ii = 1:20
            if x(x_c) < equispaced_pionts(ii+1) & x(x_c) > equispaced_pionts(ii)
                val = f(equispaced_pionts(ii)) ...
                    + ((f(equispaced_pionts(ii+1)) - f(equispaced_pionts(ii)))/...
                      (equispaced_pionts(ii+1) - equispaced_pionts(ii)))*...
                      (x(x_c) - equispaced_pionts(ii));
            elseif x(x_c) == equispaced_pionts(ii+1)
                val = f(equispaced_pionts(ii+1));
            elseif x(x_c) == equispaced_pionts(ii)
                val = f(equispaced_pionts(ii));
            end
        end
        vector(x_c) = val;
    end
end