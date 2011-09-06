% the_secret_code.m
%
% Contains a secret message encoded using the homophonic substitution
% cipher given in Table 1 of Assignment 6.
%
% This script relies on having a working homophonic_decipher function from
% Question 3 (b).
%
% NOTE : You must show the output of this script as part of the answer for
% Question 3 (b).
%
% THIS SCRIPT DOES NOT NEED TO BE MODIFIED
%

% The secret message - stored as a cell array. This is because each line of 
% text may have a different amount of characters.
%

coded_message(1,:) = {[ 13     0    18     6    29     9    17     8    26    12    20    32     5    58    11 ...
    92     7    59    98     1    14    41    70    38    23    16    35    73    66    25 ...
    97    30    39    83    19    92    22    24    36    76    33     6    44    87]};

coded_message(2,:) =    {[17    0    92    29    14    60     9    35     1    98    21     5     8    97    10 ...
    7    40    92    52    54    61    42    98    16    31    10    72     77    20    11 ...
    97    38    26    24    12    19    44    92    46    18    15    90    21    98    30 ...
    23    55    97    31    99    37    51     0    89    32    58     6    92    95 ...
    5    57    22    87    87    87]};

coded_message(3,:) = {[22   21   92   18   9   27   14   98   32   11   97   12   58   1   29   16   60   92 ...
    0   5   70   87   98   73   97   34   33   83   59   26   52   92   17   23   7   8   6 ...
    39   20   98   88   97   89   47   19   92   30   50   24   98   48   44   36   43]};
    
coded_message(4,:) = {[32   92   60   9   11   98   19   22   12   29   17   97   36   20   35   0   18   6  ...
    92   23   14   21   98   70   97   13   5   8   26   1   92   16   34   24   58   98 ...
    40   33   38]};
    
coded_message(5,:) = {[17   23   14   18   92   32   98   22   16   20   97   15   9   27   70   24   87   ...
    92   73   58   11   30   12   59   43   26   21   98   33   49   69   29   47   13   ...
    75   44   1   97   85   0   92   39   83   19   98   6   5   7   3   97   37   54   72  ...
    4   36   92   53   66   45   98   50   67   88   35   52   97   41   56   46   76   17]};
    
coded_message(6,:) = {[13   0   22   38   9   29   14   1   92   17   5   98   23   32   27   97   70   92 ...  
    12   22   98   15   8   11   20   97   33   92   10   47   30   98   95   73   16   ... 
    41   24   97   7   31   92   62   35   53   38 ]};

coded_message(7,:) = {[60   32   17   23   92   20   39   14   98   29   16   9   26   70   2   12   30  ... 
    73   0   18   97   43   50   33   49   92   83   98   13   47   58   59   5   69   ...
    97   48   24   92   75   56   44   98   81   46   11   85   87   87   87   87   87   ...
    97   7   66   37   21   92   53   98   38   55   19   17 ]};

coded_message(8,:)  = {[32   92   26   0   11   17   98   22   21   97   27   5   15   7   92   9   18  ...
    1   98   12   37   19   54   97   22   52   92   29   33   38 ]};

coded_message(9,:)  = {[32   10   92   21   0   8   98   23   9   34   14   97   29   16   12   1   92   ...
    11   5   98   31   33   35   97   52   7   61   92   3   24   19   44   40   34   46   ...
    98   17   54   97   39   55   47   42   92   22   57   98   13   72   18   10   64   36   76]};
    
coded_message(10,:)  = {[32   92   17   23   70   18   4   98   15   9   22   73   14   97   83   11   ...
    92   19   16   28   21   87   98   88   97   1   29   0   5   26   92   24   34   44   ...
    35   52   20   93   27   46   98   39   55   97   30   12   37   4   36   92   33   48  ...
    7   8   43   98   4   47   40   58   53   61   6   50   97   22   67   38   76]};

% Print a header for the decoded message

fprintf(1,'\nThe decoded message is:\n');
fprintf(1,'------------------------------\n');

% Loop over each line of the coded message, pass it to the
% homophonic_decipher function to decipher and print the result.

for line_no = 1:size(coded_message,1)
    decoded_message = homophonic_decipher(coded_message{line_no,:});
    fprintf(1,'%s\n',decoded_message);
end

fprintf(1,'------------------------------\n\n');