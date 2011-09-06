close all
clear all

a=0;            %Start time
b=8;            %End time
tspan=[a b];    %timespan
alpha=1.0;      %initial position
h = 0.1;        % timestep


%%% We now need to call a new MyEuler function that takes an extra
%%% parameter - the name of the function that contains the ODEs you wish to
%%% solve.

%%% Note to pass a function name to another function, you need to put the @
%%% symbol infront of the function name. Here we are passing the name of
%%% the function that contains the ODE - MyODE02

[t,x]=MyEuler02(@MyODE02,tspan,alpha,h); % INSERT CODE HERE
%HINT : ode solver now has the form [t,x] = MyEuler02(function_name, timespan,initial
%value, timestep)

plot(t,x,'ko-');