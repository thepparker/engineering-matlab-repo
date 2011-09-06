function playerScore = calculate_score(wins,losses,draws)
% Function to calculate a person's "score" based on the number of wins,
% losses and draws they've had. All inputs are scalar (only 1 number), not
% a vector.
% A win is worth 3 points, a loss 1 point and a draw 2 points (but can be
% changed easily)

    playerScore = 0;
    winPoints = 3;
    lossPoints = 1;
    drawPoints = 2;
    
    if wins
        playerScore = playerScore + wins*winPoints;
    end
    if losses
        playerScore = playerScore + losses*lossPoints;
    end
    if draws
        playerScore = playerScore + draws*drawPoints;
    end
end