function caeser_break(message)
%Take a caeser cipher encoded string and brute force it, printing all
%possible shift values that could have been used and the original message
%corresponding to each shift value

    %headings
    fprintf('%s\n%s\n','Shift | Decoded Text','------|----------------------------------------');
    for y = 1:25 %for every possible shift combination
        %y = 2; debug
        decrypted = zeros(1,length(message)); %empty matrix
        x = 1;
        %loop through every character in message for shift amount y
        while x <= length(message)
            %skip spaces
            if message(x) == char(32)
                decrypted(x) = 32;
                x = x + 1;
                continue %go to next character
            else
                %move the character in message back by shift y
                decrypted(x) = message(x) - y;
            end
            %if the characater is outside the ascii alphabet, wrap it
            if decrypted(x) < 97
                decrypted(x) = decrypted(x) + 26;
            end
            x = x + 1;
        end
        %decrypted %debug
        %print to console
        fprintf('%5d | %s \n',y,char(decrypted));
    end
end