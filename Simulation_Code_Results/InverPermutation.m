function [I_s] = InverPermutation(I,key)
    [m,n] = size(I);
    I_1 = reshape(I,1,m*n);
    chaos = Chaos_series(m*n,key(1),key(2));
    [~,s] = sort(chaos);
    I_s = I_1;
    I_s(s) = I_1;
    I_s = reshape(I_s,m,n);
end
