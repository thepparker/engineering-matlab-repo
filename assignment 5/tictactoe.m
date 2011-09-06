function winner = tictactoe(start_row,start_col)
%TICTACTOE Simulates playing tic tac toe
%   This function simulates the game of tic tac toe on a 3x3 grid between
%   two players :
%
%   Player 1 is represented as a 1, Player 2 is represented as a -1, and an
%   empty square is represented by a 0.
%
%   Given a starting point (start_row, start_col) for Player 1, the 
%   moves are simulated in a figure window. Light blue represents empty 
%   squares, green represents Player 1, dark blue represents Player 2.
%
%   The winner is decided as the player who gets three of their 
%   symbols in a row - either vertically, horizontally or diagonally. 
%   The winner is returned as 1 for Player 1,-1 for Player 2 or 
%   0 for a draw.

    %Initialise the board
    board = zeros(3,3);     %Allocate space for the board
    board(start_row, start_col) = 1;    %Make Player 1's first move
    moves = 1;      %We have made the first move
    player = -1;    %Swap now to Player 2 (p1 already moved)
    winner = 0;     %We have no winners yet!
    show_board(board);  %Show the board
    
    %Loop while we don't have a winner and there are still moves left
    while (moves < 9 && winner == 0)
        %use moves to dictate player go (eg. -1 ^ 2 (2nd move) = 1, hence
        %player 1, then -1 ^ 3 (3rd move) = -1 (player 2), etc)
        player_move = player^moves; 
        board = make_move(board,player_move); %make a move and update board
        show_board(board); %show the updated board
        winner = check_win(board); %check if there's a winner
        moves = moves + 1; %increases moves, so we don't get stuck in loop
    end
    %self explanatory i'd think
    if winner == 1
        disp('Player 1 won!');
    elseif winner == -1
        disp('Player 2 won!');
    else
        disp('Draw!');
    end
end
