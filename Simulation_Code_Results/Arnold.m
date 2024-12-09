function [J] = Arnold(I)
    [row, column] = size(I);
    N = row;
    J = I;
    for i = 0:N-1
        for j = 0:N-1
            i1 = mod(i + j,N); j1 = mod(i + 2*j,N);
            J(i1+1,j1+1) = I(i+1,j+1);
        end
    end
 
end

