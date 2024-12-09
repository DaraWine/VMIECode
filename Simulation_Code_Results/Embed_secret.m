function [Q_s] = Embed_secret(Q,M)
    B = Bit_part(M);

    [m,n] = size(M);

    Q_s = Q;
    Q_s(1:m,1:n) = Insert(Q_s(1:m,1:n),B(:,:,1));
    Q_s(1:m,n+1:2*n) = Insert(Q_s(1:m,n+1:2*n),B(:,:,2));
    Q_s(m+1:2*m,1:n) = Insert(Q_s(m+1:2*m,1:n),B(:,:,3));
    Q_s(m+1:2*m,n+1:2*n) = Insert(Q_s(m+1:2*m,n+1:2*n) ,B(:,:,4));
end

