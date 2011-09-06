function dcdham = decode_sample(sample)
% Take a 7x4 hamming matrix with errors and decode it
% Fixes errors in a 7x4 hamming matrix and assembles it into a 1x16 vector

    %Put the sample into the correcting function, which corrects single bit
    %errors in each column
    corrected_hcword = zeros(4,4); %empty 4x4 matrix
    for x = 1:4
        corrected_hcword(:,x) = correct(sample(:,x));
    end
    %Assemble the corrected 7x4 codeword, now a 4x4 vector, returning it 
    %to the original 1x16 vector
    dcdham = assemble(corrected_hcword);
    
end