function [I] = InverCircular(J)
    x = 0.3547,y = 0.7854; u = 3.7;
    [m,n] = size(J);
    
    X = zeros(1,m); X(1) = x;
    for i = 2:m
        X(i) = u * X(i-1)*(1-X(i-1));
    end
    [o_x, SX] = sort(X);

    Y = zeros(1,n); Y(1) = y;
    for i = 2:n
        Y(i) = u * Y(i-1)*(1-Y(i-1));
    end
    [o_y, SY] = sort(Y);
    
    I1 = J;
    I1(:,1:n) = J(:,SY);
    I(1:m,:) = I1(SX,:);
end
