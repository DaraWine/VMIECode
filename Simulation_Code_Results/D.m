function [d] = D(M_1, M_r)
    clip_1 = reshape(M_1(1:512,1:50),1,512*50);
    clip_2 = reshape(M_1(1:512,463:512),1,512*50);
    clip_3 = reshape(M_1(1:50,51:462),1,412*50);
    clip_4 = reshape(M_1(463:512,51:462),1,412*50);
    
    clip_1 = unique(clip_1);
    clip_2 = unique(clip_2);
    clip_3 = unique(clip_3);
    clip_4 = unique(clip_4);
    
    clip = unique([clip_1, clip_2, clip_3, clip_4]);
   
    d = 0;
    
    for i = 1:64:512
        for j = 1:64:512
            r_judge = ismember(M_r(i:i+63,j:j+63),clip);
            p = sum(sum(r_judge))/(64*64);
            d = d + (p-0.3525)^2;
        end
    end
    
    d = d/64;
end

