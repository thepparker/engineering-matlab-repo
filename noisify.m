function noisybits = noisify(hamming)
% Takes a 7x4 hamming matrix and inserts single bit errors into each
% codeword
    noisybits = zeros(7,4); %create an empty 7x4 vector
    for x = 1:4
        columnSize = 7;
        %randomly select an integer between 1 and 7, to use as an index in
        %the hamming 7x4 vector
        randBitPosition = round(randi(columnSize)); 
        %invert one of the bit positions using the randomly chosen index
        hamming(randBitPosition,x) = ~hamming(randBitPosition,x); 
        %put the new hamming column with an error into the empty noisybits
        %column
        noisybits(:,x) = hamming(:,x);
    end
end