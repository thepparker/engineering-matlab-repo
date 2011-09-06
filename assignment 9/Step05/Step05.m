close all
clear all

a=0;
b=8;
tspan=[a b];
alpha(1)=0;                  % this is x
alpha(2)=20 * cosd(45);      % this is u
alpha(3)=0;                  % this is y
alpha(4)=20 * sind(45);      % this is v

h = 0.1;

[t,x]=MyEuler05(@MyODE05,tspan,alpha,h);
[t45,x45]=ode45(@MyODE05,tspan,alpha); %check with ode45 code

plot(t,x(:,1),'ko',t,x(:,3),'ro',t45,x45(:,1),'g*',t45,x45(:,3),'m-')
figure;
plot(x(:,1),x(:,3),'b^');