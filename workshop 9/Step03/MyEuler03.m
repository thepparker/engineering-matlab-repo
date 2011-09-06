function [t,x]=MyEuler03(ode,tspan,alpha,h)

a=tspan(1);
b=tspan(2);

t=a:h:b;

N=length(t)-1;

x(1,:)=alpha;           %setting initial conditions

% Implement Euler method. This time the external function 'ode' is set up
% to return a row vector dxdt to handle problems with multiple variables 
% (e.g. 1-D projectile motion).

for n=1:N
    dxdt=ode(t(n),x(n,:));
    dxdt=dxdt';             % Adjust dimensions for multiplying in next line
    %x(n+1,:)
    %x(n,:);
    
    x(n+1,:)=x(n,:) + dxdt.*h;               % INSERT EQUATION HERE
end