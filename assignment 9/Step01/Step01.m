close all
clear all   %Good MATLAB practise to close windows and clear varibles to 
            %ensure your calculations do not get mixed up

%********************************
%ENTERING VARIABLES AND CONSTANTS
%********************************

a=0; %Start time
b=8; %End time
tspan=[a b]; %timespan
alpha=1.0; %initial position
h = 0.1;    % timestep

%*********************
%ENTERING CALCULATIONS
%*********************

[t,x]=MyEuler01(tspan,alpha,h); 
%HINT : ode solver must have the form [t,x] = MyEuler01(timespan,initial value, timestep)


%******************
%DISPLAYING RESULTS
%******************

plot(t,x,'ko-');