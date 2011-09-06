function dxdt=MyODE04(t,x)
% This function, given t and x must return dxdt. Note that for the 2-D
% projectile motion, dxdt is now a four element row vector

dxdt=zeros(4,1); %initialize variables

% See the workshop handout for the ordering of the components of the vector
% x

g=9.8;

% The 2-D equations of motion of a projectile (neglecting drag)

dxdt(1) = x(2);      % INSERT EQUATION HERE for dx/dt=u
dxdt(2) = 0;      % INSERT EQUATION HERE for du/dt=0
dxdt(3) = -g*t;      % INSERT EQUATION HERE for dy/dt=v v = u + at = 0 + -9.8t
dxdt(4) = -g;       % INSERT EQUATION HERE dv/dt=-g