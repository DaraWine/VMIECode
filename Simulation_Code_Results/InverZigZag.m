function [I1] = InverZigZag(J)
    % clc;clear all
    % I= [1 2 3 4;5 6 7 8;9 10 11 12; 13 14 15 16];
    % [row, column] = size(I);
    % N = row;
    % 
    % J = [];
    % for i = 1:column
    % 
    %     A = I(1:i,1:i);
    %     X = diag(flipud(A'))
    %     if mod(i,2) == 0
    %         X = flip(X);
    %     end
    %     J = [J,X'];
    % end
    % 
    % for j = 2:row
    %     A = I(j:row,j:row);
    %     X = diag(flipud(A'));
    %     if mod(row+j-1,2) == 0
    %         X = flip(X);
    %     end
    %     J = [J,X'];
    % end
    % 
    % J = reshape(J,row,column);J = J';
    J1 = J';
    [row, column] = size(J);
    L= reshape(J1,1,row*column);

    N = row;
    
    I1 = zeros(N, N); I1 = uint8(I1);

    for i = 1:column
        start = sum(1:i-1) + 1;
        Diag = L(start:start+i-1);
        if mod(i,2) == 0
           Diag = flip(Diag);
        end

        for k = 1:i
            I1(k,i+1-k) = Diag(k);
        end
    end
    
    L = L(sum(1:N)+1:N*N);
    for i = row-1:(-1):1
        start = sum(1:row-1) - sum(1:i) + 1;
        Diag = L(start:start+i-1);
        if mod(N + row-i, 2) == 0
            Diag = flip(Diag);
        end

        for k = column:(-1):column-i+1
            I1(2*row + 1-i-k,k) = Diag(column-k+1);
        end
    end
    
end

