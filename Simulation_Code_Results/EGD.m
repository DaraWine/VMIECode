function [egd] = EGD(A)
    A = double(A);
    [m,n] = size(A);
    egd = 0;
    for i = 2:m-1
        for j = 2:n-1
            a = 0;
            a = a + (A(i,j)-A(i-1,j))^2;
            a = a + (A(i,j)-A(i+1,j))^2;
            a = a + (A(i,j)-A(i,j+1))^2;
            a = a + (A(i,j)-A(i,j-1))^2;
            egd = egd + a/4;
        end
    end
    egd = egd/(m-2)/(n-2);
end

