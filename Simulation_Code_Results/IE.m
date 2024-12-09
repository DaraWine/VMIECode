function entropy = IE(I)
    [rows, cols] = size(I);
    numLevels = 256; 
    count = zeros(1, numLevels);
    

    for i = 1:rows
        for j = 1:cols
            intensity = I(i, j) + 1; 
            count(intensity) = count(intensity) + 1;
        end
    end
    prob = count / (rows * cols);

    prob(prob == 0) = [];

    entropy = -sum(prob .* log2(prob));
end
