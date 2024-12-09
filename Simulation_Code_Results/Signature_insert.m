function [M_2] = Signature_insert(M_1,S)
    [m,n] = size(S);
    [M,N] = size(M_1);
    Series = S > mean(S(:));
    Series = reshape(Series,1,m*n);
    Series = uint8(Series);
    M_2 = reshape(M_1,1,M*N);
    M_2(1:m*n) = M_2(1:m*n) - bitget(M_2(1:m*n),1) + Series;
    M_2 = reshape(M_2,M,N);
end

