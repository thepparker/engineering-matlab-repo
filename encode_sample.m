function codewords = encode_sample(sample)
% This function accepts a 16 x 1 vector of 0s and 1s as input
% (sample) and returns a 7 x 4 matrix of codewords (codewords)
% First break the input sample into 4-bit chunks with each
% chunk appearing as a column of the 4 x 4 matrix chunks
    chunks = chunk(sample);
    % Define the size of the output
    codewords = zeros(7,4);
    % Now calculate the codeword using the hamming function for each
    % of the chunks by looping four times over each of the 4-bit
    % chunks
    for x = 1:4 %loop through each column
        codewords(:,x) = hamming(chunks(:,x)); %insert the hammingified 
        %chunk into an empty column
    end
end
