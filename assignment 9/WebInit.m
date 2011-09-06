close all
clear all

a=0;
b=15;
V = 2;
tspan=[a b];

alpha(1) = -30*pi/180;       % this is theta
alpha(2) = 0;                % omega
alpha(4) = -V*sind(-30);      % this is u
alpha(6) = V*cosd(-30);      % this is v
alpha(5) = 50*cosd(30) - 50*cosd(-30);                  % this is y
alpha(3) = 50*sind(-30);                  % this is x


h = 0.1;

[t,x] = WebEuler(@WebODE,tspan,alpha,h);
%[t45,x45]=ode45(@WebODE,tspan,); %check with ode45 code

plot(x(:,6),x(:,5));

% plot(t,x(:,1),'ko',t,x(:,3),'ro',t45,x45(:,1),'g*',t45,x45(:,3),'m-')
% hold on;
% plot(x(:,1),x(:,3),'b^');
% hold off;