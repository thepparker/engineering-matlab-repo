close all
clear all

a=0;
b=8;
tspan=[a b];
alpha(1)=-30*pi/180;      % this is theta (radians, because omega is in rad)
alpha(2)=0;      % this is omega
h = 0.01;

[t,x]=MyEuler03(@MyODE03,tspan,alpha,h);
[t45,x45]=ode45(@MyODE03,tspan,alpha);      % check with ode45 code

t
x(:,1)
xco = (50-20*t)*sin(x(:,1));
yco = 50*cos(x(:,1)) - (50-20*t)*cos(x(:,1));

plot(xco,yco);

% Plot the two sets of results on the same axes to compare.
%plot(t,x(:,1),'k-',t,x(:,2),'r-',t45,x45(:,1),'b*',t45,x45(:,2),'g^')