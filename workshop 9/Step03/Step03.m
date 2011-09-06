close all
clear all

a=0;
b=8;
tspan=[a b];
alpha(1)=10;      % this is y0
alpha(2)=20;      % this is v0
h = 0.1;

[t,x]=MyEuler03(@MyODE03,tspan,alpha,h);
[t45,x45]=ode45(@MyODE03,tspan,alpha);      % check with ode45 code


% Plot the two sets of results on the same axes to compare.
plot(t,x(:,1),'ko',t,x(:,2),'ro',t45,x45(:,1),t45,x45(:,2))