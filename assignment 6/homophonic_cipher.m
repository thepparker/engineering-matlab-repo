function encrypted = homophonic_cipher(message)
    %Take a message and encode it using a homophonic cipher, which changes
    %a character depending on how many times it is used in the message.
    %Eg. First time "a" is used: a -> %
    %Second time "a" is used: a -> @

    encrypted = zeros(1,length(message)); %empty matrix
    %empty 28x1 matrix used to determine how many times a character has
    %been used
    numUsed = ones(28,1);
    load symbol_table.txt %load the symbol table
    x = 1;
    alphabetised = abs(message) - 96; %Create a vector with the alphabet as ASCII 1-26
    %for every character in the message
    while x <= length(message)
        %we have to do individual checks for space and period because their
        %ascii values are so far apart from eachother and the alphabet
        %if the character at message(x) is a space
        if message(x) == char(32)
            %if the next substition for a space in the symbol table is not -1
            if symbol_table(27,numUsed(27)) ~= -1
                encrypted(x) = symbol_table(27,numUsed(27)); %substitute into encrypted(x)
                numUsed(27) = numUsed(27) + 1; %num. times space has been used + 1
            else
                numUsed(27) = 1; %reset the num. times space has been used
                encrypted(x) = symbol_table(27,numUsed(27)); %first sub. again
                numUsed(27) = numUsed(27) + 1; %num. times space has been used + 1
            end
            x = x + 1;
            continue %go to the next character in message
        %if the character at message(x) is a period, do what we did for a space
        elseif message(x) == char(46)
            if symbol_table(28,numUsed(28)) ~= -1
                encrypted(x) = symbol_table(28,numUsed(28));
                numUsed(28) = numUsed(27) + 1;
            else
                numUsed(28) = 1;
                encrypted(x) = symbol_table(28,numUsed(28));
            end
            x = x + 1;
            continue %go to the next character in message
        end
        %else, we just substitute using the alphabet
        %alphabetised(x) will give us a number from 1-26 corresponding to
        %the letter it is. eg. a = 1, b = 2, etc. This lets us easily find
        %positions in the symbol table. numUsed(1), for example, will tell us
        %how many times a has been used and which column to look at in the
        %symbol table. With this we can easily index the symbol table and
        %substitute in predetermined values and create an encrypted string
        if symbol_table(alphabetised(x),numUsed(alphabetised(x))) ~= -1
            encrypted(x) = symbol_table(alphabetised(x),numUsed(alphabetised(x)));
            numUsed(alphabetised(x)) = numUsed(alphabetised(x)) + 1;
        else
            numUsed(alphabetised(x)) = 1;
            encrypted(x) = symbol_table(alphabetised(x),numUsed(alphabetised(x)));
            numUsed(alphabetised(x)) = numUsed(alphabetised(x)) + 1;
        end
        x = x + 1;
    end
    %numUsed %debug
end