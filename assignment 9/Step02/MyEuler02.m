function [t,x]=MyEuler02(ode,tspan,alpha, h)

%WILL RETURN [t,x] SO YOU MUST HAVE EQUATIONS IN THE FUNCTION WHICH SOLVE
%FOR t and x.

a=tspan(1);
b=tspan(2);

t=a:h:b;

N=length(t)-1;

x(1) = alpha;                     %INSERT VARIABLE - setting initial x value

% Implement Euler method. This time call the external function 'ode' passed
% into the MyEuler02 function to handle the calculation of the derivative.

for n=1:N
    dxdt=ode(t(n),x(n));    % Use function 'ode' to get dxdt
    x(n+1)=x(n) + dxdt*h;            % INSERT EQUATION HERE
    
end
x
