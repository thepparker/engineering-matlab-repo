function dxdt=MyODE03(t,x)
% This function, given t and x must return dxdt. Note that for the 1-D
% projectile motion, dxdt is now a two element row vector

dxdt=zeros(2,1); %initialize variables

g=9.8;

L = 50-5*t;

dxdt(1)= x(2);        % INSERT EQUATION dy/dt=v HERE
dxdt(2)= (1/L)*(-2*-5*x(2) - g*sin(x(1)));        % INSERT EQUATION dv/dt=-g HERE

%omega(n+1) = omega(n) + ((1/L(n))*(-2*dLdt*omega(n) - g*sin(theta(n))))*h;