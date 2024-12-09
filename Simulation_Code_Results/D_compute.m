function [d] = D_compute(M_r)
    d = 0;
    
    for i = 1:64:512
        for j = 1:64:512
            r_judge = M_r(i:i+63,j:j+63);
            p = sum(sum(r_judge==0))/(64*64);
            d = d + (p-0.3525)^2;
        end
    end
    
    d = d/64;
end

