function [M_r] = Extract_secret(Q_s)
    [M,N] = size(Q_s);
    m = M/2;
    n = N/2;
    M_r = zeros(m,n);M_r=uint8(M_r);
    M_r = M_r + mod(Q_s(1:m,1:n),4);
    M_r = M_r + mod(Q_s(1:m,n+1:2*n),4) * 4;
    M_r = M_r + mod(Q_s(m+1:2*m,1:n),4) * 4^2;
    M_r = M_r + mod(Q_s(m+1:2*m,n+1:2*n),4) * 4^3;
end
