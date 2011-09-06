%CREATING A FUNCTION TO UTILISE THE EULER METHOD

function [t,x]=MyEuler01(tspan,alpha,h)
%FUNCTION NAME MUST CORRESPOND TO FILE NAME
%WILL RETURN [t,x] SO YOU MUST HAVE EQUATIONS IN THE FUNCTION WHICH SOLVE
%FOR t and x.



a=tspan(1);     %takes the value of 'a' from your run script
b=tspan(2);     %takes the value of 'b' from your run script

t=a:h:b;        %create 't' values

N=length(t)-1;

x(1) = alpha;           %INSERT VARIABLE - setting initial x value



%Using a for loop to iterate through the different values of 't' and using
%Euler method to determine values of x
for n=1:length(t)-1
   x(n+1) = x(n) + (-x(n))*h;
end