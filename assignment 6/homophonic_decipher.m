function deciphered_text = homophonic_decipher(ciphertext)
%Take a homophonic cipher encrypted string and decrypt it
    deciphered_text = zeros(1,length(ciphertext));
    load symbol_table.txt
    %for every character in ciphertext
    for x = 1:length(ciphertext)
        %find the position in the symbol table that corresponds to the
        %character at position x in the ciphertext matrix. Every character
        %in the symbol table is unique, therefore there can only be 1 
        %position where the character matches a position in the symbol table
        
        %a column where a 1 will correspond to the row position of the
        %character in the symbol table. eg. a 1 in the first row means the
        %character is 'a', a 1 in the second row means the character is 'b'
        symbolTableKey = any(symbol_table == ciphertext(x),2);
        for y = 1:length(symbolTableKey)
            if symbolTableKey(y)
                if y == 27
                    %subtract 96 because we add 96 later to move the other
                    %characters into the ascii alphabet and don't want
                    %spaces and periods to turn into something else
                    deciphered_text(x) = 32 - 96;
                elseif y == 28
                    deciphered_text(x) = 46 - 96;
                else
                    %the char at position x must be y (1-26,a-z)
                    deciphered_text(x) = y;
                end
            end
        end
    end
    %add 96 to move our characters to the ascii alphabet and turn our row
    %of integers into a readable string
    deciphered_text = char(deciphered_text + 96);
end