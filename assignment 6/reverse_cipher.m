function reversed = reverse_cipher(string)
%Use a simple reverse cipher to encrypt a string
    reversed = zeros(1,length(string)); %empty 1xlength of string vector
    x = length(string);
    y = 1;
    %go backwards through the string for every character in it
    while x >= 1
       reversed(y) = string(x); %place string character x at pos y in reversed
       y = y + 1; %move to the next position in the reversed string
       x = x - 1; %move to the next position in the input string
    end
    %print the encoded message to the console (default fprintf output)
    fprintf('The coded message is: %s\n',char(reversed));
end