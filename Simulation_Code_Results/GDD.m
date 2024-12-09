function [gdd] = GDD(A,B)
    gdd = (EGD(A) - EGD(B))/(EGD(A) + EGD(B));
end

