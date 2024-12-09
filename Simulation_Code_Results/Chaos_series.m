function [series] = Chaos_series(N,x_0,r)
    series = zeros(1,N);
    x = x_0;
    for i = 1:1000
        x = f_c(x,r);
    end
    for i = 1:N
        x = f_c(x,r);
        series(i) = x;
    end
end

