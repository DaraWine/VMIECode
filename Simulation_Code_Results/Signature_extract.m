function [S_extract] = Signature_extract(M_2)
    [M,N] = size(M_2);
    m = M/2;
    n = N/2;
    M_2 = reshape(M_2,1,M*N);
    S_extract = bitget(M_2(1:m*n),1);

    S_extract = reshape(S_extract,m,n);
    S_extract = uint8(S_extract*255);
end

