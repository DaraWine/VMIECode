function [y] = f_c(x,r)
    y = 10^6 * r * x * (1-x) * exp(cos(pi*r*x));
    y = mod(sin(y),1);
end

