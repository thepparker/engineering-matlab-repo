function [t,x]=MyEuler04(ode,tspan,alpha,h)

a=tspan(1);
b=tspan(2);

t=a:h:b;

N=length(t)-1;

x(1,:)=alpha;               %setting initial conditions

for n=1:N
    dxdt=ode(t(n),x(n,:));
    dxdt=dxdt';
    x(n+1,:)=x(n,:) + dxdt.*h;  %INSERT EQUATION HERE (same as Task 3!)
end