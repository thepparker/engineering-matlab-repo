function dxdt=WebODE(t,x)
% This function, given t and x must return dxdt. Note that for the 2-D
% projectile motion, dxdt is now a four element row vector

dxdt=zeros(4,1); %initialize variables

g=9.8;
mass = 80;
Cd = 0.5;
density = 1.29;
area = 0.85;

L = 50 - 2*t;

dxdt(1) = x(3);      % dx/dt
dxdt(2) = x(4);      % dy/dt
dxdt(3) = x(2);  % dtheta/dt
dxdt(4) = (1/L)*(-2*-5*x(2) - g*sin(x(1))); %omega