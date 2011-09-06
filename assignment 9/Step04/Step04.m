close all
clear all

a=0;
b=8;
tspan=[a b];
alpha(1)=0;                  % this is x0
alpha(2)=20 * cosd(45);      % this is u0
alpha(3)=0;                  % this is y0
alpha(4)=20 * sind(45);      % this is v0

h = 0.1;

[t,x]=MyEuler04(@MyODE04,tspan,alpha,h);
[t45,x45]=ode45(@MyODE04,tspan,alpha); %check with ode45 code

plot(t,x(:,1),'ko',t,x(:,3),'ro',t45,x45(:,1),'g*',t45,x45(:,3),'m-')