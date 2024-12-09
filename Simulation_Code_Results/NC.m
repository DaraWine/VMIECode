function [nc] = NC(I_1,I_2)
    X = I_1(:); Y = I_2(:);
    nc = sum(X.*Y)/(sqrt(sum(X.^2))*sqrt(sum(Y.^2)));
end

