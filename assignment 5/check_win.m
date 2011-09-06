function winner = check_win(board)
%CHECK_WIN Determine whether a player has a winning game in tic tac toe 
%on a 3x3 board.
%   The winner is decided as the player who gets three of their symbols 
%   in a row - either vertically, horizontally or diagonally. 
%   The winner is returned as 1 for Player 1,-1 for Player 2 or 
%   0 for a draw.
    winner = 0; %game is a draw unless stated otherwise
    p2Win = -3; %sum of row/column/diagonal for player 2 to win
    p1Win = 3; %sum of row/column/diagonal for player 1 to win
    boardSize = length(board); %should always be 3
    
    %just sum the diagonals and see if they're equal to -3 (player2) or 3
    %(player 1)
    %use returns to return the winner variable if a winner is found, rather 
    %than evaluate the rest of the checks
    if sum(diag(board)) == p2Win
        winner = -1;
        return
    elseif sum(diag(fliplr(board))) == p2Win
        winner = -1;
        return
    elseif sum(diag(board)) == p1Win
        winner = 1;
        return
    elseif sum(diag(fliplr(board))) == p1Win
        winner = 1;
        return
    end
    
    %sum rows and columns and check for winner
    for x = 1:boardSize
        if sum(board(:,x)) == p1Win
            winner = 1;
            return
        elseif sum(board(:,x)) == p2Win
            winner = -1;
            return
        elseif sum(board(x,:)) == p1Win
            winner = 1;
            return
        elseif sum(board(x,:)) == p2Win
            winner = -1;
            return
        end
    end 
end

