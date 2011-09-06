function encrypted = caeser_cipher(message,shift)
%Take a plain, lowercase, alphabetical string and shift it by shift amount
%in the alphabet eg. shift of 2, a -> c, h -> j
    x = 1;
    encrypted = zeros(1,length(message)); %empty 1xlength of message matrix
    %go through for every character in the message
    while x <= length(message)
       %don't do anything to spaces
       if message(x) == char(32) 
            encrypted(x) = 32;
            x = x + 1;
            continue %go to next loop
       end
       %put the ascii value of message(x) into encrypted(x) with shift
       encrypted(x) = message(x) + shift;
       %if encrypted(x) is outside the ascii alphabet, wrap it
       if encrypted(x) > 122
            encrypted(x) = encrypted(x) - 26;
       end
       x = x + 1;
    end
    %print output to console
    fprintf('Encoded string with shift of %d: %s\n',shift,char(encrypted));
end