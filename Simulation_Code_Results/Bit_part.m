function [B] = Bit_part(A)
    A = double(A);
    [m,n] = size(A);
    B = zeros(m,n,4);
    for i = 1:4
        B(:,:,i) = mod(A,4);
        A = (A - B(:,:,i))/4;
    end
    B = uint8(B);
end

