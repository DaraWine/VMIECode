function [J] = Zigzag(I)
    [row, column] = size(I);
    N = row;

    J = [];
    for i = 1:column
   
        A = I(1:i,1:i);
        X = diag(flipud(A'));
        if mod(i,2) == 0
            X = flip(X);
        end
        J = [J,X'];
    end

    for j = 2:row
        A = I(j:row,j:row);
        X = diag(flipud(A'));
        if mod(row+j-1,2) == 0
            X = flip(X);
        end
        J = [J,X'];
    end
   
    J = reshape(J,row,column);
    J = J';
end

