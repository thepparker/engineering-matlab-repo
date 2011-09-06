function corrected = correct(hcword)
% This function takes a 711 hamming codeword with an error in it, corrects 
% the error and then outputs the original 411 code
    corrected = zeros(4,1); %create an empty 4x1 vector for the decoded and 
    %corrected hamming codeword
    syndrome = zeros(1,3); %empty 3 bit syndrome vector
    %generate the syndrome bits
    %b4b3b2p3
    %b4b3b1p2
    %b4b2b1p1
    %xor(xor(b4,b3),xor(b2,p3))
    syndrome(1) = xor(xor(hcword(7,1),hcword(6,1)),xor(hcword(5,1),hcword(4,1)));
    %xor(xor(b4,b3),xor(b2,p2))
    syndrome(2) = xor(xor(hcword(7,1),hcword(6,1)),xor(hcword(3,1),hcword(2,1)));
    %xor(xor(b4,b2),xor(b1,p1))
    syndrome(3) = xor(xor(hcword(7,1),hcword(5,1)),xor(hcword(3,1),hcword(1,1))); 

    %convert the syndrome (s1s2s3) into a decimal value, so it can be used to
    %inde1 the incorrect bit in the hamming codeword
    decimalSyndrome = syndrome(1)*2^2 + syndrome(2)*2^1 + syndrome(3)*2^0;
    %only invert a bit if there is an error (decimalSyndrome > 0)
    if (decimalSyndrome) 
        hcword(decimalSyndrome,1) = ~hcword(decimalSyndrome,1); %invert the incorrect bit
    end

    %place the corresponding (b4b3b2b1 = c7c6c5c3) bits into the empty
    %vector
    corrected(4,1) = hcword(7,1); %c7 = b4
    corrected(3,1) = hcword(6,1); %c6 = b3
    corrected(2,1) = hcword(5,1); %c5 = b2
    corrected(1,1) = hcword(3,1); %c3 = b1
    
end