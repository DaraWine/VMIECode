function [B] = Fract_iterate(A)
    B = [A A; A A] * 0;
    [m,n] = size(A);
    for i = 1:2:m
        for j = 1:2:n
            T_matrix = A(i:i+1,j:j+1);
            T_12 =  T_matrix(1,2) - T_matrix(1,1) + T_matrix;
            T_21 =  T_matrix(2,1) - T_matrix(1,1) + T_matrix;
            T_22 =  T_matrix(2,2) - T_matrix(1,1) + T_matrix;
            B(2*i-1:2*i+2,2*j-1:2*j+2) = [T_matrix T_12; T_21 T_22];
        end
    end
end



