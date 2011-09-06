function assembled = assemble(codeword)
%Take a 4x4 decoded and corrected hamming codeword and turn it into a 16x1
%vector
    flippedAssembled = zeros(1,16); %create an empty 1x16 vector
    %d13 d9  d5 d1
    %d14 d10 d6 d2
    %d15 d11 d7 d3
    %d16 d12 d8 d4
    %place the 1st column of the decoded hamming codeword into the last 4
    %bits of the 1x16 vector
    flippedAssembled(13:16) = codeword(:,1); 
    flippedAssembled(9:12) = codeword(:,2); %as above, but 2nd column and 2nd set of 4 bits
    flippedAssembled(5:8) = codeword(:,3); %etc
    flippedAssembled(1:4) = codeword(:,4);
    
    %flip the vector 180 degrees (so it's in the form d16d15d14... again
    %instead of d1d2d3...
    assembled = rot90(flippedAssembled,2);
end