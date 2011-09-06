function [ graph ] = plotgraph(theta)

    A = 4000.*sind(35)./sind(theta+160);
    B = 4000.*sind(35)./sind(165-theta);
    plot(theta,A,'x')
    hold
    plot(theta,B,'o') 
end