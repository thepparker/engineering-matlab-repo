function fourbit = chunk(sample)
% Take a 1x16 matrix and turn it into 4x4 chunks
    
    %d13 d9  d5 d1
    %d14 d10 d6 d2
    %d15 d11 d7 d3
    %d16 d12 d8 d4
    %sample = d16 d15 d14 d... d1
    fourbit = zeros(4,4);  %create an empty 4x4 vector
    %rotate the sample 180 degrees so it's in the format d1d2d3... and easy
    %to reference
    flippedSample = rot90(sample,2);
    fourbit(:,1) = flippedSample(13:16); %put bits 13-16 of sample into row 1 of 
    %the 4x4 fourbit vector
    fourbit(:,2) = flippedSample(9:12); %see above, 9-12 into row 2 of 4x4
    fourbit(:,3) = flippedSample(5:8); %etc
    fourbit(:,4) = flippedSample(1:4);
    
    %fourbit %debug - check output
end