function [r] = Insert(a,x)
    r = a - mod(a,4) + x;
end

