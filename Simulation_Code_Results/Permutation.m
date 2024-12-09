function [I_1] = Permutation(I,key)
    [m,n] = size(I);
    I_s = reshape(I,1,m*n);
    chaos = Chaos_series(m*n,key(1),key(2));
    [~,s] = sort(chaos);
    I_1 = I_s(s);
    I_1 = reshape(I_1,m,n);
end

