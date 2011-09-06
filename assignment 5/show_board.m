function show_board(board)
%SHOW_BOARD Show the 3x3 game board for tic tac toe
%   Light blue represents empty squares, green represents Player 1, dark
%   blue represents Player 2

image((board+2)*10);        % Scale the colormap for some separation of 
                            % colours
drawnow;

% Slow things down so we can see what is happening on the screen
pause(0.5);

end

