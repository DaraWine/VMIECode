function [I] = InverArnold(J)
    [row, column] = size(J);
    N = row;
    I=J;
    for i1 = 0:N-1
        for j1 = 0:N-1
            i = mod(2*i1 - j1,N); j = mod(-i1 + j1,N);
            I(i+1,j+1) = J(i1+1,j1+1);
        end
    end

end

